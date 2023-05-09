import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/widgets.dart';

import 'secure_boot_model.dart';

class SecurityKeyFormField extends ConsumerWidget {
  const SecurityKeyFormField({
    super.key,
    required this.fieldWidth,
  });

  final double? fieldWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(secureBootModelProvider);
    final lang = AppLocalizations.of(context);
    return Padding(
      padding: kContentIndentation,
      child: ValidatedFormField(
        obscureText: true,
        fieldWidth: fieldWidth,
        labelText: lang.chooseSecurityKey,
        initialValue: model.securityKey,
        onChanged: model.setSecurityKey,
        enabled: model.areTextFieldsEnabled,
        validator: RequiredValidator(
          errorText: lang.configureSecureBootSecurityKeyRequired,
        ),
        successWidget: const SuccessIcon(),
      ),
    );
  }
}

class SecurityKeyConfirmFormField extends ConsumerWidget {
  const SecurityKeyConfirmFormField({
    super.key,
    required this.fieldWidth,
  });

  final double? fieldWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(secureBootModelProvider);
    final lang = AppLocalizations.of(context);
    return Padding(
      padding: kContentIndentation,
      child: ValidatedFormField(
        obscureText: true,
        fieldWidth: fieldWidth,
        labelText: lang.confirmSecurityKey,
        enabled: model.areTextFieldsEnabled,
        initialValue: model.confirmKey,
        onChanged: model.setConfirmKey,
        successWidget:
            model.securityKey.isNotEmpty ? const SuccessIcon() : null,
        validator: EqualValidator(
          model.securityKey,
          errorText: lang.secureBootSecurityKeysDontMatch,
        ),
      ),
    );
  }
}
