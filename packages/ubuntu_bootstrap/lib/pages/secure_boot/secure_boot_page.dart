import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_bootstrap/l10n.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'secure_boot_model.dart';
import 'secure_boot_widgets.dart';

class SecureBootPage extends ConsumerStatefulWidget {
  const SecureBootPage({super.key});

  static Future<bool> load(WidgetRef ref) {
    return ref.read(secureBootModelProvider.notifier).hasSecureBoot();
  }

  @override
  ConsumerState<SecureBootPage> createState() => _SecureBootPageState();
}

class _SecureBootPageState extends ConsumerState<SecureBootPage> {
  @override
  Widget build(BuildContext context) {
    final model = ref.watch(secureBootModelProvider);
    final lang = AppLocalizations.of(context);
    return WizardPage(
      title: YaruWindowTitleBar(
        title: Text(lang.configureSecureBootTitle),
      ),
      header: Text(lang.configureSecureBootDescription),
      content: LayoutBuilder(
        builder: (context, constraints) {
          final fieldPadding = EdgeInsets.symmetric(
              horizontal: kWizardPadding.left, vertical: 10);
          final fieldWidth = (constraints.maxWidth - fieldPadding.horizontal) *
              kWizardWidthFraction;

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
              const SizedBox(height: kWizardSpacing),
              SecurityKeyConfirmFormField(fieldWidth: fieldWidth),
              const SizedBox(height: kWizardSpacing),
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
        leading: WizardButton.previous(context),
        trailing: [
          WizardButton.next(
            context,
            enabled: model.isFormValid,
          ),
        ],
      ),
    );
  }
}
