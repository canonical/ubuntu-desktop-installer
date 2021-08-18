import 'package:flutter/material.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';

class SetupCompletePage extends StatelessWidget {
  const SetupCompletePage({Key? key}) : super(key: key);

  static Widget create(BuildContext context) => SetupCompletePage();

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return WizardPage(
      title: Text(lang.setupCompleteTitle),
      actions: [
        WizardAction(
          label: lang.finishButton,
          onActivated: closeWindow,
        )
      ],
    );
  }
}
