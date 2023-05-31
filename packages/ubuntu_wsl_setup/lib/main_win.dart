import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:ubuntu_wizard/app.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wsl_setup/services/language_fallback.dart';
import 'package:ubuntu_wsl_setup/services/tcp_socket.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'app.dart';
import 'app_model.dart';
import 'args_common.dart';
import 'installing_state.dart';
import 'is_locale_set.dart';
import 'routes.dart';
import 'services/journal.dart';
import 'services/named_event.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  final window = await YaruWindow.ensureInitialized();
  final options = parseCommandLine(args, onPopulateOptions: (parser) {
    addCommonCliOptions(parser);
    parser.addOption(
      'distro-name',
      valueHelp: 'WSL Distribution name',
      help: 'The name under which the distribution is being registered on WSL.',
      defaultsTo: const String.fromEnvironment(
        'DISTRONAME',
        defaultValue: 'Ubuntu-Preview',
      ),
    );
    addLoggingOptions(parser);
  })!;
  setupLogger(options);

  final liveRun = options['dry-run'] != true;
  final isReconf = options['reconfigure'] == true;
  final serverMode = liveRun ? ServerMode.LIVE : ServerMode.DRY_RUN;
  final tcpService = TcpSocketService();
  final socketHolder = await tcpService.getRandomPortSocket();

  final events = isReconf
      ? null
      : WslSetupEvents(
          registration: NamedEvent(
            'Local\\${options["distro-name"]}-registered',
          ),
          closeOobe: NamedEvent(
            'Local\\${options["distro-name"]}-close-oobe',
          )..future.then((_) => window.close()),
        );

  // TODO: Handle the null case.
  // That would mean port exhaustion and the simplest way to solve it is by
  // rebooting the Windows machine. Since at this point we would have a blank
  // window in front of the user, we should develop a 1-screen app advising the
  // user to reboot. Design team review is required for that and will be handled
  // on a separate PR.
  final endpoint = Endpoint.localhost(socketHolder!.port);
  final process = SubiquityProcess.wsl(
    options['distro-name'],
    'sudo',
    user: 'root',
    wslenv: 'DRYRUN_RECONFIG',
    serverMode: serverMode,
    args: [
      '/usr/libexec/wsl-setup',
      '--server-only',
      '--tcp-port=${socketHolder.port}'
    ],
    defer: events?.registration.future,
    onProcessStart: socketHolder.close,
  );

  final serverArgs = serverArgsFromOptions(options);
  registerService(SubiquityClient.new);
  registerService(() => SubiquityServer(process: process, endpoint: endpoint));
  registerService(SubiquityStatusMonitor.new);
  registerService(UrlLauncher.new);
  registerService(LanguageFallbackService.win);
  if (!isReconf) {
    registerService(() => JournalService(source: decode(stdin)));
  }

  String? initialRoute;
  if (!isReconf && options['initial-route'] == null) {
    initialRoute = Routes.installationSlides;
  }
  final appModel = ValueNotifier<AppModel>(
    AppModel(routeFromOptions: initialRoute, showSplashScreen: isReconf),
  );

  await runWizardApp(
    ValueListenableProvider<AppModel>.value(
      value: appModel,
      child: const UbuntuWslSetupApp(),
    ),
    options: options,
    subiquityClient: getService<SubiquityClient>(),
    subiquityServer: getService<SubiquityServer>(),
    subiquityMonitor: getService<SubiquityStatusMonitor>(),
    serverArgs: serverArgs,
    serverEnvironment: {
      if (!liveRun && isReconf) 'DRYRUN_RECONFIG': 'true',
    },
  );
  final subiquityClient = getService<SubiquityClient>();
  await subiquityClient.getVariant().then((value) {
    if (value == Variant.WSL_SETUP) {
      isLocaleSet(subiquityClient).then(
        (isSet) => appModel.value =
            appModel.value.copyWith(variant: value, languageAlreadySet: isSet),
      );
      final subiquityMonitor = getService<SubiquityStatusMonitor>();
      subiquityMonitor.onStatusChanged.listen((status) {
        window.setClosable(status?.state.isInstalling != true);
      });
    } else {
      appModel.value = appModel.value.copyWith(variant: value);
    }
  });
}

class WslSetupEvents {
  final NamedEvent registration;
  final NamedEvent closeOobe;

  WslSetupEvents({required this.registration, required this.closeOobe});
}
