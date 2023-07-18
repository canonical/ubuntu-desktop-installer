import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timezone_map/timezone_map.dart';
import 'package:ubuntu_init/ubuntu_init.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';
import 'package:ubuntu_provision/ubuntu_provision.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:ubuntu_utils/ubuntu_utils.dart';
import 'package:ubuntu_welcome/l10n.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

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

    var geo = tryGetService<GeoService>();
    if (geo == null) {
      final geodata = Geodata.asset();
      final geoname = Geoname.ubuntu(geodata: geodata);
      geo = GeoService(sources: [geodata, geoname]);
      registerServiceInstance(geo);
    }
    await geo.init();

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
