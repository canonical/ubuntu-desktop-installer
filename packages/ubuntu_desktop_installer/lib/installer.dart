import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';
import 'package:timezone_map/timezone_map.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'installer/installer_wizard.dart';
import 'l10n.dart';
import 'providers.dart';
import 'services.dart';
import 'slides.dart';

export 'installer/installer_wizard.dart';
export 'providers.dart';
export 'slides.dart';

Future<void> runInstallerApp(
  List<String> args, {
  List<String>? routes,
  List<WidgetBuilder>? slides,
  ThemeData? theme,
  ThemeData? darkTheme,
}) async {
  final options = parseCommandLine(args, onPopulateOptions: (parser) {
    parser.addFlag('dry-run',
        defaultsTo: Platform.environment['LIVE_RUN'] != '1',
        help: 'Run Subiquity server in dry-run mode');
    parser.addOption('machine-config',
        valueHelp: 'path',
        defaultsTo: 'examples/simple.json',
        help: 'Path of the machine config (dry-run only)');
    parser.addOption('source-catalog',
        valueHelp: 'path',
        defaultsTo: 'examples/desktop-sources.yaml',
        help: 'Path of the source catalog (dry-run only)');
    parser.addFlag('welcome', aliases: ['try-or-install'], hide: true);
    parser.addOption('routes',
        valueHelp: 'path',
        help: 'A comma-separated list of page routes',
        hide: true);
    addLoggingOptions(parser);
  })!;
  final liveRun = options['dry-run'] != true;
  setupLogger(options, path: liveRun ? '/var/log/installer' : null);

  final serverMode = liveRun ? ServerMode.LIVE : ServerMode.DRY_RUN;
  final subiquityPath = await getSubiquityPath()
      .then((dir) => Directory(dir).existsSync() ? dir : null);
  final endpoint = await defaultEndpoint(serverMode);
  final process = liveRun
      ? null
      : SubiquityProcess.python(
          'subiquity.cmd.server',
          serverMode: ServerMode.DRY_RUN,
          subiquityPath: subiquityPath,
        );

  final baseName = p.basename(Platform.resolvedExecutable);

  // conditional registration if not already registered by flavors or tests
  tryRegisterService<ActiveDirectoryService>(
      () => SubiquityActiveDirectoryService(getService<SubiquityClient>()));
  tryRegisterService(() => ConfigService('/tmp/$baseName.conf'));
  tryRegisterService<DesktopService>(() => GnomeService());
  tryRegisterService<IdentityService>(() => SubiquityIdentityService(
      getService<SubiquityClient>(), getService<ConfigService>()));
  tryRegisterService<InstallerService>(() => InstallerService(
      getService<SubiquityClient>(),
      routes: options['routes']?.split(',') ?? routes));
  tryRegisterService(JournalService.new);
  tryRegisterService<KeyboardService>(
      () => SubiquityKeyboardService(getService<SubiquityClient>()));
  tryRegisterService<LocaleService>(
      () => SubiquityLocaleService(getService<SubiquityClient>()));
  tryRegisterService<NetworkService>(
      () => SubiquityNetworkService(getService<SubiquityClient>()));
  tryRegisterService(PowerService.new);
  tryRegisterService(ProductService.new);
  tryRegisterService<SessionService>(
      () => SubiquitySessionService(getService<SubiquityClient>()));
  if (liveRun) tryRegisterService(SoundService.new);
  tryRegisterService(() => StorageService(getService<SubiquityClient>()));
  tryRegisterService(SubiquityClient.new);
  tryRegisterService(
      () => SubiquityServer(process: process, endpoint: endpoint));
  tryRegisterService(TelemetryService.new);
  tryRegisterService<TimezoneService>(
      () => SubiquityTimezoneService(getService<SubiquityClient>()));
  tryRegisterService(UdevService.new);
  tryRegisterService(UrlLauncher.new);

  final initialized = getService<SubiquityServer>().start(args: [
    if (options['machine-config'] != null)
      '--machine-config=${options['machine-config']}',
    if (options['source-catalog'] != null)
      '--source-catalog=${options['source-catalog']}',
    '--storage-version=2',
    ...options.rest,
  ]).then(_initInstallerApp);

  final log = Logger();

  runZonedGuarded(() async {
    FlutterError.onError = (error) {
      log.error('Unhandled exception', error.exception, error.stack);
    };

    final window = await YaruWindow.ensureInitialized();
    await window.onClose(_closeInstallerApp);

    runApp(ProviderScope(
      child: SlidesContext(
        slides: slides ?? defaultSlides,
        child: Consumer(
          builder: (context, ref, child) => WizardApp(
            appName: 'ubuntu_desktop_installer',
            theme: theme,
            darkTheme: darkTheme,
            onGenerateTitle: (context) {
              final flavor = ref.watch(flavorProvider);
              return AppLocalizations.of(context).windowTitle(flavor.name);
            },
            locale: ref.watch(localeProvider),
            localizationsDelegates: localizationsDelegates,
            supportedLocales: supportedLocales,
            home: InstallerWizard(
              welcome: options['welcome'],
            ),
          ),
        ),
      ),
    ));
  }, (error, stack) => log.error('Unhandled exception', error, stack));

  return initialized;
}

Future<void> _initInstallerApp(Endpoint endpoint) async {
  getService<SubiquityClient>().open(endpoint);

  await getService<InstallerService>().init();
  await getService<DesktopService>().inhibit();

  var geo = tryGetService<GeoService>();
  if (geo == null) {
    final geodata = Geodata.asset();
    final geoname = Geoname.ubuntu(geodata: geodata);
    geo = GeoService(sources: [geodata, geoname]);
    registerServiceInstance(geo);
  }
  await geo.init();

  final telemetry = getService<TelemetryService>();
  await telemetry.init({
    'Type': 'Flutter',
    'OEM': false,
    'Media': getService<ProductService>().getProductInfo().toString(),
  });
}

Future<bool> _closeInstallerApp() async {
  await getService<SubiquityClient>().close();
  await getService<SubiquityServer>().stop();
  await getService<DesktopService>().close();
  return true;
}
