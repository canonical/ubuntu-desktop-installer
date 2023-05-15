import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'identity_model.dart';

part 'identity_widgets.dart';

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
        final fieldPadding = EdgeInsets.symmetric(
            horizontal: kContentPadding.left, vertical: 10);
        final fieldWidth = (constraints.maxWidth - fieldPadding.horizontal) *
            kContentWidthFraction;

        return ListView(
          children: [
            Padding(
              padding: fieldPadding,
              child: _RealNameFormField(fieldWidth: fieldWidth),
            ),
            Padding(
              padding: fieldPadding,
              child: _HostnameFormField(fieldWidth: fieldWidth),
            ),
            Padding(
              padding: fieldPadding,
              child: _UsernameFormField(fieldWidth: fieldWidth),
            ),
            Padding(
              padding: fieldPadding,
              child: _PasswordFormField(fieldWidth: fieldWidth),
            ),
            Padding(
              padding: fieldPadding,
              child: _ConfirmPasswordFormField(fieldWidth: fieldWidth),
            ),
            const SizedBox(height: kContentSpacing / 2),
            const _AutoLoginSwitch(),
            const SizedBox(height: kContentSpacing / 2),
            const Padding(
              padding: kContentPadding,
              child: _UseActiveDirectoryCheckButton(),
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
            arguments: ref.watch(
                identityModelProvider.select((m) => m.useActiveDirectory)),
            onNext: ref.read(identityModelProvider).save,
          ),
        ],
      ),
    );
  }
}
