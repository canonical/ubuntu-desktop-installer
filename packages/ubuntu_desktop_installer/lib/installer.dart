import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';
import 'package:ubuntu_wizard/app.dart';
import 'package:ubuntu_wizard/settings.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru/yaru.dart' as yaru;

import 'l10n.dart';
import 'pages.dart';
import 'routes.dart';
import 'services.dart';

export 'package:ubuntu_wizard/widgets.dart' show FlavorData;

const _kSystemdUnit = 'snap.ubuntu-desktop-installer.subiquity-server.service';

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

  runWizardApp(
    UbuntuDesktopInstallerApp(
      flavor: flavor,
      initialRoute: options['initial-route'],
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
    providers: [
      Provider(create: (_) => DiskStorageService(subiquityClient)),
      Provider(create: (_) => JournalService(journalUnit)),
      Provider(create: (_) => KeyboardService()),
      Provider(create: (_) => UdevService()),
    ],
    onInitSubiquity: (client) {
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
  })  : flavor = flavor ?? defaultFlavor,
        super(key: key);

  final String? initialRoute;
  final FlavorData flavor;

  static FlavorData get defaultFlavor {
    return FlavorData(
      name: 'Ubuntu',
      theme: yaru.lightTheme,
      darkTheme: yaru.darkTheme,
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
          setWindowTitle(lang.windowTitle);
          return lang.appTitle;
        },
        theme: flavor.theme,
        darkTheme: flavor.darkTheme,
        themeMode: Settings.of(context).theme,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: _UbuntuDesktopInstallerWizard.create(context, initialRoute),
      ),
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
    final client = Provider.of<SubiquityClient>(context, listen: false);
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
    final service = Provider.of<DiskStorageService>(context, listen: false);

    return Wizard(
      initialRoute: widget.initialRoute ?? Routes.welcome,
      routes: <String, WidgetBuilder>{
        Routes.welcome: WelcomePage.create,
        // https://github.com/canonical/ubuntu-desktop-installer/issues/373
        // Routes.tryOrInstall: TryOrInstallPage.create,
        if (model.hasRst) Routes.turnOffRST: TurnOffRSTPage.create,
        Routes.keyboardLayout: KeyboardLayoutPage.create,
        Routes.updatesOtherSoftware: UpdatesOtherSoftwarePage.create,
        if (model.hasSecureBoot)
          Routes.configureSecureBoot: ConfigureSecureBootPage.create,
        if (model.hasEncryption)
          Routes.chooseSecurityKey: ChooseSecurityKeyPage.create,
        if (model.hasBitLocker)
          Routes.turnOffBitlocker: TurnOffBitLockerPage.create,
        Routes.installationType: InstallationTypePage.create,
        Routes.selectGuidedStorage: SelectGuidedStoragePage.create,
        Routes.allocateDiskSpace: AllocateDiskSpacePage.create,
        Routes.writeChangesToDisk: WriteChangesToDiskPage.create,
        Routes.whoAreYou: WhoAreYouPage.create,
        // https://github.com/canonical/ubuntu-desktop-installer/issues/373
        // Routes.chooseYourLook: ChooseYourLookPage.create,
        Routes.installationSlides: InstallationSlidesPage.create,
        Routes.installationComplete: InstallationCompletePage.create,
      },
      onNext: (settings) {
        switch (settings.name) {
          case Routes.tryOrInstall:
            switch (settings.arguments as Option?) {
              case Option.repairUbuntu:
                return Routes.repairUbuntu;
              case Option.tryUbuntu:
                return Routes.tryUbuntu;
              default:
                if (model.hasRst) return Routes.turnOffRST;
                return Routes.keyboardLayout;
            }
          case Routes.installationType:
            if (settings.arguments == InstallationType.erase) {
              if (service.hasMultipleDisks) {
                return Routes.selectGuidedStorage;
              } else {
                return Routes.writeChangesToDisk;
              }
            }
            return Routes.allocateDiskSpace;
          case Routes.selectGuidedStorage:
            return Routes.writeChangesToDisk;
          default:
            return null;
        }
      },
    );
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
  // TODO: add encryption support
  bool get hasEncryption => false;

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
