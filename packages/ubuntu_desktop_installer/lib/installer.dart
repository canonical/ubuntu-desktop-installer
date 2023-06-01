import 'dart:async';
import 'dart:io';

import 'package:dartx/dartx.dart';
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

import 'l10n.dart';
import 'pages.dart';
import 'routes.dart';
import 'services.dart';
import 'slides.dart';

export 'package:ubuntu_wizard/widgets.dart' show FlavorData;
export 'slides.dart';

Future<void> runInstallerApp(
  List<String> args, {
  FlavorData? flavor,
  List<WidgetBuilder>? slides,
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
    addLoggingOptions(parser);
  })!;
  setupLogger(options, path: '/var/log/installer');

  final liveRun = options['dry-run'] != true;
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
  if (liveRun) tryRegisterService(SoundService.new);
  tryRegisterService<ActiveDirectoryService>(
      () => SubiquityActiveDirectoryService(getService<SubiquityClient>()));
  tryRegisterService<AppService>(
      () => InstallerAppService(getService<SubiquityClient>()));
  tryRegisterService(() => ConfigService('/tmp/$baseName.conf'));
  tryRegisterService<DesktopService>(() => GnomeService());
  tryRegisterService<IdentityService>(
      () => SubiquityIdentityService(getService<SubiquityClient>()));
  tryRegisterService(JournalService.new);
  tryRegisterService<KeyboardService>(
      () => SubiquityKeyboardService(getService<SubiquityClient>()));
  tryRegisterService<LocaleService>(
      () => SubiquityLocaleService(getService<SubiquityClient>()));
  tryRegisterService(() => NetworkService(getService<SubiquityClient>()));
  tryRegisterService(PowerService.new);
  tryRegisterService(ProductService.new);
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

  final log = Logger(p.basename(Platform.resolvedExecutable));

  runZonedGuarded(() async {
    FlutterError.onError = (error) {
      log.error('Unhandled exception', error.exception, error.stack);
    };

    final window = await YaruWindow.ensureInitialized();
    await window.onClose(_closeInstallerApp);

    await setupAppLocalizations();

    runApp(ProviderScope(
      child: SlidesContext(
        slides: slides ?? defaultSlides,
        child: UbuntuDesktopInstallerApp(
          flavor: flavor,
          home: UbuntuDesktopInstallerWizard(
            welcome: options['welcome'],
          ),
        ),
      ),
    ));
  }, (error, stack) => log.error('Unhandled exception', error, stack));

  return initialized;
}

Future<void> _initInstallerApp(Endpoint endpoint) async {
  getService<SubiquityClient>().open(endpoint);

  await getService<AppService>().init();
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

class UbuntuDesktopInstallerApp extends StatelessWidget {
  UbuntuDesktopInstallerApp({
    super.key,
    FlavorData? flavor,
    required this.home,
  }) : flavor = flavor ?? defaultFlavor;

  final FlavorData flavor;
  final Widget home;

  static FlavorData get defaultFlavor {
    return const FlavorData(name: 'Ubuntu');
  }

  @override
  Widget build(BuildContext context) {
    return WizardApp(
      appName: 'ubuntu_desktop_installer',
      flavor: flavor,
      onGenerateTitle: (context, flavor) {
        final lang = AppLocalizations.of(context);
        final window = YaruWindow.of(context);
        window.setTitle(lang.windowTitle(flavor.name));
        return lang.appTitle;
      },
      localizationsDelegates: <LocalizationsDelegate>[
        ...localizationsDelegates,
        ...?flavor.localizationsDelegates,
      ],
      supportedLocales: supportedLocales,
      home: home,
    );
  }
}

enum InstallationStep {
  locale,
  keyboard,
  network,
  source,
  type,
  filesystem,
  timezone,
  identity,
  theme,
}

class UbuntuDesktopInstallerWizard extends ConsumerStatefulWidget {
  const UbuntuDesktopInstallerWizard({
    super.key,
    this.welcome,
  });

  final bool? welcome;

  @override
  ConsumerState<UbuntuDesktopInstallerWizard> createState() =>
      _UbuntuDesktopInstallerWizardState();
}

class _UbuntuDesktopInstallerWizardState
    extends ConsumerState<UbuntuDesktopInstallerWizard> {
  ApplicationStatus? _subiquityStatus;
  StreamSubscription<ApplicationStatus?>? _subiquityStatusChange;

  @override
  void initState() {
    super.initState();

    final client = getService<SubiquityClient>();
    _subiquityStatusChange = client.monitorStatus().listen((status) {
      YaruWindow.of(context).setClosable(status?.isInstalling != true);
      setState(() => _subiquityStatus = status);
    });
  }

  @override
  void dispose() {
    _subiquityStatusChange?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_subiquityStatus?.state == ApplicationState.ERROR) {
      return const _UbuntuDesktopErrorWizard();
    }
    return _subiquityStatus?.interactive == false
        ? _UbuntuDesktopAutoinstallWizard(status: _subiquityStatus)
        : _UbuntuDesktopInstallWizard(welcome: widget.welcome);
  }
}

