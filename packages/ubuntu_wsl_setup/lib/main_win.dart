import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wsl_setup/services/language_fallback.dart';
import 'package:ubuntu_wsl_setup/services/tcp_socket.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'app.dart';
import 'app_model.dart';
import 'args_common.dart';
import 'routes.dart';
import 'services/journal.dart';
import 'services/named_event.dart';

Future<void> main(List<String> args) async {
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
  final window = await YaruWindow.ensureInitialized();

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

  return runWslSetupApp(
    appModel: ValueNotifier<AppModel>(
      AppModel(routeFromOptions: initialRoute, showSplashScreen: isReconf),
    ),
    serverArgs: serverArgsFromOptions(options),
    serverEnvironment: {
      if (!liveRun && isReconf) 'DRYRUN_RECONFIG': 'true',
    },
  );
}

class WslSetupEvents {
  final NamedEvent registration;
  final NamedEvent closeOobe;

  WslSetupEvents({required this.registration, required this.closeOobe});
}
