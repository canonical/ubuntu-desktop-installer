import 'package:flutter/material.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';

class SelectLanguagePage extends StatelessWidget {
  const SelectLanguagePage({Key? key}) : super(key: key);

  static Widget create(BuildContext context) => SelectLanguagePage();

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return WizardPage(
      title: Text(lang.selectLanguageTitle),
      actions: [
        WizardAction(
          enabled: false,
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
