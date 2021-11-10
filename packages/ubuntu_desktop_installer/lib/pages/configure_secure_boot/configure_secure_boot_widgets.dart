import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';
import 'configure_secure_boot_model.dart';

class SecurityKeyFormField extends StatelessWidget {
  const SecurityKeyFormField({
    Key? key,
    required this.fieldWidth,
  }) : super(key: key);

  final double? fieldWidth;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ConfigureSecureBootModel>();
    final lang = AppLocalizations.of(context);
    return RadioIconTile(
      contentPadding: EdgeInsets.zero,
      title: ValidatedFormField(
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

class SecurityKeyConfirmFormField extends StatelessWidget {
  const SecurityKeyConfirmFormField({
    Key? key,
    required this.fieldWidth,
  }) : super(key: key);

  final double? fieldWidth;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ConfigureSecureBootModel>();
    final lang = AppLocalizations.of(context);
    return RadioIconTile(
      contentPadding: EdgeInsets.zero,
      title: ValidatedFormField(
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
