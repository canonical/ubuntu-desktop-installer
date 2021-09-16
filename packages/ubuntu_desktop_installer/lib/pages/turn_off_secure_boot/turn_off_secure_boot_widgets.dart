import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';
import 'turn_off_secure_boot_model.dart';

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<TurnOffSecureBootModel>();
    final lang = AppLocalizations.of(context);
    return FractionallySizedBox(
      widthFactor: 0.80,
      child: ValidatedFormField(
        obscureText: true,
        fieldWidth: 580,
        labelText: lang.chooseSecurityKey,
        onChanged: model.setSecurityKey,
        enabled: model.areTextFieldEnabled,
        validator: RequiredValidator(
          errorText: lang.turnOffSecureBootPasswordRequired,
        ),
        successWidget: const SuccessIcon(),
      ),
    );
  }
}

class PasswordConfirmFormField extends StatelessWidget {
  const PasswordConfirmFormField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<TurnOffSecureBootModel>();
    final lang = AppLocalizations.of(context);
    return FractionallySizedBox(
      widthFactor: 0.80,
      child: ValidatedFormField(
        obscureText: true,
        fieldWidth: 580,
        labelText: lang.confirmSecurityKey,
        initialValue: null,
        enabled: model.areTextFieldEnabled,
        onChanged: model.setConfirmKey,
        successWidget:
            model.securityKey.isNotEmpty ? const SuccessIcon() : null,
        validator: EqualValidator(
          model.securityKey,
          errorText: lang.whoAreYouPagePasswordMismatch,
        ),
      ),
    );
  }
}