class _UbuntuDesktopInstallWizard extends ConsumerWidget {
  const _UbuntuDesktopInstallWizard({this.welcome});

  final bool? welcome;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wizard(
      initialRoute: Routes.initial,
      userData: InstallationStep.values.length,
      routes: <String, WizardRoute>{
        Routes.loading: WizardRoute(
          builder: (_) => const LoadingPage(),
        ),
        Routes.locale: WizardRoute(
          builder: (_) => const LocalePage(),
          userData: InstallationStep.locale.index,
          onLoad: (_) => LocalePage.load(context, ref),
        ),
        if (welcome == true)
          Routes.welcome: WizardRoute(
            builder: (_) => const WelcomePage(),
            userData: InstallationStep.locale.index,
            onLoad: (_) => WelcomePage.load(context, ref),
          ),
        Routes.rst: WizardRoute(
          builder: (_) => const RstPage(),
          onLoad: (_) => RstPage.load(ref),
        ),
        Routes.keyboard: WizardRoute(
          builder: (_) => const KeyboardPage(),
          userData: InstallationStep.keyboard.index,
          onLoad: (settings) => KeyboardPage.load(ref),
        ),
        Routes.network: WizardRoute(
          builder: (_) => const NetworkPage(),
          userData: InstallationStep.network.index,
          onLoad: (_) => NetworkPage.load(ref),
        ),
        Routes.source: WizardRoute(
          builder: (_) => const SourceWizard(),
          userData: InstallationStep.source.index,
          onLoad: (_) => SourcePage.load(ref),
        ),
        Routes.secureBoot: WizardRoute(
          builder: (_) => const SecureBootPage(),
          userData: InstallationStep.type.index,
          onLoad: (_) => SecureBootPage.load(ref),
        ),
        Routes.filesystem: WizardRoute(
          builder: (_) => const FilesystemPage(),
          userData: InstallationStep.filesystem.index,
          onLoad: (_) => FilesystemPage.load(ref),
        ),
        Routes.confirm: WizardRoute(
          builder: (_) => const ConfirmPage(),
          userData: InstallationStep.filesystem.index,
          onLoad: (_) => ConfirmPage.load(ref),
        ),
        Routes.timezone: WizardRoute(
          builder: (_) => const TimezonePage(),
          userData: InstallationStep.timezone.index,
          onLoad: (_) => TimezonePage.load(context, ref),
        ),
        Routes.identity: WizardRoute(
          builder: (_) => const IdentityPage(),
          userData: InstallationStep.identity.index,
          onLoad: (_) => IdentityPage.load(ref),
          onNext: (settings) => settings.arguments == true
              ? Routes.activeDirectory
              : Routes.theme,
        ),
        Routes.activeDirectory: WizardRoute(
          builder: (_) => const ActiveDirectoryPage(),
          userData: InstallationStep.identity.index,
          onLoad: (_) => ActiveDirectoryPage.load(ref),
        ),
        Routes.theme: WizardRoute(
          builder: (_) => const ThemePage(),
          userData: InstallationStep.theme.index,
        ),
        Routes.install: WizardRoute(
          builder: (_) => const InstallPage(),
          onLoad: (_) => InstallPage.load(context, ref),
        ),
      },
      observers: [
        _UbuntuDesktopInstallerWizardObserver(getService<TelemetryService>())
      ],
    );
  }
}

class _UbuntuDesktopInstallerWizardObserver extends NavigatorObserver {
  _UbuntuDesktopInstallerWizardObserver(this._telemetryService);

  final TelemetryService _telemetryService;

  @override
  void didPush(Route route, Route? previousRoute) {
    if (route.settings.name != null) {
      _telemetryService.addStage(route.settings.name!.removePrefix('/'));
    }
  }
}

class _UbuntuDesktopAutoinstallWizard extends StatelessWidget {
  const _UbuntuDesktopAutoinstallWizard({this.status});

  final ApplicationStatus? status;

  @override
  Widget build(BuildContext context) {
    return Wizard(
      routes: <String, WizardRoute>{
        Routes.loading: WizardRoute(
          builder: (_) => const LoadingPage(),
        ),
        Routes.confirm: WizardRoute(
          builder: (_) => const ConfirmPage(),
          onLoad: (_) => status?.isInstalling != true,
        ),
        Routes.install: WizardRoute(
          builder: (_) => const InstallPage(),
        ),
      },
    );
  }
}

class _UbuntuDesktopErrorWizard extends StatelessWidget {
  const _UbuntuDesktopErrorWizard();

  @override
  Widget build(BuildContext context) {
    return Wizard(
      routes: <String, WizardRoute>{
        Routes.install: WizardRoute(
          builder: (_) => const InstallPage(),
        ),
      },
    );
  }
}
