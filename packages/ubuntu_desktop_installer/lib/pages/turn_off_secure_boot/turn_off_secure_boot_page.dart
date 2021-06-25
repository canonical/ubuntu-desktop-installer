import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/localized_view.dart';
import '../wizard_page.dart';
import 'turn_off_secure_boot_model.dart';

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
                _PasswordSizedBox(
                  child: TextField(
                    obscureText: true,
                    onChanged: (value) {
                      model.setSecurityKey(value);
                      _formKey.currentState?.validate();
                    },
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: lang.chooseSecurityKey,
                        enabled: model.areTextFieldEnabled),
                  ),
                ),
                const SizedBox(height: _kFormElementPadding),
                _PasswordSizedBox(
                  child: TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (!model.isConfrmationKeyValid) {
                        return lang.secureBootPasswordsDontMatch;
                      }
                      return '';
                    },
                    onChanged: (value) {
                      model.setConfirmKey(value);
                      _formKey.currentState?.validate();
                    },
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: lang.confirmSecurityKey,
                        enabled: model.areTextFieldEnabled),
                  ),
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
            onActivated: Navigator.of(context).pop,
          ),
          WizardAction(
            label: lang.continueButtonText,
            onActivated: model.isFormValid
                ? () {
                    // TODO: add next step here
                  }
                : null,
          ),
        ],
      ),
    );
  }
}

class _PasswordSizedBox extends StatelessWidget {
  final Widget child;

  const _PasswordSizedBox({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.centerLeft,
      widthFactor: 0.65,
      child: Padding(
        padding: const EdgeInsets.only(left: 90),
        child: child,
      ),
    );
  }
}
