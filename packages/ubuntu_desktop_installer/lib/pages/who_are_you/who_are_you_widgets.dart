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
      validator: MultiValidator([
        RequiredValidator(
          errorText: lang.whoAreYouPageRealNameRequired,
        ),
        MaxLengthValidator(
          kMaxRealNameLength,
          errorText: lang.whoAreYouPageRealNameTooLong,
        ),
      ]),
      onChanged: (value) async {
        final model = Provider.of<WhoAreYouModel>(context, listen: false);
        model.realName = value;
        await model.validate();
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
        ),
        MaxLengthValidator(
          kMaxHostnameLength,
          errorText: lang.whoAreYouPageComputerNameTooLong,
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
      suffixIcon: _ShowPasswordButton(
        value: showPassword,
        onChanged: (value) =>
            context.read<WhoAreYouModel>().showPassword = value,
      ),
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

class _ShowPasswordButton extends StatelessWidget {
  const _ShowPasswordButton({required this.value, required this.onChanged});

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final inputTheme = Theme.of(context).inputDecorationTheme;
    final borderSide = inputTheme.border?.borderSide ?? BorderSide.none;
    final rtl = Directionality.of(context) == TextDirection.rtl;

    return Container(
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        border: Border(
          left: rtl ? BorderSide.none : borderSide,
          right: rtl ? borderSide : BorderSide.none,
        ),
      ),
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
              left:
                  rtl ? const Radius.circular(kYaruButtonRadius) : Radius.zero,
              right:
                  rtl ? Radius.zero : const Radius.circular(kYaruButtonRadius),
            ),
          ),
          // avoid increasing the size of the input fied
          minimumSize: Size.zero,
        ),
        onPressed: () => onChanged(!value),
        icon: Icon(value ? YaruIcons.hide : YaruIcons.eye),
        // build both labels to avoid size changes
        label: IndexedStack(
          index: value ? 1 : 0,
          children: [
            Text(lang.whoAreYouPagePasswordShow),
            Text(lang.whoAreYouPagePasswordHide),
          ],
        ),
      ),
    );
  }
}

class _UseActiveDirectoryCheckButton extends StatelessWidget {
  const _UseActiveDirectoryCheckButton();

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final hasActiveDirectorySupport =
        context.select((WhoAreYouModel m) => m.hasActiveDirectorySupport);
    final useActiveDirectory =
        context.select((WhoAreYouModel m) => m.useActiveDirectory);
    final isConnected = context.select((WhoAreYouModel m) => m.isConnected);

    return Visibility(
      visible: hasActiveDirectorySupport != false,
      child: YaruCheckButton(
        value: useActiveDirectory,
        title: Text(lang.activeDirectoryOption),
        onChanged: isConnected && hasActiveDirectorySupport == true
            ? (v) => context.read<WhoAreYouModel>().useActiveDirectory = v!
            : null,
        subtitle: Text(
          lang.activeDirectoryInfo,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Theme.of(context).hintColor),
        ),
      ),
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
