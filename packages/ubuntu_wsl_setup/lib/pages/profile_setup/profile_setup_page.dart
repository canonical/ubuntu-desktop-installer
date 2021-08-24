import 'package:flutter/material.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';

class ProfileSetupPage extends StatelessWidget {
  const ProfileSetupPage({Key? key}) : super(key: key);

  static Widget create(BuildContext context) => ProfileSetupPage();

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return WizardPage(
      title: Text(lang.profileSetupTitle),
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
