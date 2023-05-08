part of 'identity_page.dart';

class _RealNameFormField extends ConsumerWidget {
  const _RealNameFormField({required this.fieldWidth});

  final double? fieldWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final realName =
        ref.watch(IdentityPage.modelProvider.select((model) => model.realName));

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
        final model = ref.read(IdentityPage.modelProvider);
        model.realName = value;
        await model.validate();
      },
    );
  }
}

class _HostnameFormField extends ConsumerWidget {
  const _HostnameFormField({this.fieldWidth});

  final double? fieldWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final hostname =
        ref.watch(IdentityPage.modelProvider.select((model) => model.hostname));

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
        final model = ref.read(IdentityPage.modelProvider);
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

class _UsernameFormField extends ConsumerWidget {
  const _UsernameFormField({this.fieldWidth});

  final double? fieldWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final username =
        ref.watch(IdentityPage.modelProvider.select((model) => model.username));
    final validation = ref.watch(
        IdentityPage.modelProvider.select((model) => model.usernameValidation));
    final model = ref.read(IdentityPage.modelProvider);

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
        final model = ref.read(IdentityPage.modelProvider);
        model.username = value;
        await model.validate();
      },
    );
  }
}

class _PasswordFormField extends ConsumerWidget {
  const _PasswordFormField({this.fieldWidth});

  final double? fieldWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final password =
        ref.watch(IdentityPage.modelProvider.select((model) => model.password));
    final passwordStrength = ref.watch(
        IdentityPage.modelProvider.select((model) => model.passwordStrength));
    final showPassword = ref.watch(
        IdentityPage.modelProvider.select((model) => model.showPassword));

    return ValidatedFormField(
      fieldWidth: fieldWidth,
      labelText: lang.whoAreYouPagePasswordLabel,
      obscureText: !showPassword,
      successWidget: PasswordStrengthLabel(strength: passwordStrength),
      initialValue: password,
      suffixIcon: _ShowPasswordButton(
        value: showPassword,
        onChanged: (value) =>
            ref.read(IdentityPage.modelProvider).showPassword = value,
      ),
      validator: RequiredValidator(
        errorText: lang.whoAreYouPagePasswordRequired,
      ),
      onChanged: (value) {
        final model = ref.read(IdentityPage.modelProvider);
        model.password = value;
      },
    );
  }
}

class _ConfirmPasswordFormField extends ConsumerWidget {
  const _ConfirmPasswordFormField({required this.fieldWidth});

  final double? fieldWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final password =
        ref.watch(IdentityPage.modelProvider.select((model) => model.password));
    final confirmedPassword = ref.watch(
        IdentityPage.modelProvider.select((model) => model.confirmedPassword));
    final showPassword = ref.watch(
        IdentityPage.modelProvider.select((model) => model.showPassword));

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
        final model = ref.read(IdentityPage.modelProvider);
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
      child: FilledButton.icon(
        style: FilledButton.styleFrom(
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

class _UseActiveDirectoryCheckButton extends ConsumerWidget {
  const _UseActiveDirectoryCheckButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final hasActiveDirectorySupport = ref.watch(IdentityPage.modelProvider
        .select((model) => model.hasActiveDirectorySupport));
    final useActiveDirectory = ref.watch(
        IdentityPage.modelProvider.select((model) => model.useActiveDirectory));
    final isConnected = ref
        .watch(IdentityPage.modelProvider.select((model) => model.isConnected));

    return Visibility(
      visible: hasActiveDirectorySupport != false,
      child: YaruCheckButton(
        value: useActiveDirectory,
        title: Text(lang.activeDirectoryOption),
        onChanged: isConnected && hasActiveDirectorySupport == true
            ? (v) =>
                ref.read(IdentityPage.modelProvider).useActiveDirectory = v!
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

class _AutoLoginSwitch extends ConsumerWidget {
  const _AutoLoginSwitch();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final autoLogin = ref
        .watch(IdentityPage.modelProvider.select((model) => model.autoLogin));

    return YaruSwitchButton(
      title: Text(lang.whoAreYouPageRequirePassword),
      contentPadding: kContentPadding,
      value: !autoLogin,
      onChanged: (value) {
        final model = ref.read(IdentityPage.modelProvider);
        model.autoLogin = !value;
      },
    );
  }
}
