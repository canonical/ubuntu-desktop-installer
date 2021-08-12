import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:subiquity_client/subiquity_server.dart';
import 'package:wizard_router/wizard_router.dart';
import 'package:yaru/yaru.dart' as yaru;

import 'app.dart';
import 'l10n/app_localizations.dart';
import 'pages.dart';
import 'routes.dart';
import 'settings.dart';
import 'utils.dart';

void main(List<String> args) {
  final options = parseCommandLine(args, showMachineConfig: true)!;
  runWizardApp(
    UbuntuDesktopInstallerApp(),
    serverMode:
        options['dry-run'] == true ? ServerMode.DRY_RUN : ServerMode.LIVE,
    serverArgs: [
      if (options['machine-config'] != null) ...[
        '--machine-config',
        options['machine-config'],
      ],
    ],
  );
}

class UbuntuDesktopInstallerApp extends StatelessWidget {
  const UbuntuDesktopInstallerApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Settings.of(context).locale,
      onGenerateTitle: (context) {
        final lang = AppLocalizations.of(context)!;
        setWindowTitle(lang.windowTitle);
        return lang.appTitle;
      },
      theme: yaru.lightTheme,
      darkTheme: yaru.darkTheme,
      themeMode: Settings.of(context).theme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        ...AppLocalizations.localizationsDelegates,
        const LocalizationsDelegateOc(),
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: Wizard(
        initialRoute: Routes.welcome,
        routes: <String, WidgetBuilder>{
          Routes.welcome: WelcomePage.create,
          Routes.tryOrInstall: TryOrInstallPage.create,
          Routes.turnOffRST: TurnOffRSTPage.create,
          Routes.turnOffBitlocker: TurnOffBitLockerPage.create,
          Routes.keyboardLayout: KeyboardLayoutPage.create,
          Routes.updatesOtherSoftware: UpdatesOtherSoftwarePage.create,
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
                  // TODO: detect if we need to show the "Turn off RST" page,
                  // or if we can proceed directly to installation
                  //return Routes.turnOffRST;
                  return Routes.keyboardLayout;
              }
            default:
              return null;
          }
        },
      ),
    );
  }
}
