import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';
import 'turn_off_secure_boot_model.dart';
import 'turn_off_secure_boot_widgets.dart';

class TurnOffSecureBootPage extends StatefulWidget {
  @override
  _TurnOffSecureBootPageState createState() => _TurnOffSecureBootPageState();

  static Widget create(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          TurnOffSecureBootModel(secureBootMode: SecureBootMode.turnoff),
      child: TurnOffSecureBootPage(),
    );
  }
}

class _TurnOffSecureBootPageState extends State<TurnOffSecureBootPage> {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<TurnOffSecureBootModel>();
    final lang = AppLocalizations.of(context);
    return WizardPage(
      title: Text(lang.turnOffSecureBootTitle),
      header: Text(lang.turnOffSecureBootDescription),
      content: LayoutBuilder(
        builder: (context, constraints) {
          final fieldPadding = EdgeInsets.symmetric(
              horizontal: kContentPadding.left, vertical: 10);
          final fieldWidth = (constraints.maxWidth - fieldPadding.horizontal) *
              kContentWidthFraction;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RadioButton<SecureBootMode>(
                title: Text(lang.turnOffSecureBootOption),
                value: SecureBootMode.turnoff,
                groupValue: model.secureBootMode,
                onChanged: model.setSecureBootMode,
              ),
              PasswordFormField(fieldWidth: fieldWidth),
              const SizedBox(height: kContentSpacing),
              PasswordConfirmFormField(fieldWidth: fieldWidth),
              const SizedBox(height: kContentSpacing),
              RadioButton<SecureBootMode>(
                title: Text(lang.dontInstallDriverSoftwareNow),
                subtitle: Text(lang.dontInstallDriverSoftwareNowDescription),
                value: SecureBootMode.dontinstall,
                groupValue: model.secureBootMode,
                onChanged: model.setSecureBootMode,
              ),
            ],
          );
        },
      ),
      actions: <WizardAction>[
        WizardAction.back(context),
        WizardAction.next(
          context,
          enabled: model.isFormValid,
          onActivated: Wizard.of(context).next,
        ),
      ],
    );
  }
}
