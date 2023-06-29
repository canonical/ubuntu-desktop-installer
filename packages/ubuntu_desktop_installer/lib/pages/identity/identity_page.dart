import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'identity_model.dart';
import 'identity_widgets.dart';

// The horizontal indentation of the radio button.
// const _kRadioButtonIndentation = 36.0;

/// The installer page for setting up the user data.
///
/// It uses [WizardPage] and [WizardAction] to create an installer page.
class IdentityPage extends ConsumerWidget {
  /// Creates a the installer page for setting up the user data.
  const IdentityPage({super.key});

  static Future<bool> load(WidgetRef ref) {
    return ref.read(identityModelProvider).init().then((_) => true);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);

    return WizardPage(
      contentPadding: EdgeInsets.zero,
      title: YaruWindowTitleBar(
        title: Text(lang.whoAreYouPageTitle),
      ),
      content: LayoutBuilder(builder: (context, constraints) {
        final fieldPadding =
            EdgeInsets.symmetric(horizontal: kWizardPadding.left, vertical: 10);
        final fieldWidth = (constraints.maxWidth - fieldPadding.horizontal) *
            kWizardWidthFraction;

        return ListView(
          children: [
            Padding(
              padding: fieldPadding,
              child: RealNameFormField(fieldWidth: fieldWidth),
            ),
            Padding(
              padding: fieldPadding,
              child: HostnameFormField(fieldWidth: fieldWidth),
            ),
            Padding(
              padding: fieldPadding,
              child: UsernameFormField(fieldWidth: fieldWidth),
            ),
            Padding(
              padding: fieldPadding,
              child: PasswordFormField(fieldWidth: fieldWidth),
            ),
            Padding(
              padding: fieldPadding,
              child: ConfirmPasswordFormField(fieldWidth: fieldWidth),
            ),
            const SizedBox(height: kWizardSpacing / 2),
            const AutoLoginSwitch(),
            const SizedBox(height: kWizardSpacing / 2),
            const Padding(
              padding: kWizardPadding,
              child: UseActiveDirectoryCheckButton(),
            ),
          ],
        );
      }),
      bottomBar: WizardBar(
        leading: WizardButton.previous(context),
        trailing: [
          WizardButton.next(
            context,
            enabled: ref.watch(identityModelProvider.select((m) => m.isValid)),
            onNext: ref.read(identityModelProvider).save,
          ),
        ],
      ),
    );
  }
}
