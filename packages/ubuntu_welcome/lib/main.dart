import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_init/ubuntu_init.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';
import 'package:ubuntu_provision/ubuntu_provision.dart';
import 'package:ubuntu_utils/ubuntu_utils.dart';
import 'package:ubuntu_welcome/l10n.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

Future<void> main(List<String> args) async {
  final options = parseCommandLine(args, onPopulateOptions: (parser) {
    addLoggingOptions(parser);
  })!;
  setupLogger(options);

  final log = Logger();

  return runZonedGuarded(() async {
    FlutterError.onError = (error) {
      log.error('Unhandled exception', error.exception, error.stack);
    };

    await YaruWindowTitleBar.ensureInitialized();

    await registerInitServices();

    runApp(ProviderScope(
      child: Consumer(
        builder: (context, ref, child) => WizardApp(
          locale: ref.watch(localeProvider),
          onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
          localizationsDelegates: localizationsDelegates,
          supportedLocales: supportedLocales,
          home: DefaultAssetBundle(
            bundle: ProxyAssetBundle(rootBundle, package: 'ubuntu_welcome'),
            child: const InitWizard(),
          ),
        ),
      ),
    ));
  }, (error, stack) => log.error('Unhandled exception', error, stack));
}
