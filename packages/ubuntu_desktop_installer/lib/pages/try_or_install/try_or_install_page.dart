import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app.dart';
import '../../routes.dart';
import '../../widgets.dart';
import '../wizard_page.dart';
import 'try_or_install_model.dart';

class TryOrInstallPage extends StatefulWidget {
  const TryOrInstallPage({
    Key? key,
  }) : super(key: key);

  static Widget create(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TryOrInstallModel(),
      child: TryOrInstallPage(),
    );
  }

  @override
  TryOrInstallPageState createState() => TryOrInstallPageState();
}

class TryOrInstallPageState extends State<TryOrInstallPage> {
  void continueWithSelectedOption() {
    final model = Provider.of<TryOrInstallModel>(context, listen: false);
    if (model.option == Option.repairUbuntu) {
      Navigator.pushNamed(context, Routes.repairUbuntu);
    } else if (model.option == Option.tryUbuntu) {
      Navigator.pushNamed(context, Routes.tryUbuntu);
    } else if (model.option == Option.installUbuntu) {
      // TODO: detect if we need to show the "Turn off RST" page,
      // or if we can proceed directly to installation
      //Navigator.pushNamed(context, Routes.turnOffRST);
      Navigator.pushNamed(context, Routes.keyboardLayout);
    } else {
      assert(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TryOrInstallModel>(context);
    return LocalizedView(
      builder: (context, lang) => WizardPage(
        title: Text(lang.tryOrInstallPageTitle),
        contentPadding: EdgeInsets.fromLTRB(20, 50, 20, 150),
        content: Row(
          children: [
            Expanded(
              child: OptionCard(
                selected: model.option == Option.repairUbuntu,
                imageAsset: 'assets/repair-wrench.png',
                titleText: lang.repairInstallation,
                bodyText: lang.repairInstallationDescription,
                onSelected: () => model.selectOption(Option.repairUbuntu),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: OptionCard(
                selected: model.option == Option.tryUbuntu,
                imageAsset: 'assets/steering-wheel.png',
                titleText: lang.tryUbuntu,
                bodyText: lang.tryUbuntuDescription,
                onSelected: () => model.selectOption(Option.tryUbuntu),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: OptionCard(
                selected: model.option == Option.installUbuntu,
                imageAsset: 'assets/hard-drive.png',
                titleText: lang.installUbuntu,
                bodyText: lang.installUbuntuDescription,
                onSelected: () => model.selectOption(Option.installUbuntu),
              ),
            ),
          ],
        ),
        footer: Html(
          data: lang.releaseNotesLabel(
              model.releaseNotesURL(UbuntuDesktopInstallerApp.locale)),
          onLinkTap: (url, _, __, ___) => launch(url!),
        ),
        actions: <WizardAction>[
          WizardAction(
            label: lang.backButtonText,
            onActivated: Navigator.of(context).pop,
          ),
          WizardAction(
            label: lang.continueButtonText,
            enabled: model.option != Option.none,
            onActivated: continueWithSelectedOption,
          ),
        ],
      ),
    );
  }
}
