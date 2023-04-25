import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';
import 'package:timezone_map/timezone_map.dart';
import 'package:ubuntu_wizard/app.dart';
import 'package:ubuntu_wizard/constants.dart';
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
import 'widgets.dart';

export 'package:ubuntu_wizard/widgets.dart' show FlavorData;
export 'slides.dart';

final assetBundle =
    ProxyAssetBundle(rootBundle, package: 'ubuntu_desktop_installer');

extension on ApplicationStatus {
  bool get isStartingUp => state.index <= ApplicationState.EARLY_COMMANDS.index;
  bool get isWaitingAutoinstall =>
      interactive == false && state == ApplicationState.WAITING;
  bool get isInstalling =>
      state.index >= ApplicationState.RUNNING.index &&
      state.index < ApplicationState.DONE.index;
}

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
    parser.addFlag('try-or-install', hide: true);
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
  tryRegisterService(() => ConfigService('/tmp/$baseName.conf'));
  tryRegisterService<DesktopService>(() => GnomeService());
  tryRegisterService(() => DiskStorageService(getService<SubiquityClient>()));
  tryRegisterService(JournalService.new);
  tryRegisterService(() => NetworkService(getService<SubiquityClient>()));
  tryRegisterService(PowerService.new);
  tryRegisterService(ProductService.new);
  tryRegisterService(SubiquityClient.new);
  tryRegisterService(
      () => SubiquityServer(process: process, endpoint: endpoint));
  tryRegisterService(SubiquityStatusMonitor.new);
  tryRegisterService(TelemetryService.new);
  tryRegisterService(UdevService.new);
  tryRegisterService(UrlLauncher.new);

  WidgetsFlutterBinding.ensureInitialized();

  await runWizardApp(
    InheritedLocale(
      child: UbuntuDesktopInstallerApp(
        flavor: flavor,
        slides: slides,
        initialRoute: options['initial-route'],
        tryOrInstall: options['try-or-install'],
      ),
    ),
    options: options,
    subiquityClient: getService<SubiquityClient>(),
    subiquityServer: getService<SubiquityServer>(),
    subiquityMonitor: getService<SubiquityStatusMonitor>(),
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

  final subiquityClient = getService<SubiquityClient>();
  await subiquityClient.setVariant(Variant.DESKTOP);

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

class UbuntuDesktopInstallerApp extends StatefulWidget {
  UbuntuDesktopInstallerApp({
    super.key,
    this.initialRoute,
    this.tryOrInstall,
    FlavorData? flavor,
    List<WidgetBuilder>? slides,
  })  : flavor = flavor ?? defaultFlavor,
        slides = slides ?? defaultSlides;

  final String? initialRoute;
  final bool? tryOrInstall;
  final FlavorData flavor;
  final List<WidgetBuilder> slides;

  static FlavorData get defaultFlavor {
    return const FlavorData(name: 'Ubuntu');
  }

  @override
  State<UbuntuDesktopInstallerApp> createState() =>
      _UbuntuDesktopInstallerAppState();
}

class _UbuntuDesktopInstallerAppState extends State<UbuntuDesktopInstallerApp> {
  ApplicationStatus? _subiquityStatus;
  StreamSubscription<ApplicationStatus?>? _subiquityStatusChange;

  @override
  void initState() {
    super.initState();

    final monitor = getService<SubiquityStatusMonitor>();
    _subiquityStatus = monitor.status;
    _subiquityStatusChange = monitor.onStatusChanged.listen((status) {
      YaruWindow.of(context).setClosable(status?.isInstalling != true);
      setState(() => _subiquityStatus = status);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      MascotAvatar.precacheAsset(context);
      TimezoneMap.precacheAssets(context);
    });
  }

  @override
  void dispose() {
    _subiquityStatusChange?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultAssetBundle(
      bundle: assetBundle,
      child: Flavor(
        data: widget.flavor,
        child: SlidesContext(
          slides: widget.slides,
          child: YaruTheme(
            builder: (context, yaru, child) {
              final theme = widget.flavor.theme ?? yaru.theme;
              final darkTheme = widget.flavor.darkTheme ?? yaru.darkTheme;
              return MaterialApp(
                locale: InheritedLocale.of(context),
                onGenerateTitle: (context) {
                  final lang = AppLocalizations.of(context);
                  final window = YaruWindow.of(context);
                  window.setTitle(lang.windowTitle(widget.flavor.name));
                  return lang.appTitle;
                },
                theme: theme?.customize(),
                darkTheme: darkTheme?.customize(),
                highContrastTheme: yaruHighContrastLight.customize(),
                highContrastDarkTheme: yaruHighContrastDark.customize(),
                debugShowCheckedModeBanner: false,
                localizationsDelegates: <LocalizationsDelegate>[
                  ...localizationsDelegates,
                  ...?widget.flavor.localizationsDelegates,
                ],
                supportedLocales: supportedLocales,
                home: AnimatedSwitcher(
                  duration: const Duration(seconds: 1),
                  switchInCurve: Curves.easeInExpo,
                  switchOutCurve: Curves.easeOutExpo,
                  child: buildApp(context),
                ),
                builder: (context, child) => Stack(
                  children: [
                    const Positioned.fill(
                      child: _UbuntuDesktopInstallerBackground(),
                    ),
                    Positioned.fill(child: child!),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildApp(BuildContext context) {
    if (_subiquityStatus == null ||
        _subiquityStatus!.isStartingUp ||
        _subiquityStatus!.isWaitingAutoinstall) {
      return const _UbuntuDesktopInstallerLoadingPage();
    }
    if (_subiquityStatus?.state == ApplicationState.ERROR) {
      return const _UbuntuDesktopErrorWizard();
    }
    return _subiquityStatus?.interactive == false
        ? _UbuntuDesktopAutoinstallWizard(status: _subiquityStatus)
        : _UbuntuDesktopInstallerWizard(
            initialRoute: widget.initialRoute,
            tryOrInstall: widget.tryOrInstall,
          );
  }
}

class _UbuntuDesktopInstallerBackground extends StatelessWidget {
  const _UbuntuDesktopInstallerBackground();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: YaruWindowTitleBar(
        title: SizedBox.shrink(),
        style: YaruTitleBarStyle.undecorated,
      ),
    );
  }
}

class _UbuntuDesktopInstallerLoadingPage extends StatelessWidget {
  const _UbuntuDesktopInstallerLoadingPage()
      : super(key: const ValueKey(_UbuntuDesktopInstallerLoadingPage));

  @override
  Widget build(BuildContext context) {
    final flavor = Flavor.of(context);
    final lang = AppLocalizations.of(context);
    final style = Theme.of(context).textTheme.headlineSmall!;
    return WizardPage(
      title: YaruWindowTitleBar(
        title: Text(lang.welcomePageTitle(flavor.name)),
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox.square(
            dimension: 72,
            child: YaruCircularProgressIndicator(),
          ),
          const SizedBox(height: kContentSpacing * 2),
          Text(lang.preparingUbuntu(flavor.name), style: style),
        ],
      ),
      bottomBar: WizardBar(
        leading: WizardAction.back(context, enabled: false),
        trailing: [
          WizardAction.next(context, enabled: false),
        ],
      ),
    );
  }
}

enum InstallationStep {
  locale,
  keyboard,
  network,
  software,
  type,
  storage,
  location,
  user,
  look,
}

class _UbuntuDesktopInstallerWizard extends StatefulWidget {
  const _UbuntuDesktopInstallerWizard({this.initialRoute, this.tryOrInstall});

  final String? initialRoute;
  final bool? tryOrInstall;

  @override
  State<_UbuntuDesktopInstallerWizard> createState() =>
      _UbuntuDesktopInstallerWizardState();
}

class _UbuntuDesktopInstallerWizardState
    extends State<_UbuntuDesktopInstallerWizard> {
  @override
  void initState() {
    super.initState();

    final client = getService<SubiquityClient>();
    client.source().then((value) async {
      final source = value.sources.firstWhereOrNull((s) => s.isDefault);
      if (source != null) {
        await client.setSource(source.id);
      }

      // Use the default values for a number of endpoints
      // for which a UI page isn't implemented yet.
      client.markConfigured([
        'mirror',
        'proxy',
        'ssh',
        'snaplist',
        'ubuntu_pro',
      ]);

      final storage = getService<DiskStorageService>();
      storage.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final service = getService<DiskStorageService>();

    return Wizard(
      initialRoute: widget.initialRoute ?? Routes.initial,
      userData: InstallationStep.values.length,
      routes: <String, WizardRoute>{
        Routes.locale: WizardRoute(
          builder: LocalePage.create,
          userData: InstallationStep.locale.index,
          onNext: (_) {
            if (widget.tryOrInstall == true) {
              return Routes.tryOrInstall;
            } else if (service.hasRst) {
              return Routes.turnOffRST;
            } else {
              return Routes.keyboardLayout;
            }
          },
        ),
        Routes.tryOrInstall: WizardRoute(
          builder: TryOrInstallPage.create,
          userData: InstallationStep.locale.index,
          onNext: (settings) {
            switch (settings.arguments as Option?) {
              case Option.repairUbuntu:
                return Routes.repairUbuntu;
              default:
                if (service.hasRst) return Routes.turnOffRST;
                return Routes.keyboardLayout;
            }
          },
        ),
        Routes.turnOffRST: const WizardRoute(
          builder: TurnOffRSTPage.create,
        ),
        Routes.keyboardLayout: WizardRoute(
          builder: KeyboardLayoutPage.create,
          userData: InstallationStep.keyboard.index,
        ),
        Routes.network: WizardRoute(
          builder: NetworkPage.create,
          userData: InstallationStep.network.index,
        ),
        Routes.updatesOtherSoftware: WizardRoute(
          builder: UpdatesOtherSoftwarePage.create,
          userData: InstallationStep.software.index,
          onNext: (_) => !service.hasEnoughDiskSpace
              ? Routes.notEnoughDiskSpace
              : !service.hasSecureBoot
                  ? Routes.installationType
                  : null,
        ),
        Routes.notEnoughDiskSpace: const WizardRoute(
          builder: NotEnoughDiskSpacePage.create,
        ),
        Routes.configureSecureBoot: WizardRoute(
          builder: ConfigureSecureBootPage.create,
          userData: InstallationStep.type.index,
        ),
        Routes.installationType: WizardRoute(
          builder: InstallationTypePage.create,
          userData: InstallationStep.type.index,
          onNext: (settings) => _nextStorageRoute(service, settings.arguments),
        ),
        Routes.bitlocker: const WizardRoute(
          builder: BitLockerPage.create,
        ),
        Routes.installAlongside: WizardRoute(
          builder: InstallAlongsidePage.create,
          userData: InstallationStep.storage.index,
          onReplace: (_) => Routes.allocateDiskSpace,
          onNext: (settings) => _nextStorageRoute(service, settings.arguments),
        ),
        Routes.selectGuidedStorage: WizardRoute(
          builder: SelectGuidedStoragePage.create,
          userData: InstallationStep.storage.index,
          onNext: (settings) => _nextStorageRoute(service, settings.arguments),
        ),
        Routes.chooseSecurityKey: WizardRoute(
          builder: ChooseSecurityKeyPage.create,
          userData: InstallationStep.storage.index,
          onNext: (settings) => _nextStorageRoute(service, settings.arguments),
        ),
        Routes.allocateDiskSpace: WizardRoute(
          builder: AllocateDiskSpacePage.create,
          userData: InstallationStep.storage.index,
        ),
        Routes.writeChangesToDisk: WizardRoute(
          builder: WriteChangesToDiskPage.create,
          userData: InstallationStep.storage.index,
        ),
        Routes.timezone: WizardRoute(
          builder: TimezonePage.create,
          userData: InstallationStep.location.index,
        ),
        Routes.identity: WizardRoute(
          builder: IdentityPage.create,
          userData: InstallationStep.user.index,
          onNext: (settings) => settings.arguments == true
              ? Routes.activeDirectory
              : Routes.chooseYourLook,
        ),
        Routes.activeDirectory: WizardRoute(
          builder: ActiveDirectoryPage.create,
          userData: InstallationStep.user.index,
        ),
        Routes.chooseYourLook: WizardRoute(
          builder: ChooseYourLookPage.create,
          userData: InstallationStep.look.index,
        ),
        Routes.installationSlides: const WizardRoute(
          builder: InstallationSlidesPage.create,
        ),
        Routes.installationComplete: const WizardRoute(
          builder: InstallationCompletePage.create,
        ),
      },
      observers: [
        _UbuntuDesktopInstallerWizardObserver(getService<TelemetryService>())
      ],
    );
  }

  String? _nextStorageRoute(DiskStorageService service, dynamic arguments) {
    if (arguments == InstallationType.manual) {
      return Routes.allocateDiskSpace;
    } else if (service.guidedTarget == null) {
      if (arguments == InstallationType.bitlocker) {
        return Routes.bitlocker;
      } else if (arguments == InstallationType.erase) {
        return Routes.selectGuidedStorage;
      } else if (arguments == InstallationType.alongside) {
        return Routes.installAlongside;
      }
    } else if (service.useEncryption && service.securityKey == null) {
      return Routes.chooseSecurityKey;
    }
    return Routes.writeChangesToDisk;
  }
}

class _UbuntuDesktopInstallerWizardObserver extends WizardObserver {
  _UbuntuDesktopInstallerWizardObserver(this._telemetryService);

  final TelemetryService _telemetryService;

  @override
  void onInit(Route route) {
    if (route.settings.name != null) {
      _telemetryService.addStage(route.settings.name!.removePrefix('/'));
    }
  }

  @override
  void onNext(Route route, Route previousRoute) {
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
        if (status?.isInstalling != true)
          Routes.writeChangesToDisk: const WizardRoute(
            builder: WriteChangesToDiskPage.create,
          ),
        Routes.installationSlides: const WizardRoute(
          builder: InstallationSlidesPage.create,
        ),
        Routes.installationComplete: const WizardRoute(
          builder: InstallationCompletePage.create,
        ),
      },
    );
  }
}

class _UbuntuDesktopErrorWizard extends StatelessWidget {
  const _UbuntuDesktopErrorWizard();

  @override
  Widget build(BuildContext context) {
    return const Wizard(
      routes: <String, WizardRoute>{
        Routes.installationSlides: WizardRoute(
          builder: InstallationSlidesPage.create,
        ),
      },
    );
  }
}
