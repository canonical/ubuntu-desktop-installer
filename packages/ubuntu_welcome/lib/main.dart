import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timezone_map/timezone_map.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';
import 'package:ubuntu_welcome/l10n.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'services.dart';
import 'welcome_wizard.dart';

Future<void> main(List<String> args) async {
  final options = parseCommandLine(args, onPopulateOptions: (parser) {
    addLoggingOptions(parser);
  })!;
  setupLogger(options);

  tryRegisterService<ActiveDirectoryService>(RealmdActiveDirectoryService.new);
  tryRegisterService<IdentityService>(XdgIdentityService.new);
  tryRegisterService<KeyboardService>(XdgKeyboardService.new);
  tryRegisterService<LocaleService>(XdgLocaleService.new);
  tryRegisterService<NetworkService>(NetworkService.new);
  tryRegisterService<TimezoneService>(XdgTimezoneService.new);

  final log = Logger();

  return runZonedGuarded(() async {
    FlutterError.onError = (error) {
      log.error('Unhandled exception', error.exception, error.stack);
    };

    await YaruWindowTitleBar.ensureInitialized();

    await initDefaultLocale();

    var geo = tryGetService<GeoService>();
    if (geo == null) {
      final geodata = Geodata.asset();
      final geoname = Geoname.ubuntu(geodata: geodata);
      geo = GeoService(sources: [geodata, geoname]);
      registerServiceInstance(geo);
    }
    await geo.init();

    runApp(ProviderScope(
      child: WizardApp(
        appName: 'ubuntu_welcome',
        onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
        home: const WelcomeWizard(),
      ),
    ));
  }, (error, stack) => log.error('Unhandled exception', error, stack));
}
