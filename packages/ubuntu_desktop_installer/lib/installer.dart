import 'dart:async';
import 'dart:io';

import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';
import 'package:timezone_map/timezone_map.dart';
import 'package:ubuntu_wizard/app.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'l10n.dart';
import 'pages.dart';
import 'routes.dart';
import 'services.dart';
import 'slides.dart';
import 'theme.dart';

export 'package:ubuntu_wizard/widgets.dart' show FlavorData;
export 'slides.dart';

final assetBundle =
    ProxyAssetBundle(rootBundle, package: 'ubuntu_desktop_installer');

Future<void> runInstallerApp(
  List<String> args, {
  FlavorData? flavor,
  List<WidgetBuilder>? slides,
}) async {
  final options = parseCommandLine(args, onPopulateOptions: (parser) {
    parser.addOption('machine-config',
        valueHelp: 'path',
        defaultsTo: 'examples/simple.json',
        help: 'Path of the machine config (dry-run only)');
    parser.addOption('source-catalog',
        valueHelp: 'path',
        defaultsTo: 'examples/desktop-sources.yaml',
        help: 'Path of the source catalog (dry-run only)');
    parser.addFlag('welcome', aliases: ['try-or-install'], hide: true);
  })!;

  final bool liveRun = isLiveRun(options);
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

  WidgetsFlutterBinding.ensureInitialized();

  await runWizardApp(
    ProviderScope(
      child: InheritedLocale(
        child: SlidesContext(
          slides: slides ?? defaultSlides,
          child: UbuntuDesktopInstallerApp(
            flavor: flavor,
            home: UbuntuDesktopInstallerWizard(
              initialRoute: options['initial-route'],
              welcome: options['welcome'],
            ),
          ),
        ),
      ),
    ),
    options: options,
    subiquityClient: getService<SubiquityClient>(),
    subiquityServer: getService<SubiquityServer>(),
    serverArgs: [
      if (options['machine-config'] != null)
        '--machine-config=${options['machine-config']}',
      if (options['source-catalog'] != null)
        '--source-catalog=${options['source-catalog']}',
      '--storage-version=2',
      ...options.rest,
    ],
    dispose: () => getService<DesktopService>().close(),
  );

  final app = getService<AppService>();
  await app.init();

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

  final desktop = getService<DesktopService>();
  await desktop.inhibit();
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
    return DefaultAssetBundle(
      bundle: assetBundle,
      child: Flavor(
        data: flavor,
        child: YaruTheme(
          builder: (context, yaru, child) {
            final theme = flavor.theme ?? yaru.theme;
            final darkTheme = flavor.darkTheme ?? yaru.darkTheme;
            return MaterialApp(
              locale: InheritedLocale.of(context),
              onGenerateTitle: (context) {
                final lang = AppLocalizations.of(context);
                final window = YaruWindow.of(context);
                window.setTitle(lang.windowTitle(flavor.name));
                return lang.appTitle;
              },
              theme: theme?.customize(),
              darkTheme: darkTheme?.customize(),
              highContrastTheme: yaruHighContrastLight.customize(),
              highContrastDarkTheme: yaruHighContrastDark.customize(),
              debugShowCheckedModeBanner: false,
              localizationsDelegates: <LocalizationsDelegate>[
                ...localizationsDelegates,
                ...?flavor.localizationsDelegates,
              ],
              supportedLocales: supportedLocales,
              home: _UbuntuDesktopInstallerBackground(child: home),
            );
          },
        ),
      ),
    );
  }
}

class _UbuntuDesktopInstallerBackground extends StatelessWidget {
  const _UbuntuDesktopInstallerBackground({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(
          child: Scaffold(
            appBar: YaruWindowTitleBar(
              title: SizedBox.shrink(),
              style: YaruTitleBarStyle.undecorated,
            ),
          ),
        ),
        Positioned.fill(child: child),
      ],
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
    this.initialRoute,
    this.welcome,
  });

  final String? initialRoute;
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
        : _UbuntuDesktopInstallWizard(
            initialRoute: widget.initialRoute,
            welcome: widget.welcome,
          );
  }
}

class _UbuntuDesktopInstallWizard extends ConsumerWidget {
  const _UbuntuDesktopInstallWizard({this.initialRoute, this.welcome});

  final String? initialRoute;
  final bool? welcome;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wizard(
      initialRoute: initialRoute ?? Routes.initial,
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
