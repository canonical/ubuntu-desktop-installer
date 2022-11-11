part of 'who_are_you_page.dart';

class _RealNameFormField extends StatelessWidget {
  const _RealNameFormField({required this.fieldWidth});

  final double? fieldWidth;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final realName =
        context.select<WhoAreYouModel, String>((model) => model.realName);

    return ValidatedFormField(
      autofocus: true,
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
  const _HostnameFormField({this.fieldWidth});

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

extension UsernameValidationL10n on UsernameValidation {
  String localize(AppLocalizations lang) {
    switch (this) {
      case UsernameValidation.OK:
        return '';
      case UsernameValidation.ALREADY_IN_USE:
        return lang.whoAreYouPageUsernameInUse;
      case UsernameValidation.SYSTEM_RESERVED:
        return lang.whoAreYouPageUsernameSystemReserved;
      case UsernameValidation.INVALID_CHARS:
        return lang.whoAreYouPageUsernameInvalidChars;
      case UsernameValidation.TOO_LONG:
        return lang.whoAreYouPageUsernameTooLong;
      default:
        throw UnimplementedError(toString());
    }
  }
}

class _UsernameFormField extends StatelessWidget {
  const _UsernameFormField({this.fieldWidth});

  final double? fieldWidth;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final username =
        context.select<WhoAreYouModel, String>((model) => model.username);
    final validation = context.select<WhoAreYouModel, UsernameValidation>(
        (model) => model.usernameValidation);
    final model = context.read<WhoAreYouModel>();

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
        ),
        CallbackValidator(
          (_) => model.usernameOk,
          errorText: validation.localize(lang),
        ),
      ]),
      onChanged: (value) async {
        final model = Provider.of<WhoAreYouModel>(context, listen: false);
        model.username = value;
        await model.validate();
      },
    );
  }
}

class _PasswordFormField extends StatelessWidget {
  const _PasswordFormField({this.fieldWidth});

  final double? fieldWidth;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final password =
        context.select<WhoAreYouModel, String>((model) => model.password);
    final passwordStrength = context.select<WhoAreYouModel, PasswordStrength>(
        (model) => model.passwordStrength);
    final showPassword =
        context.select<WhoAreYouModel, bool>((model) => model.showPassword);

    return ValidatedFormField(
      fieldWidth: fieldWidth,
      labelText: lang.whoAreYouPagePasswordLabel,
      obscureText: !showPassword,
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
  const _ConfirmPasswordFormField({required this.fieldWidth});

  final double? fieldWidth;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final password =
        context.select<WhoAreYouModel, String>((model) => model.password);
    final confirmedPassword = context
        .select<WhoAreYouModel, String>((model) => model.confirmedPassword);
    final showPassword =
        context.select<WhoAreYouModel, bool>((model) => model.showPassword);

    return ValidatedFormField(
      obscureText: !showPassword,
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

class _ShowPasswordCheckButton extends StatelessWidget {
  const _ShowPasswordCheckButton();

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final showPassword =
        context.select<WhoAreYouModel, bool>((model) => model.showPassword);

    return YaruCheckButton(
      value: showPassword,
      title: Text(lang.whoAreYouPageShowPassword),
      onChanged: (value) {
        final model = Provider.of<WhoAreYouModel>(context, listen: false);
        model.showPassword = value!;
      },
    );
  }
}

class _AutoLoginSwitch extends StatelessWidget {
  const _AutoLoginSwitch();

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final autoLogin =
        context.select<WhoAreYouModel, bool>((model) => model.autoLogin);

    return YaruSwitchButton(
      title: Text(lang.whoAreYouPageRequirePassword),
      contentPadding: kContentPadding,
      value: !autoLogin,
      onChanged: (value) {
        final model = Provider.of<WhoAreYouModel>(context, listen: false);
        model.autoLogin = !value;
      },
    );
  }
}
