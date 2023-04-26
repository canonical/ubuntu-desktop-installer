part of 'security_key_page.dart';

class _SecurityKeyFormField extends StatelessWidget {
  const _SecurityKeyFormField({this.fieldWidth});

  final double? fieldWidth;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final securityKey =
        context.select<SecurityKeyModel, String>((model) => model.securityKey);
    final showSecurityKey = context
        .select<SecurityKeyModel, bool>((model) => model.showSecurityKey);

    return ValidatedFormField(
      fieldWidth: fieldWidth,
      labelText: lang.chooseSecurityKeyHint,
      obscureText: !showSecurityKey,
      successWidget: securityKey.isNotEmpty ? const SuccessIcon() : null,
      initialValue: securityKey,
      validator: RequiredValidator(
        errorText: lang.chooseSecurityKeyRequired,
      ),
      onChanged: (value) {
        final model = Provider.of<SecurityKeyModel>(context, listen: false);
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
    final securityKey =
        context.select<SecurityKeyModel, String>((model) => model.securityKey);
    final confirmedSecurityKey = context.select<SecurityKeyModel, String>(
        (model) => model.confirmedSecurityKey);
    final showSecurityKey = context
        .select<SecurityKeyModel, bool>((model) => model.showSecurityKey);

    return ValidatedFormField(
      fieldWidth: fieldWidth,
      labelText: lang.chooseSecurityKeyConfirmHint,
      obscureText: !showSecurityKey,
      successWidget:
          confirmedSecurityKey.isNotEmpty ? const SuccessIcon() : null,
      initialValue: confirmedSecurityKey,
      autovalidateMode: AutovalidateMode.always,
      validator: EqualValidator(
        securityKey,
        errorText: lang.chooseSecurityKeyMismatch,
      ),
      onChanged: (value) {
        final model = Provider.of<SecurityKeyModel>(context, listen: false);
        model.confirmedSecurityKey = value;
      },
    );
  }
}

class _SecurityKeyShowButton extends StatelessWidget {
  const _SecurityKeyShowButton();

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final showSecurityKey = context
        .select<SecurityKeyModel, bool>((model) => model.showSecurityKey);

    return YaruCheckButton(
      value: showSecurityKey,
      title: Text(lang.showSecurityKey),
      onChanged: (value) {
        context.read<SecurityKeyModel>().showSecurityKey = value!;
      },
    );
  }
}
