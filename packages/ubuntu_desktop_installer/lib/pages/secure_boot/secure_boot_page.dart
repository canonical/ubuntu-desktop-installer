import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'secure_boot_model.dart';
import 'secure_boot_widgets.dart';

class SecureBootPage extends StatefulWidget {
  @visibleForTesting
  const SecureBootPage({super.key});

  @override
  State<SecureBootPage> createState() => _SecureBootPageState();

  static Widget create(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          SecureBootModel(secureBootMode: SecureBootMode.turnOff),
      child: const SecureBootPage(),
    );
  }
}

class _SecureBootPageState extends State<SecureBootPage> {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<SecureBootModel>();
    final lang = AppLocalizations.of(context);
    return WizardPage(
      title: YaruWindowTitleBar(
        title: Text(lang.configureSecureBootTitle),
      ),
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
              YaruRadioButton<SecureBootMode>(
                title: Text(lang.configureSecureBootOption),
                value: SecureBootMode.turnOff,
                groupValue: model.secureBootMode,
                onChanged: model.setSecureBootMode,
              ),
              SecurityKeyFormField(fieldWidth: fieldWidth),
              const SizedBox(height: kContentSpacing),
              SecurityKeyConfirmFormField(fieldWidth: fieldWidth),
              const SizedBox(height: kContentSpacing),
              YaruRadioButton<SecureBootMode>(
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
      bottomBar: WizardBar(
        leading: WizardAction.back(context),
        trailing: [
          WizardAction.next(
            context,
            enabled: model.isFormValid,
          ),
        ],
      ),
    );
  }
}
