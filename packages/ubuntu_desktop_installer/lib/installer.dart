import 'dart:async';
import 'dart:io';

import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gsettings/gsettings.dart';
import 'package:path/path.dart' as p;
import 'package:provider/provider.dart';
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
import 'settings.dart';
import 'slides.dart';

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
  List<Slide>? slides,
}) async {
  final options = parseCommandLine(args, onPopulateOptions: (parser) {
    parser.addOption('machine-config',
        valueHelp: 'path',
        defaultsTo: 'examples/simple.json',
        help: 'Path of the machine config (dry-run only)');
    parser.addOption('bootloader', hide: true);
    parser.addFlag('try-or-install', hide: true);
  })!;

  final subiquityClient = SubiquityClient();
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
  final subiquityServer = SubiquityServer(
    process: process,
    endpoint: endpoint,
  );

  final subiquityMonitor = SubiquityStatusMonitor();

  final geodata = Geodata.asset();
  final geoname = Geoname.ubuntu(geodata: geodata);

  final baseName = p.basename(Platform.resolvedExecutable);

  final telemetry = TelemetryService();
  await telemetry.init({
    'Type': 'Flutter',
    'OEM': false,
    'Media': ProductInfoExtractor().getProductInfo().toString(),
  });

  final storage = DiskStorageService(subiquityClient);

  registerService(() => ConfigService('/tmp/$baseName.conf'));
  registerServiceInstance(storage);
  registerService(() => GeoService(sources: [geodata, geoname]));
  registerService(JournalService.new);
  registerService(() => NetworkService(subiquityClient));
  registerService(PowerService.new);
  registerServiceInstance(telemetry);
  registerService(UdevService.new);
  registerService(UrlLauncher.new);

  final interfaceSettings = GSettings('org.gnome.desktop.interface');

  WidgetsFlutterBinding.ensureInitialized();
  final window = await YaruWindow.ensureInitialized();
  await window.onClose(() async {
    await interfaceSettings.close();
    return true;
  });

  await runWizardApp(
    ChangeNotifierProvider(
      create: (_) => Settings(interfaceSettings),
      child: UbuntuDesktopInstallerApp(
        flavor: flavor,
        slides: slides,
        initialRoute: options['initial-route'],
        tryOrInstall: options['try-or-install'],
      ),
    ),
    options: options,
    subiquityClient: subiquityClient,
    subiquityServer: subiquityServer,
    subiquityMonitor: subiquityMonitor,
    serverArgs: [
      if (options['machine-config'] != null)
        '--machine-config=${options['machine-config']}',
      if (options['bootloader'] != null)
        '--bootloader=${options['bootloader']}',
      '--storage-version=2',
    ],
  );

  await subiquityClient.setVariant(Variant.DESKTOP);
  await subiquityClient.setSource(InstallationMode.normal.source);

  // Use the default values for a number of endpoints
  // for which a UI page isn't implemented yet.
  await subiquityClient.markConfigured([
    'mirror',
    'proxy',
    'ssh',
    'snaplist',
    'ubuntu_pro',
  ]);

  await storage.init();
}

class UbuntuDesktopInstallerApp extends StatefulWidget {
  UbuntuDesktopInstallerApp({
    super.key,
    this.initialRoute,
    this.tryOrInstall,
    FlavorData? flavor,
    List<Slide>? slides,
  })  : flavor = flavor ?? defaultFlavor,
        slides = slides ?? defaultSlides;

