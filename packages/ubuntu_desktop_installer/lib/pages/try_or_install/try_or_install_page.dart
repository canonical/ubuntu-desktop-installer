import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_wizard/settings.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../l10n.dart';
import 'try_or_install_model.dart';

export 'try_or_install_model.dart' show Option;

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
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TryOrInstallModel>(context);
    final lang = AppLocalizations.of(context);
    return WizardPage(
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
            model.releaseNotesURL(Settings.of(context).locale)),
        onLinkTap: (url, _, __, ___) => launch(url!),
      ),
      actions: <WizardAction>[
        WizardAction.back(context),
        WizardAction.next(
          context,
          enabled: model.option != Option.none,
          onActivated: () => Wizard.of(context).next(arguments: model.option),
        ),
      ],
    );
  }
}
