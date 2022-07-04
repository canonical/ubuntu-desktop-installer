import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:ubuntu_wizard/app.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wsl_setup/main_common.dart';

import 'app.dart';
import 'installing_state.dart';

Future<void> main(List<String> args) async {
  final options = parseCommandLine(args, onPopulateOptions: (parser) {
    addCommonCliOptions(parser);
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
  final serverArgs = serverArgsFromOptions(options);

  final subiquityClient = SubiquityClient();
  final subiquityMonitor = SubiquityStatusMonitor();
  registerService(UrlLauncher.new);
  await runWizardApp(
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
