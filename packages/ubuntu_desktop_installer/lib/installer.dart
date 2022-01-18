import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';
import 'package:ubuntu_wizard/app.dart';
import 'package:ubuntu_wizard/settings.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru/yaru.dart';

import 'l10n.dart';
import 'pages.dart';
import 'routes.dart';
import 'services.dart';

export 'package:ubuntu_wizard/widgets.dart' show FlavorData;

const _kSystemdUnit = 'snap.ubuntu-desktop-installer.subiquity-server.service';

enum AppStatus { loading, ready }

void runInstallerApp(List<String> args, {FlavorData? flavor}) {
  final options = parseCommandLine(args, onPopulateOptions: (parser) {
    parser.addOption('machine-config',
        valueHelp: 'path',
        defaultsTo: 'examples/simple.json',
        help: 'Path of the machine config (dry-run only)');
  })!;

  final subiquityClient = SubiquityClient();
  final subiquityServer = SubiquityServer();

  final journalUnit = isLiveRun(options) ? _kSystemdUnit : null;

  registerService(() => DiskStorageService(subiquityClient));
  registerService(() => JournalService(journalUnit));
  registerService(KeyboardService.new);
  registerService(NetworkService.new);
  registerService(PowerService.new);
  registerService(TelemetryService.new);
  registerService(UdevService.new);

  final appStatus = ValueNotifier(AppStatus.loading);

  runWizardApp(
    ValueListenableBuilder<AppStatus>(
      valueListenable: appStatus,
      builder: (context, value, child) {
        return UbuntuDesktopInstallerApp(
          appStatus: value,
          flavor: flavor,
          initialRoute: options['initial-route'],
        );
      },
    ),
    options: options,
    subiquityClient: subiquityClient,
    subiquityServer: subiquityServer,
    serverArgs: [
      if (options['machine-config'] != null) ...[
        '--machine-config',
        options['machine-config'],
      ],
    ],
    serverEnvironment: {
      // so subiquity doesn't think it's the installer or flutter snap...
      'SNAP': '.',
      'SNAP_NAME': 'subiquity',
      'SNAP_REVISION': '',
      'SNAP_VERSION': '',
    },
    onInitSubiquity: (client) {
      appStatus.value = AppStatus.ready;
      client.setVariant(Variant.DESKTOP);
      client.setTimezone('geoip');
    },
  );
}

class UbuntuDesktopInstallerApp extends StatelessWidget {
  UbuntuDesktopInstallerApp({
    Key? key,
    this.initialRoute,
    FlavorData? flavor,
    this.appStatus = AppStatus.ready,
  })  : flavor = flavor ?? defaultFlavor,
        super(key: key);

  final String? initialRoute;
  final FlavorData flavor;
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
    return Flavor(
      data: flavor.copyWith(package: 'ubuntu_desktop_installer'),
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
    );
  }

  Widget buildApp(BuildContext context) {
    switch (appStatus) {
      case AppStatus.loading:
        return _UbuntuDesktopInstallerLoadingPage();
      case AppStatus.ready:
        return _UbuntuDesktopInstallerWizard.create(context, initialRoute);
    }
  }
}

class _UbuntuDesktopInstallerLoadingPage extends StatelessWidget {
  const _UbuntuDesktopInstallerLoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WizardPage(
      title: Text(AppLocalizations.of(context).welcome),
      content: FractionallySizedBox(
        widthFactor: 0.5,
        child: RoundedContainer(),
      ),
      actions: <WizardAction>[
        WizardAction.back(context, enabled: false),
        WizardAction.next(context, enabled: false),
      ],
    );
  }
}

class _UbuntuDesktopInstallerWizard extends StatefulWidget {
  const _UbuntuDesktopInstallerWizard({
    Key? key,
    this.initialRoute,
  }) : super(key: key);

  final String? initialRoute;

  static Widget create(BuildContext context, String? initialRoute) {
    final client = getService<SubiquityClient>();
    return ChangeNotifierProvider(
      create: (_) => _UbuntuDesktopInstallerModel(client),
      child: _UbuntuDesktopInstallerWizard(initialRoute: initialRoute),
    );
  }

  @override
  State<_UbuntuDesktopInstallerWizard> createState() =>
      _UbuntuDesktopInstallerWizardState();
}

class _UbuntuDesktopInstallerWizardState
    extends State<_UbuntuDesktopInstallerWizard> {
  @override
  void initState() {
    super.initState();
    final model =
        Provider.of<_UbuntuDesktopInstallerModel>(context, listen: false);
    model.init();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<_UbuntuDesktopInstallerModel>(context);
    final service = getService<DiskStorageService>();

    return Wizard(
      initialRoute: widget.initialRoute ?? Routes.initial,
      routes: <String, WizardRoute>{
        Routes.welcome: WizardRoute(
          builder: WelcomePage.create,
          onNext: (_) => !model.hasRst ? Routes.keyboardLayout : null,
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
          onNext: (_) => !model.hasSecureBoot ? Routes.installationType : null,
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
          onNext: (_) => !model.hasBitLocker ? Routes.whoAreYou : null,
        ),
        Routes.turnOffBitlocker: const WizardRoute(
          builder: TurnOffBitLockerPage.create,
        ),
        // https://github.com/canonical/ubuntu-desktop-installer/issues/38
        // Routes.whereAreYou: const WizardRoute(
        //   builder: WhereAreYouPage.create,
        // ),
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

class _UbuntuDesktopInstallerWizardObserver extends NavigatorObserver {
  _UbuntuDesktopInstallerWizardObserver(this._telemetryService);

  final TelemetryService _telemetryService;

  @override
  void didPush(Route route, Route? previousRoute) {
    if (route.settings.name != null) {
      _telemetryService.addStage(route.settings.name!);
    }
  }
}

class _UbuntuDesktopInstallerModel extends ChangeNotifier {
  _UbuntuDesktopInstallerModel(this._client);

  final SubiquityClient _client;
  var _hasRst = false;
  var _hasBitLocker = false;

  bool get hasRst => _hasRst;
  bool get hasBitLocker => _hasBitLocker;
  // TODO: add secure boot support
  bool get hasSecureBoot => false;

  Future<void> init() {
    return Future.wait([
      _client.hasRst().then(_updateHasRst),
      _client.hasBitLocker().then(_updateHasBitLocker),
    ]);
  }

  void _updateHasRst(bool hasRst) {
    if (_hasRst == hasRst) return;
    _hasRst = hasRst;
    notifyListeners();
  }

  void _updateHasBitLocker(bool hasBitLocker) {
    if (_hasBitLocker == hasBitLocker) return;
    _hasBitLocker = hasBitLocker;
    notifyListeners();
  }
}
