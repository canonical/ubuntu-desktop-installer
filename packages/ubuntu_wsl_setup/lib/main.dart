import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:ubuntu_wizard/app.dart';
import 'package:ubuntu_wizard/utils.dart';

import 'app.dart';
import 'installing_state.dart';

Future<void> main(List<String> args) async {
  final options = parseCommandLine(args, onPopulateOptions: (parser) {
    parser.addFlag('reconfigure');
    parser.addOption(
      'prefill',
      valueHelp: 'prefill',
      help: '''
Path of the YAML file containing prefill information, which
feeds the installer with partial information to prefill the
screens, yet allowing user to overwrite any of those during setup.
  ''',
    );
  })!;
  final variant = ValueNotifier<Variant?>(null);
  final liveRun = isLiveRun(options);
  final serverMode = liveRun ? ServerMode.LIVE : ServerMode.DRY_RUN;
  final subiquityPath = await getSubiquityPath()
      .then((dir) => Directory(dir).existsSync() ? dir : null);
  final endpoint = await defaultEndpoint(serverMode);
  final process = SubiquityProcess.python(
    'system_setup.cmd.server',
    serverMode: serverMode,
    subiquityPath: subiquityPath,
  );
  List<String>? serverArgs;
  if (options['prefill'] != null) {
    serverArgs = ['--prefill', options['prefill']];
  }
  final subiquityMonitor = SubiquityStatusMonitor();
  registerService(UrlLauncher.new);
  runWizardApp(
    ValueListenableBuilder<Variant?>(
      valueListenable: variant,
      builder: (context, value, child) {
        return UbuntuWslSetupApp(
          variant: value,
          initialRoute: options['initial-route'],
        );
      },
    ),
    options: options,
    subiquityClient: SubiquityClient(),
    subiquityServer: SubiquityServer(process: process, endpoint: endpoint),
    subiquityMonitor: subiquityMonitor,
    onInitSubiquity: (client) {
      client.variant().then((value) {
        variant.value = value;
        if (value == Variant.WSL_SETUP) {
          subiquityMonitor.onStatusChanged.listen((status) {
            setWindowClosable(status?.state.isInstalling != true);
          });
        }
      });
      client.markConfigured(['filesystem']);
    },
    serverArgs: serverArgs,
    serverEnvironment: {
      if (!liveRun && options['reconfigure'] == true) 'DRYRUN_RECONFIG': 'true',
    },
  );
}
