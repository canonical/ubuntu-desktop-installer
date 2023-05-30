import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';
import 'package:ubuntu_welcome/l10n.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

Future<void> main(List<String> args) async {
  final options = parseCommandLine(args, onPopulateOptions: (parser) {
    addLoggingOptions(parser);
  })!;
  setupLogger(options);

  final log = Logger();

  runZonedGuarded(() async {
    FlutterError.onError = (error) {
      log.error('Unhandled exception', error.exception, error.stack);
    };

    await YaruWindowTitleBar.ensureInitialized();

    await setupAppLocalizations();

    runApp(WizardApp(
      appName: 'ubuntu_welcome',
      onGenerateTitle: (context, _) => AppLocalizations.of(context).windowTitle,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      home: const Scaffold(
        appBar: YaruWindowTitleBar(),
      ),
    ));
  }, (error, stack) => log.error('Unhandled exception', error, stack));
}
