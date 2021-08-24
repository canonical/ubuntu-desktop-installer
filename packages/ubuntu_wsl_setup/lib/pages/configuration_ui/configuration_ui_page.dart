import 'package:flutter/material.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';

class ConfigurationUIPage extends StatelessWidget {
  const ConfigurationUIPage({Key? key}) : super(key: key);

  static Widget create(BuildContext context) => ConfigurationUIPage();

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return WizardPage(
      title: Text(lang.configurationUITitle),
      actions: [
        WizardAction(
          label: lang.backButton,
          onActivated: Wizard.of(context).back,
        ),
        WizardAction(
          label: lang.continueButton,
          onActivated: Wizard.of(context).next,
        )
      ],
    );
  }
}
