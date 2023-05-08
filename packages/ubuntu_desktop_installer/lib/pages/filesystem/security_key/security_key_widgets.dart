part of 'security_key_page.dart';

class _SecurityKeyFormField extends ConsumerWidget {
  const _SecurityKeyFormField({this.fieldWidth});

  final double? fieldWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final securityKey = ref
        .watch(securityKeyModelProvider.select((model) => model.securityKey));
    final showSecurityKey = ref.watch(
        securityKeyModelProvider.select((model) => model.showSecurityKey));

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
        final model = ref.read(securityKeyModelProvider);
        model.securityKey = value;
      },
    );
  }
}

class _ConfirmSecurityKeyFormField extends ConsumerWidget {
  const _ConfirmSecurityKeyFormField({required this.fieldWidth});

  final double? fieldWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final securityKey = ref
        .watch(securityKeyModelProvider.select((model) => model.securityKey));
    final confirmedSecurityKey = ref.watch(
        securityKeyModelProvider.select((model) => model.confirmedSecurityKey));
    final showSecurityKey = ref.watch(
        securityKeyModelProvider.select((model) => model.showSecurityKey));

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
        final model = ref.read(securityKeyModelProvider);
        model.confirmedSecurityKey = value;
      },
    );
  }
}

class _SecurityKeyShowButton extends ConsumerWidget {
  const _SecurityKeyShowButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final showSecurityKey = ref.watch(
        securityKeyModelProvider.select((model) => model.showSecurityKey));

    return YaruCheckButton(
      value: showSecurityKey,
      title: Text(lang.showSecurityKey),
      onChanged: (value) {
        ref.read(securityKeyModelProvider).showSecurityKey = value!;
      },
    );
  }
}
