import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/settings.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru/yaru.dart' as yaru;

import 'l10n.dart';
import 'pages.dart';
import 'routes.dart';

class UbuntuDesktopInstallerApp extends StatelessWidget {
  const UbuntuDesktopInstallerApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Settings.of(context).locale,
      onGenerateTitle: (context) {
        final lang = AppLocalizations.of(context);
        setWindowTitle(lang.windowTitle);
        return lang.appTitle;
      },
      theme: yaru.lightTheme,
      darkTheme: yaru.darkTheme,
      themeMode: Settings.of(context).theme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: _UbuntuDesktopInstallerWizard.create(context),
    );
  }
}

class _UbuntuDesktopInstallerWizard extends StatefulWidget {
  const _UbuntuDesktopInstallerWizard({
    Key? key,
  }) : super(key: key);

  static Widget create(BuildContext context) {
    final client = Provider.of<SubiquityClient>(context, listen: false);
    return ChangeNotifierProvider(
      create: (_) => _UbuntuDesktopInstallerModel(client),
      child: _UbuntuDesktopInstallerWizard(),
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

    return Wizard(
      initialRoute: Routes.welcome,
      routes: <String, WidgetBuilder>{
        Routes.welcome: WelcomePage.create,
        Routes.tryOrInstall: TryOrInstallPage.create,
        if (model.hasRst) Routes.turnOffRST: TurnOffRSTPage.create,
        Routes.keyboardLayout: KeyboardLayoutPage.create,
        Routes.updatesOtherSoftware: UpdatesOtherSoftwarePage.create,
        if (model.hasSecureBoot)
          Routes.configureSecureBoot: ConfigureSecureBootPage.create,
        if (model.hasBitLocker)
          Routes.turnOffBitlocker: TurnOffBitLockerPage.create,
        Routes.installationType: InstallationTypePage.create,
        Routes.allocateDiskSpace: AllocateDiskSpacePage.create,
        Routes.writeChangesToDisk: WriteChangesToDiskPage.create,
        Routes.whoAreYou: WhoAreYouPage.create,
        Routes.chooseYourLook: ChooseYourLookPage.create,
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
