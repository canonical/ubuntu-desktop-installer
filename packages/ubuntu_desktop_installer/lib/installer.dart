import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gsettings/gsettings.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';
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

const _kGeonameUrl = 'https://geoname-lookup.ubuntu.com/';
const _kSystemdUnit = 'snap.ubuntu-desktop-installer.subiquity-server.service';

final assetBundle =
    ProxyAssetBundle(rootBundle, package: 'ubuntu_desktop_installer');

enum AppStatus { loading, ready }

extension BusyState on ApplicationState {
  bool get isInstalling =>
      index >= ApplicationState.RUNNING.index &&
      index < ApplicationState.DONE.index;
}

void runInstallerApp(
  List<String> args, {
  FlavorData? flavor,
  List<Slide>? slides,
}) {
  final options = parseCommandLine(args, onPopulateOptions: (parser) {
    parser.addOption('machine-config',
        valueHelp: 'path',
        defaultsTo: 'examples/simple.json',
        help: 'Path of the machine config (dry-run only)');
  })!;

  final subiquityClient = SubiquityClient();
  final subiquityServer = SubiquityServer();

  final subiquityMonitor = SubiquityStatusMonitor();
  subiquityMonitor.onStatusChanged.listen((status) {
    setWindowClosable(status?.state.isInstalling != true);
  });

  final journalUnit = isLiveRun(options) ? _kSystemdUnit : null;

  final geodata = Geodata(
    loadCities: () => assetBundle.loadString('assets/cities15000.txt'),
    loadAdmins: () => assetBundle.loadString('assets/admin1CodesASCII.txt'),
    loadCountries: () => assetBundle.loadString('assets/countryInfo.txt'),
    loadTimezones: () => assetBundle.loadString('assets/timeZones.txt'),
  );

  final geoname = Geoname(url: _kGeonameUrl, geodata: geodata);

  registerService(() => DiskStorageService(subiquityClient));
  registerService(() => GeoService(sources: [geodata, geoname]));
  registerService(() => JournalService(journalUnit));
  registerService(NetworkService.new);
  registerService(PowerService.new);
  registerService(TelemetryService.new);
  registerService(UdevService.new);
  registerService(UrlLauncher.new);

  final interfaceSettings = GSettings('org.gnome.desktop.interface');

  onWindowClosed().then((_) async {
    await interfaceSettings.close();
  });

  final appStatus = ValueNotifier(AppStatus.loading);

  runWizardApp(
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
      if (options['machine-config'] != null) ...[
        '--machine-config',
        options['machine-config'],
        '--storage-version=2',
      ],
    ],
    onInitSubiquity: (client) {
      appStatus.value = AppStatus.ready;
      client.setVariant(Variant.DESKTOP);
    },
  );
}

class UbuntuDesktopInstallerApp extends StatelessWidget {
  UbuntuDesktopInstallerApp({
    Key? key,
    this.initialRoute,
    FlavorData? flavor,
    List<Slide>? slides,
    this.appStatus = AppStatus.ready,
  })  : flavor = flavor ?? defaultFlavor,
        slides = slides ?? defaultSlides,
        super(key: key);

  final String? initialRoute;
  final FlavorData flavor;
  final List<Slide> slides;
  final AppStatus appStatus;

  static FlavorData get defaultFlavor {
    return FlavorData(
      name: 'Ubuntu',
      theme: yaruLight,
      darkTheme: yaruDark,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultAssetBundle(
      bundle: assetBundle,
      child: Flavor(
        data: flavor,
        child: SlidesContext(
          slides: slides,
          child: MaterialApp(
            locale: Settings.of(context).locale,
            onGenerateTitle: (context) {
              final lang = AppLocalizations.of(context);
              setWindowTitle(lang.windowTitle(flavor.name));
              return lang.appTitle;
            },
            theme: flavor.theme,
            darkTheme: flavor.darkTheme,
            themeMode: Settings.of(context).theme,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: <LocalizationsDelegate>[
              ...localizationsDelegates,
              ...?flavor.localizationsDelegates,
            ],
            supportedLocales: supportedLocales,
            home: buildApp(context),
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
  const _UbuntuDesktopInstallerLoadingPage({Key? key}) : super(key: key);

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
  const _UbuntuDesktopInstallerWizard({
    Key? key,
    this.initialRoute,
  }) : super(key: key);

  final String? initialRoute;

  @override
  Widget build(BuildContext context) {
    final service = getService<DiskStorageService>();

    return Wizard(
      initialRoute: initialRoute ?? Routes.initial,
      routes: <String, WizardRoute>{
        Routes.welcome: WizardRoute(
          builder: WelcomePage.create,
          onNext: (_) => !service.hasRst ? Routes.keyboardLayout : null,
        ),
        // https://github.com/canonical/ubuntu-desktop-installer/issues/373
        // Routes.tryOrInstall: WizardRoute(
        //   builder: TryOrInstallPage.create,
        //   onNext: (settings) {
        //     switch (settings.arguments as Option?) {
        //       case Option.repairUbuntu:
        //         return Routes.repairUbuntu;
        //       case Option.tryUbuntu:
        //         return Routes.tryUbuntu;
        //       default:
        //         if (model.hasRst) return Routes.turnOffRST;
        //         return Routes.keyboardLayout;
        //     }
        //   },
        // ),
        Routes.turnOffRST: const WizardRoute(
          builder: TurnOffRSTPage.create,
        ),
        Routes.keyboardLayout: const WizardRoute(
          builder: KeyboardLayoutPage.create,
        ),
        Routes.connectToInternet: const WizardRoute(
          builder: ConnectToInternetPage.create,
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
            if (settings.arguments == InstallationType.erase) {
              if (service.hasMultipleDisks) {
                return Routes.selectGuidedStorage;
              } else if (service.hasEncryption) {
                return Routes.chooseSecurityKey;
              } else {
                return Routes.writeChangesToDisk;
              }
            }
            return Routes.allocateDiskSpace;
          },
        ),
        Routes.selectGuidedStorage: WizardRoute(
          builder: SelectGuidedStoragePage.create,
          onNext: (_) =>
              !service.hasEncryption ? Routes.writeChangesToDisk : null,
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
        Routes.whoAreYou: const WizardRoute(
          builder: WhoAreYouPage.create,
        ),
        // https://github.com/canonical/ubuntu-desktop-installer/issues/41
        // Routes.configureActiveDirectory: const WizardRoute(
        //   builder: ConfigureActiveDirectoryPage.create,
        // ),
        // https://github.com/canonical/ubuntu-desktop-installer/issues/373
        // Routes.chooseYourLook: const WizardRoute(
        //   builder: ChooseYourLookPage.create,
        // ),
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