  final String? initialRoute;
  final bool? tryOrInstall;
  final FlavorData flavor;
  final List<Slide> slides;

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
              return MaterialApp(
                locale: Settings.of(context).locale,
                onGenerateTitle: (context) {
                  final lang = AppLocalizations.of(context);
                  final window = YaruWindow.of(context);
                  window.setTitle(lang.windowTitle(widget.flavor.name));
                  return lang.appTitle;
                },
                theme: widget.flavor.theme ?? yaru.theme,
                darkTheme: widget.flavor.darkTheme ?? yaru.darkTheme,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: <LocalizationsDelegate>[
                  ...localizationsDelegates,
                  ...?widget.flavor.localizationsDelegates,
                ],
                supportedLocales: supportedLocales,
                home: buildApp(context),
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
  const _UbuntuDesktopInstallerLoadingPage();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final lang = AppLocalizations.of(context);
    return WizardPage(
      title: YaruWindowTitleBar(
        title: Text(AppLocalizations.of(context).welcome),
      ),
      // TODO: "Choose your language" makes no sense in autoinstall mode so it's
      //  temporarily hidden until we have a dedicated loading screen.
      header: const Text(''), // Text(lang.welcomeHeader),
      content: Row(
        children: [
          Expanded(
            child: YaruBorderContainer(
              height: height,
              child: const Center(
                child: YaruCircularProgressIndicator(),
              ),
            ),
          ),
          const SizedBox(width: kContentSpacing),
          Expanded(
            child: SvgPicture.asset(
              'assets/welcome/logo.svg',
              height: height / 2,
            ),
          ),
        ],
      ),
      actions: <WizardAction>[
        WizardAction.back(context, enabled: false),
        WizardAction.next(context, enabled: false),
      ],
    );
  }
}

enum InstallationStep {
  welcome,
  keyboard,
  network,
  software,
  type,
  storage,
  location,
  user,
  look,
}

class _UbuntuDesktopInstallerWizard extends StatelessWidget {
  const _UbuntuDesktopInstallerWizard({this.initialRoute, this.tryOrInstall});

  final String? initialRoute;
  final bool? tryOrInstall;

  @override
  Widget build(BuildContext context) {
    final service = getService<DiskStorageService>();

    return Wizard(
      initialRoute: initialRoute ?? Routes.initial,
      userData: InstallationStep.values.length,
      routes: <String, WizardRoute>{
        Routes.welcome: WizardRoute(
          builder: WelcomePage.create,
          userData: InstallationStep.welcome.index,
          onNext: (_) {
            if (tryOrInstall == true) {
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
          userData: InstallationStep.welcome.index,
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
        Routes.turnOffRST: WizardRoute(
          builder: TurnOffRSTPage.create,
          userData: InstallationStep.welcome.index,
        ),
        Routes.keyboardLayout: WizardRoute(
          builder: KeyboardLayoutPage.create,
          userData: InstallationStep.keyboard.index,
        ),
        Routes.connectToInternet: WizardRoute(
          builder: ConnectToInternetPage.create,
          userData: InstallationStep.network.index,
          onNext: (_) =>
              service.hasEnoughDiskSpace ? Routes.updatesOtherSoftware : null,
        ),
        Routes.notEnoughDiskSpace: const WizardRoute(
          builder: NotEnoughDiskSpacePage.create,
        ),
        Routes.updatesOtherSoftware: WizardRoute(
          builder: UpdatesOtherSoftwarePage.create,
          userData: InstallationStep.software.index,
          onNext: (_) =>
              !service.hasSecureBoot ? Routes.installationType : null,
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
          onNext: (_) => !service.hasBitLocker ? Routes.whereAreYou : null,
        ),
        Routes.turnOffBitlocker: WizardRoute(
          builder: TurnOffBitLockerPage.create,
          userData: InstallationStep.storage.index,
        ),
        Routes.whereAreYou: WizardRoute(
          builder: WhereAreYouPage.create,
          userData: InstallationStep.location.index,
        ),
        Routes.whoAreYou: WizardRoute(
          builder: WhoAreYouPage.create,
          userData: InstallationStep.user.index,
        ),
        // https://github.com/canonical/ubuntu-desktop-installer/issues/41
        // Routes.configureActiveDirectory: const WizardRoute(
        //   builder: ConfigureActiveDirectoryPage.create,
        // ),
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
      if (arguments == InstallationType.erase) {
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
