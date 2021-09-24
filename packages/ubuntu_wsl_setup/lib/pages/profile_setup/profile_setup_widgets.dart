part of 'profile_setup_page.dart';

class _RealNameFormField extends StatelessWidget {
  const _RealNameFormField({
    Key? key,
    required this.fieldWidth,
  }) : super(key: key);

  final double? fieldWidth;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final realname =
        context.select<ProfileSetupModel, String>((model) => model.realname);

    return ValidatedFormField(
      fieldWidth: fieldWidth,
      labelText: lang.profileSetupRealnameLabel,
      successWidget: const SuccessIcon(),
      initialValue: realname,
      validator: RequiredValidator(
        errorText: lang.profileSetupRealnameRequired,
      ),
      onChanged: (value) {
        final model = Provider.of<ProfileSetupModel>(context, listen: false);
        model.realname = value;
      },
    );
  }
}

class _UsernameFormField extends StatelessWidget {
  const _UsernameFormField({
    Key? key,
    required this.fieldWidth,
  }) : super(key: key);

  final double? fieldWidth;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final username =
        context.select<ProfileSetupModel, String>((model) => model.username);

    return ValidatedFormField(
      fieldWidth: fieldWidth,
      labelText: lang.profileSetupUsernameHint,
      helperText: lang.profileSetupUsernameHelper,
      successWidget: const SuccessIcon(),
      initialValue: username,
      validator: MultiValidator([
        RequiredValidator(errorText: lang.profileSetupUsernameRequired),
        PatternValidator(
          kValidUsernamePattern,
          errorText: lang.profileSetupUsernameInvalid,
        )
      ]),
      onChanged: (value) {
        final model = Provider.of<ProfileSetupModel>(context, listen: false);
        model.username = value;
      },
    );
  }
}

class _PasswordFormField extends StatelessWidget {
  const _PasswordFormField({
    Key? key,
    required this.fieldWidth,
  }) : super(key: key);

  final double? fieldWidth;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final password =
        context.select<ProfileSetupModel, String>((model) => model.password);
    final passwordStrength =
        context.select<ProfileSetupModel, PasswordStrength>(
            (model) => model.passwordStrength);

    return ValidatedFormField(
      fieldWidth: fieldWidth,
      labelText: lang.profileSetupPasswordHint,
      obscureText: true,
      successWidget: PasswordStrengthLabel(strength: passwordStrength),
      initialValue: password,
      validator: RequiredValidator(
        errorText: lang.profileSetupPasswordRequired,
      ),
      onChanged: (value) {
        final model = Provider.of<ProfileSetupModel>(context, listen: false);
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
        context.select<ProfileSetupModel, String>((model) => model.password);
    final confirmedPassword = context
        .select<ProfileSetupModel, String>((model) => model.confirmedPassword);

    return ValidatedFormField(
      fieldWidth: fieldWidth,
      obscureText: true,
      labelText: lang.profileSetupConfirmPasswordHint,
      successWidget: password.isNotEmpty ? const SuccessIcon() : null,
      initialValue: confirmedPassword,
      autovalidateMode: AutovalidateMode.always,
      validator: EqualValidator(
        password,
        errorText: lang.profileSetupPasswordMismatch,
      ),
      onChanged: (value) {
        final model = Provider.of<ProfileSetupModel>(context, listen: false);
        model.confirmedPassword = value;
      },
    );
  }
}

class _ShowAdvancedOptionsCheckButton extends StatelessWidget {
  const _ShowAdvancedOptionsCheckButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final showAdvancedOptions = context
        .select<ProfileSetupModel, bool>((model) => model.showAdvancedOptions);

    return Align(
      alignment: Alignment.topLeft,
      child: IntrinsicWidth(
        child: CheckButton(
          contentPadding: kContentPadding,
          title: Text(lang.profileSetupShowAdvancedOptions),
          value: showAdvancedOptions,
          onChanged: (value) {
            final model =
                Provider.of<ProfileSetupModel>(context, listen: false);
            model.showAdvancedOptions = value!;
          },
        ),
      ),
    );
  }
}
