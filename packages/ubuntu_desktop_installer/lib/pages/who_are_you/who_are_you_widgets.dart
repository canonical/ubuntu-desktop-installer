part of 'who_are_you_page.dart';

class _RealNameFormField extends StatelessWidget {
  const _RealNameFormField({
    Key? key,
    required this.fieldWidth,
  }) : super(key: key);

  final double? fieldWidth;

  @override
  Widget build(BuildContext context) {
    return LocalizedView(builder: (context, lang) {
      final realName =
          context.select<WhoAreYouModel, String>((model) => model.realName);

      return ValidatedFormField(
        fieldWidth: fieldWidth,
        spacing: _kIconSpacing,
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
    });
  }
}

class _HostNameFormField extends StatelessWidget {
  const _HostNameFormField({
    Key? key,
    this.fieldWidth,
  }) : super(key: key);

  final double? fieldWidth;

  @override
  Widget build(BuildContext context) {
    return LocalizedView(builder: (context, lang) {
      final hostName =
          context.select<WhoAreYouModel, String>((model) => model.hostName);

      return ValidatedFormField(
        fieldWidth: fieldWidth,
        spacing: _kIconSpacing,
        labelText: lang.whoAreYouPageComputerNameLabel,
        helperText: lang.whoAreYouPageComputerNameInfo,
        successWidget: const SuccessIcon(),
        initialValue: hostName,
        validator: MultiValidator([
          RequiredValidator(
            errorText: lang.whoAreYouPageComputerNameRequired,
          ),
          PatternValidator(
            kValidHostNamePattern,
            errorText: lang.whoAreYouPageInvalidComputerName,
          )
        ]),
        onChanged: (value) {
          final model = Provider.of<WhoAreYouModel>(context, listen: false);
          model.hostName = value;
        },
      );
    });
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
    return LocalizedView(builder: (context, lang) {
      final username =
          context.select<WhoAreYouModel, String>((model) => model.username);

      return ValidatedFormField(
        fieldWidth: fieldWidth,
        spacing: _kIconSpacing,
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
    });
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
    return LocalizedView(builder: (context, lang) {
      final password =
          context.select<WhoAreYouModel, String>((model) => model.password);
      final passwordStrength = context.select<WhoAreYouModel, PasswordStrength>(
          (model) => model.passwordStrength);

      return ValidatedFormField(
        fieldWidth: fieldWidth,
        spacing: _kIconSpacing,
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
    });
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
    return LocalizedView(builder: (context, lang) {
      final password =
          context.select<WhoAreYouModel, String>((model) => model.password);
      final confirmedPassword = context
          .select<WhoAreYouModel, String>((model) => model.confirmedPassword);

      return ValidatedFormField(
        obscureText: true,
        fieldWidth: fieldWidth,
        spacing: _kIconSpacing,
        labelText: lang.whoAreYouPageConfirmPasswordLabel,
        successWidget: SuccessIcon(),
        initialValue: confirmedPassword,
        validator: EqualValidator(
          password,
          errorText: lang.whoAreYouPagePasswordMismatch,
        ),
        onChanged: (value) {
          final model = Provider.of<WhoAreYouModel>(context, listen: false);
          model.confirmedPassword = value;
        },
      );
    });
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
    return LocalizedView(
      builder: (context, lang) {
        final loginStrategy = context.select<WhoAreYouModel, LoginStrategy>(
            (model) => model.loginStrategy);

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
      },
    );
  }
}
