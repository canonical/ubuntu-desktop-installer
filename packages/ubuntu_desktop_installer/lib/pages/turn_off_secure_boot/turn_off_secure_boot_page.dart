import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../widgets/localized_view.dart';
import 'turn_off_secure_boot_model.dart';
import 'turn_off_secure_boot_widgets.dart';

const _kFormElementPadding = 8.0;

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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final model = context.watch<TurnOffSecureBootModel>();
    return LocalizedView(
      builder: (context, lang) => WizardPage(
        title: Text(lang.turnOffSecureBootTitle),
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(lang.turnOffSecureBootDescription),
                ),
                RadioListTile<SecureBootMode>(
                  title: Text(lang.turnOffSecureBootOption),
                  value: SecureBootMode.turnoff,
                  groupValue: model.secureBootMode,
                  onChanged: model.setSecureBootMode,
                ),
                const SizedBox(height: _kFormElementPadding),
                PasswordFormField(
                  onChanged: (value) {
                    model.setSecurityKey(value);
                    _formKey.currentState?.validate();
                  },
                ),
                const SizedBox(height: 24),
                PasswordConfirmFormField(
                  onChanged: (value) {
                    model.setSecurityKey(value);
                    _formKey.currentState?.validate();
                  },
                ),
                const SizedBox(height: _kFormElementPadding),
                RadioListTile<SecureBootMode>(
                  title: Text(lang.dontInstallDriverSoftwareNow),
                  subtitle: Text(lang.dontInstallDriverSoftwareNowDescription),
                  value: SecureBootMode.dontinstall,
                  groupValue: model.secureBootMode,
                  onChanged: model.setSecureBootMode,
                ),
              ],
            ),
          ),
        ),
        actions: <WizardAction>[
          WizardAction(
            label: lang.backButtonText,
            onActivated: Wizard.of(context).back,
          ),
          WizardAction(
            label: lang.continueButtonText,
            enabled: model.isFormValid,
            onActivated: Wizard.of(context).next,
          ),
        ],
      ),
    );
  }
}
