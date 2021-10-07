part of 'who_are_you_page.dart';

class _RealNameFormField extends StatelessWidget {
  const _RealNameFormField({
    Key? key,
    required this.fieldWidth,
  }) : super(key: key);

  final double? fieldWidth;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final realName =
        context.select<WhoAreYouModel, String>((model) => model.realName);

    return ValidatedFormField(
      fieldWidth: fieldWidth,
      labelText: lang.whoAreYouPageRealNameLabel,
      successWidget: const SuccessIcon(),
      initialValue: realName,
      validator: RequiredValidator(
        errorText: lang.whoAreYouPageRealNameRequired,
      ),
      onChanged: (value) {
        final model = Provider.of<WhoAreYouModel>(context, listen: false);
        model.realName = value;
      },
    );
  }
}

class _HostnameFormField extends StatelessWidget {
  const _HostnameFormField({
    Key? key,
    this.fieldWidth,
  }) : super(key: key);

  final double? fieldWidth;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final hostname =
        context.select<WhoAreYouModel, String>((model) => model.hostname);

    return ValidatedFormField(
      fieldWidth: fieldWidth,
      labelText: lang.whoAreYouPageComputerNameLabel,
      helperText: lang.whoAreYouPageComputerNameInfo,
      successWidget: const SuccessIcon(),
      initialValue: hostname,
      validator: MultiValidator([
        RequiredValidator(
          errorText: lang.whoAreYouPageComputerNameRequired,
        ),
        PatternValidator(
          kValidHostnamePattern,
          errorText: lang.whoAreYouPageInvalidComputerName,
        )
      ]),
      onChanged: (value) {
        final model = Provider.of<WhoAreYouModel>(context, listen: false);
        model.hostname = value;
      },
    );
  }
}

class _UsernameFormField extends StatelessWidget {
  const _UsernameFormField({
    Key? key,
    this.fieldWidth,
  }) : super(key: key);

  final double? fieldWidth;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final username =
        context.select<WhoAreYouModel, String>((model) => model.username);

    return ValidatedFormField(
      fieldWidth: fieldWidth,
      labelText: lang.whoAreYouPageUsernameLabel,
      successWidget: const SuccessIcon(),
      initialValue: username,
      validator: MultiValidator([
        RequiredValidator(
          errorText: lang.whoAreYouPageUsernameRequired,
        ),
        PatternValidator(
          kValidUsernamePattern,
          errorText: lang.whoAreYouPageInvalidUsername,
        )
      ]),
      onChanged: (value) {
        final model = Provider.of<WhoAreYouModel>(context, listen: false);
        model.username = value;
      },
    );
  }
}

class _PasswordFormField extends StatelessWidget {
  const _PasswordFormField({
    Key? key,
    this.fieldWidth,
  }) : super(key: key);

  final double? fieldWidth;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final password =
        context.select<WhoAreYouModel, String>((model) => model.password);
    final passwordStrength = context.select<WhoAreYouModel, PasswordStrength>(
        (model) => model.passwordStrength);

    return ValidatedFormField(
      fieldWidth: fieldWidth,
      labelText: lang.whoAreYouPagePasswordLabel,
      obscureText: true,
      successWidget: PasswordStrengthLabel(strength: passwordStrength),
      initialValue: password,
      validator: RequiredValidator(
        errorText: lang.whoAreYouPagePasswordRequired,
      ),
      onChanged: (value) {
        final model = Provider.of<WhoAreYouModel>(context, listen: false);
        model.password = value;
      },
    );
  }
}

class _ConfirmPasswordFormField extends StatelessWidget {
  const _ConfirmPasswordFormField({
    Key? key,
    required this.fieldWidth,
  }) : super(key: key);

  final double? fieldWidth;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final password =
        context.select<WhoAreYouModel, String>((model) => model.password);
    final confirmedPassword = context
        .select<WhoAreYouModel, String>((model) => model.confirmedPassword);

    return ValidatedFormField(
      obscureText: true,
      fieldWidth: fieldWidth,
      labelText: lang.whoAreYouPageConfirmPasswordLabel,
      successWidget: password.isNotEmpty ? const SuccessIcon() : null,
      initialValue: confirmedPassword,
      autovalidateMode: AutovalidateMode.always,
      validator: EqualValidator(
        password,
        errorText: lang.whoAreYouPagePasswordMismatch,
      ),
      onChanged: (value) {
        final model = Provider.of<WhoAreYouModel>(context, listen: false);
        model.confirmedPassword = value;
      },
    );
  }
}

class _LoginStrategyTile extends StatelessWidget {
  const _LoginStrategyTile({
    Key? key,
    required this.value,
    required this.label,
  }) : super(key: key);

  final LoginStrategy value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final loginStrategy = context
        .select<WhoAreYouModel, LoginStrategy>((model) => model.loginStrategy);

    return RadioButton<LoginStrategy>(
      title: Text(label),
      contentPadding: EdgeInsets.only(left: _kRadioButtonIndentation),
      value: value,
      groupValue: loginStrategy,
      onChanged: (value) {
        final model = Provider.of<WhoAreYouModel>(context, listen: false);
        model.loginStrategy = value!;
      },
    );
  }
}
