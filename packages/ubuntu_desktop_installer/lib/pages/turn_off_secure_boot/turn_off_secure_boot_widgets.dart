import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../widgets.dart';

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.80,
      child: LocalizedView(builder: (context, lang) {
        return ValidatedFormField(
          spacing: 190,
          obscureText: true,
          labelText: lang.chooseSecurityKey,
          onChanged: onChanged,
          validator: RequiredValidator(errorText: ''),
        );
      }),
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
    return FractionallySizedBox(
      widthFactor: 0.80,
      child: LocalizedView(builder: (context, lang) {
        return ValidatedFormField(
          spacing: 190,
          obscureText: true,
          labelText: lang.confirmSecurityKey,
          onChanged: onChanged,
        );
      }),
    );
  }
}
