import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:ubuntu_utils/ubuntu_utils.dart';

import 'app.dart';
import 'app_model.dart';
import 'args_common.dart';
import 'services/language_fallback.dart';

Future<void> main(List<String> args) async {
  final options = parseCommandLine(args, onPopulateOptions: (parser) {
    addCommonCliOptions(parser);
    addLoggingOptions(parser);
  })!;
  setupLogger(options);

  final liveRun = options['dry-run'] != true;
  final isReconf = options['reconfigure'] == true;
  final serverMode = liveRun ? ServerMode.LIVE : ServerMode.DRY_RUN;
  final subiquityPath = await getSubiquityPath()
      .then((dir) => Directory(dir).existsSync() ? dir : null);
  final endpoint = await defaultEndpoint(serverMode);
  final process = SubiquityProcess.python(
    'system_setup.cmd.server',
    serverMode: serverMode,
    subiquityPath: subiquityPath,
  );

  registerService(SubiquityClient.new);
  registerService(() => SubiquityServer(process: process, endpoint: endpoint));
  registerService(SubiquityStatusMonitor.new);
  registerService(UrlLauncher.new);
  registerService(LanguageFallbackService.linux);

  return runWslSetupApp(
    appModel: ValueNotifier<AppModel>(
      AppModel(routeFromOptions: options['initial-route']),
    ),
    serverArgs: serverArgsFromOptions(options),
    serverEnvironment: {
      if (!liveRun && isReconf) 'DRYRUN_RECONFIG': 'true',
    },
  );
}
