import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';
import 'configure_secure_boot_model.dart';
import 'configure_secure_boot_widgets.dart';

class ConfigureSecureBootPage extends StatefulWidget {
  @visibleForTesting
  const ConfigureSecureBootPage({Key? key}) : super(key: key);

  @override
  State<ConfigureSecureBootPage> createState() =>
      _ConfigureSecureBootPageState();

  static Widget create(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          ConfigureSecureBootModel(secureBootMode: SecureBootMode.turnOff),
      child: const ConfigureSecureBootPage(),
    );
  }
}

class _ConfigureSecureBootPageState extends State<ConfigureSecureBootPage> {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<ConfigureSecureBootModel>();
    final lang = AppLocalizations.of(context);
    return WizardPage(
      title: Text(lang.configureSecureBootTitle),
      header: Text(lang.configureSecureBootDescription),
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
                title: Text(lang.configureSecureBootOption),
                value: SecureBootMode.turnOff,
                groupValue: model.secureBootMode,
                onChanged: model.setSecureBootMode,
              ),
              SecurityKeyFormField(fieldWidth: fieldWidth),
              const SizedBox(height: kContentSpacing),
              SecurityKeyConfirmFormField(fieldWidth: fieldWidth),
              const SizedBox(height: kContentSpacing),
              RadioButton<SecureBootMode>(
                title: Text(lang.dontInstallDriverSoftwareNow),
                subtitle: Text(lang.dontInstallDriverSoftwareNowDescription),
                value: SecureBootMode.dontInstall,
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
        ),
      ],
    );
  }
}
