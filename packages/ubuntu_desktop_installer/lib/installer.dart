import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gsettings/gsettings.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';
import 'package:timezone_map/timezone_map.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/app.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru/yaru.dart';

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

enum AppStatus { loading, ready }

extension BusyState on ApplicationState {
  bool get isInstalling =>
      index >= ApplicationState.RUNNING.index &&
      index < ApplicationState.DONE.index;
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
  subiquityMonitor.onStatusChanged.listen((status) {
    setWindowClosable(status?.state.isInstalling != true);
  });

  final geodata = Geodata.asset();
  final geoname = Geoname.ubuntu(geodata: geodata);

  registerService(() => DiskStorageService(subiquityClient));
  registerService(() => GeoService(sources: [geodata, geoname]));
  registerService(JournalService.new);
  registerService(NetworkService.new);
  registerService(PowerService.new);
  registerService(TelemetryService.new);
  registerService(UdevService.new);
  registerService(UrlLauncher.new);

  final interfaceSettings = GSettings('org.gnome.desktop.interface');

  WidgetsFlutterBinding.ensureInitialized();
  onWindowClosed().then((_) async {
    await interfaceSettings.close();
  });

  final appStatus = ValueNotifier(AppStatus.loading);

  await runWizardApp(
    ValueListenableBuilder<AppStatus>(
      valueListenable: appStatus,
      builder: (context, value, child) {
        return ChangeNotifierProvider(
          create: (_) => Settings(interfaceSettings),
          child: UbuntuDesktopInstallerApp(
            appStatus: value,
            flavor: flavor,
            slides: slides,
            initialRoute: options['initial-route'],
          ),
        );
      },
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

  appStatus.value = AppStatus.ready;
  await subiquityClient.setVariant(Variant.DESKTOP);

  // Use the default values for a number of endpoints
  // for which a UI page isn't implemented yet.
  return subiquityClient.markConfigured([
    'drivers',
    'mirror',
    'proxy',
    'network',
    'ssh',
    'snaplist',
    'ubuntu_pro',
  ]);
}

class UbuntuDesktopInstallerApp extends StatelessWidget {
  UbuntuDesktopInstallerApp({
    super.key,
    this.initialRoute,
    FlavorData? flavor,
    List<Slide>? slides,
    this.appStatus = AppStatus.ready,
  })  : flavor = flavor ?? defaultFlavor,
        slides = slides ?? defaultSlides;

  final String? initialRoute;
  final FlavorData flavor;
  final List<Slide> slides;
  final AppStatus appStatus;

  static FlavorData get defaultFlavor {
    return const FlavorData(name: 'Ubuntu');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultAssetBundle(
      bundle: assetBundle,
      child: Flavor(
        data: flavor,
        child: SlidesContext(
          slides: slides,
          child: YaruTheme(
            builder: (context, yaru, child) {
              return MaterialApp(
                locale: Settings.of(context).locale,
                onGenerateTitle: (context) {
                  final lang = AppLocalizations.of(context);
                  setWindowTitle(lang.windowTitle(flavor.name));
                  return lang.appTitle;
                },
                theme: flavor.theme ?? yaru.variant?.theme ?? yaruLight,
                darkTheme:
                    flavor.darkTheme ?? yaru.variant?.darkTheme ?? yaruDark,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: <LocalizationsDelegate>[
                  ...localizationsDelegates,
                  ...?flavor.localizationsDelegates,
                ],
                supportedLocales: supportedLocales,
                home: buildApp(context),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildApp(BuildContext context) {
    switch (appStatus) {
      case AppStatus.loading:
        return const _UbuntuDesktopInstallerLoadingPage();
      case AppStatus.ready:
        return _UbuntuDesktopInstallerWizard(initialRoute: initialRoute);
    }
  }
}

class _UbuntuDesktopInstallerLoadingPage extends StatelessWidget {
  const _UbuntuDesktopInstallerLoadingPage();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final lang = AppLocalizations.of(context);
    return WizardPage(
      title: Text(AppLocalizations.of(context).welcome),
      header: Text(lang.welcomeHeader),
      content: Row(
        children: [
          Expanded(
            child: RoundedContainer(height: height),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: SvgPicture.asset(
              'assets/welcome/logo.svg',
              height: height / 4,
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

class _UbuntuDesktopInstallerWizard extends StatelessWidget {
  const _UbuntuDesktopInstallerWizard({this.initialRoute});

  final String? initialRoute;

  @override
  Widget build(BuildContext context) {
    final service = getService<DiskStorageService>();

    return Wizard(
      initialRoute: initialRoute ?? Routes.initial,
      routes: <String, WizardRoute>{
        Routes.welcome: const WizardRoute(
          builder: WelcomePage.create,
        ),
        Routes.tryOrInstall: WizardRoute(
          builder: TryOrInstallPage.create,
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
        Routes.keyboardLayout: const WizardRoute(
          builder: KeyboardLayoutPage.create,
        ),
        Routes.connectToInternet: WizardRoute(
          builder: ConnectToInternetPage.create,
          onNext: (_) =>
              service.hasEnoughDiskSpace ? Routes.updatesOtherSoftware : null,
        ),
        Routes.notEnoughDiskSpace: const WizardRoute(
          builder: NotEnoughDiskSpacePage.create,
        ),
        Routes.updatesOtherSoftware: WizardRoute(
          builder: UpdatesOtherSoftwarePage.create,
          onNext: (_) =>
              !service.hasSecureBoot ? Routes.installationType : null,
        ),
        Routes.configureSecureBoot: const WizardRoute(
          builder: ConfigureSecureBootPage.create,
        ),
        Routes.installationType: WizardRoute(
          builder: InstallationTypePage.create,
          onNext: (settings) {
            if (settings.arguments == InstallationType.manual) {
              return Routes.allocateDiskSpace;
            } else if (!service.hasGuidedChoice) {
              if (settings.arguments == InstallationType.erase) {
                return Routes.selectGuidedStorage;
              } else if (settings.arguments == InstallationType.alongside) {
                return Routes.installAlongside;
              }
            } else if (service.hasEncryption) {
              return Routes.chooseSecurityKey;
            }
            return Routes.writeChangesToDisk;
          },
        ),
        Routes.installAlongside: WizardRoute(
          builder: InstallAlongsidePage.create,
          onReplace: (_) => Routes.allocateDiskSpace,
          onNext: (_) => service.hasEncryption
              ? Routes.chooseSecurityKey
              : Routes.writeChangesToDisk,
        ),
        Routes.selectGuidedStorage: WizardRoute(
          builder: SelectGuidedStoragePage.create,
          onNext: (_) => service.hasEncryption
              ? Routes.chooseSecurityKey
              : Routes.writeChangesToDisk,
        ),
        Routes.chooseSecurityKey: WizardRoute(
          builder: ChooseSecurityKeyPage.create,
          onNext: (_) => Routes.writeChangesToDisk,
        ),
        Routes.allocateDiskSpace: const WizardRoute(
          builder: AllocateDiskSpacePage.create,
        ),
        Routes.writeChangesToDisk: WizardRoute(
          builder: WriteChangesToDiskPage.create,
          onNext: (_) => !service.hasBitLocker ? Routes.whereAreYou : null,
        ),
        Routes.turnOffBitlocker: const WizardRoute(
          builder: TurnOffBitLockerPage.create,
        ),
        Routes.whereAreYou: const WizardRoute(
          builder: WhereAreYouPage.create,
        ),
        Routes.whoAreYou: WizardRoute(
          builder: WhoAreYouPage.create,
          // skip Routes.chooseYourLook (https://github.com/canonical/ubuntu-desktop-installer/issues/373)
          onNext: (_) => Routes.installationSlides,
        ),
        // https://github.com/canonical/ubuntu-desktop-installer/issues/41
        // Routes.configureActiveDirectory: const WizardRoute(
        //   builder: ConfigureActiveDirectoryPage.create,
        // ),
        Routes.chooseYourLook: const WizardRoute(
          builder: ChooseYourLookPage.create,
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
}

class _UbuntuDesktopInstallerWizardObserver extends WizardObserver {
  _UbuntuDesktopInstallerWizardObserver(this._telemetryService);

  final TelemetryService _telemetryService;

  @override
  void onInit(Route route) {
    if (route.settings.name != null) {
      _telemetryService.addStage(route.settings.name!);
    }
  }

  @override
  void onNext(Route route, Route previousRoute) {
    if (route.settings.name != null) {
      _telemetryService.addStage(route.settings.name!);
    }
  }

  @override
  Future<void> onDone(Route route, Object? result) {
    return _telemetryService.done();
  }
}
