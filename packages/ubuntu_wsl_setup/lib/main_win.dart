import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:ubuntu_wizard/app.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wsl_setup/services/tcp_socket.dart';

import 'app.dart';
import 'args_common.dart';
import 'installing_state.dart';
import 'routes.dart';
import 'services/journal.dart';

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
  })!;
  final variant = ValueNotifier<Variant?>(null);
  final liveRun = isLiveRun(options);
  final serverMode = liveRun ? ServerMode.LIVE : ServerMode.DRY_RUN;
  final tcpService = TcpSocketService();
  final socketHolder = await tcpService.getRandomPortSocket();
  // TODO: Handle the null case.
  // That would mean port exaustion and the simplest way to solve it is by
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
    // TODO: Replace by a real future completed when distro is registered.
    defer: Future.delayed(const Duration(seconds: 80)),
    onProcessStart: socketHolder.close,
  );

  final serverArgs = serverArgsFromOptions(options);
  final subiquityClient = SubiquityClient();
  final subiquityMonitor = SubiquityStatusMonitor();
  registerService(UrlLauncher.new);
  registerService(() => JournalService(source: decode(stdin)));

  String? initialRoute;
  if (options['reconfigure'] == false && options['initial-route'] == null) {
    initialRoute = Routes.installationSlides;
  }

  await runWizardApp(
    ValueListenableBuilder<Variant?>(
      valueListenable: variant,
      builder: (context, value, child) {
        return UbuntuWslSetupApp(
          variant: value,
          initialRoute: initialRoute,
        );
      },
    ),
    options: options,
    subiquityClient: subiquityClient,
    subiquityServer: SubiquityServer(process: process, endpoint: endpoint),
    subiquityMonitor: subiquityMonitor,
    serverArgs: serverArgs,
    serverEnvironment: {
      if (!liveRun && options['reconfigure'] == true) 'DRYRUN_RECONFIG': 'true',
    },
  );
  await subiquityClient.variant().then((value) {
    variant.value = value;
    if (value == Variant.WSL_SETUP) {
      subiquityMonitor.onStatusChanged.listen((status) {
        setWindowClosable(status?.state.isInstalling != true);
      });
    }
  });
  await subiquityClient.markConfigured(['filesystem']);
}
