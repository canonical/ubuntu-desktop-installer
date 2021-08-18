import 'package:flutter/material.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';

class AdvancedSetupPage extends StatelessWidget {
  const AdvancedSetupPage({Key? key}) : super(key: key);

  static Widget create(BuildContext context) => AdvancedSetupPage();

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return WizardPage(
      title: Text(lang.advancedSetupTitle),
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
