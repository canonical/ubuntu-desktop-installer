part of 'choose_security_key_page.dart';

class _SecurityKeyFormField extends StatelessWidget {
  const _SecurityKeyFormField({this.fieldWidth});

  final double? fieldWidth;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final securityKey = context
        .select<ChooseSecurityKeyModel, String>((model) => model.securityKey);

    return ValidatedFormField(
      fieldWidth: fieldWidth,
      labelText: lang.chooseSecurityKeyHint,
      obscureText: true,
      successWidget: securityKey.isNotEmpty ? const SuccessIcon() : null,
      initialValue: securityKey,
      validator: RequiredValidator(
        errorText: lang.chooseSecurityKeyRequired,
      ),
      onChanged: (value) {
        final model =
            Provider.of<ChooseSecurityKeyModel>(context, listen: false);
        model.securityKey = value;
      },
    );
  }
}

class _ConfirmSecurityKeyFormField extends StatelessWidget {
  const _ConfirmSecurityKeyFormField({required this.fieldWidth});

  final double? fieldWidth;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final securityKey = context
        .select<ChooseSecurityKeyModel, String>((model) => model.securityKey);
    final confirmedSecurityKey = context.select<ChooseSecurityKeyModel, String>(
        (model) => model.confirmedSecurityKey);

    return ValidatedFormField(
      fieldWidth: fieldWidth,
      labelText: lang.chooseSecurityKeyConfirmHint,
      obscureText: true,
      successWidget:
          confirmedSecurityKey.isNotEmpty ? const SuccessIcon() : null,
      initialValue: confirmedSecurityKey,
      autovalidateMode: AutovalidateMode.always,
      validator: EqualValidator(
        securityKey,
        errorText: lang.chooseSecurityKeyMismatch,
      ),
      onChanged: (value) {
        final model =
            Provider.of<ChooseSecurityKeyModel>(context, listen: false);
        model.confirmedSecurityKey = value;
      },
    );
  }
}
