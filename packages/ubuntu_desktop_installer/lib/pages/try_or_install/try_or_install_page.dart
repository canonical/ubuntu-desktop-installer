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
      child: const TryOrInstallPage(),
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
    final flavor = Flavor.of(context);
    return WizardPage(
      title: Text(lang.tryOrInstallPageTitle),
      contentPadding: const EdgeInsets.fromLTRB(20, 50, 20, 150),
      content: Row(
        children: [
          Expanded(
            child: OptionCard(
              selected: model.option == Option.repairUbuntu,
              image: FlavorImage.asset('assets/repair-wrench.png'),
              title: Text(lang.repairInstallation),
              body: Text(lang.repairInstallationDescription),
              onSelected: () => model.selectOption(Option.repairUbuntu),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: OptionCard(
              selected: model.option == Option.tryUbuntu,
              image: FlavorImage.asset('assets/steering-wheel.png'),
              title: Text(lang.tryUbuntu(flavor.name)),
              body: Text(lang.tryUbuntuDescription(flavor.name)),
              onSelected: () => model.selectOption(Option.tryUbuntu),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: OptionCard(
              selected: model.option == Option.installUbuntu,
              image: FlavorImage.asset('assets/hard-drive.png'),
              title: Text(lang.installUbuntu(flavor.name)),
              body: Text(lang.installUbuntuDescription(flavor.name)),
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
