import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'identity_model.dart';

class RealNameFormField extends ConsumerWidget {
  const RealNameFormField({super.key, required this.fieldWidth});

  final double? fieldWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final realName =
        ref.watch(identityModelProvider.select((model) => model.realName));

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
        final model = ref.read(identityModelProvider);
        model.realName = value;
        await model.validate();
      },
    );
  }
}

class HostnameFormField extends ConsumerWidget {
  const HostnameFormField({super.key, this.fieldWidth});

  final double? fieldWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final hostname =
        ref.watch(identityModelProvider.select((model) => model.hostname));

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
        final model = ref.read(identityModelProvider);
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

class UsernameFormField extends ConsumerWidget {
  const UsernameFormField({super.key, this.fieldWidth});

  final double? fieldWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final username =
        ref.watch(identityModelProvider.select((model) => model.username));
    final validation = ref.watch(
        identityModelProvider.select((model) => model.usernameValidation));
    final model = ref.read(identityModelProvider);

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
        final model = ref.read(identityModelProvider);
        model.username = value;
        await model.validate();
      },
    );
  }
}

class PasswordFormField extends ConsumerWidget {
  const PasswordFormField({super.key, this.fieldWidth});

  final double? fieldWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final password =
        ref.watch(identityModelProvider.select((model) => model.password));
    final passwordStrength = ref
        .watch(identityModelProvider.select((model) => model.passwordStrength));
    final showPassword =
        ref.watch(identityModelProvider.select((model) => model.showPassword));

    return ValidatedFormField(
      fieldWidth: fieldWidth,
      labelText: lang.whoAreYouPagePasswordLabel,
      obscureText: !showPassword,
      successWidget: PasswordStrengthLabel(strength: passwordStrength),
      initialValue: password,
      suffixIcon: ShowPasswordButton(
        value: showPassword,
        onChanged: (value) =>
            ref.read(identityModelProvider).showPassword = value,
      ),
      validator: RequiredValidator(
        errorText: lang.whoAreYouPagePasswordRequired,
      ),
      onChanged: (value) {
        final model = ref.read(identityModelProvider);
        model.password = value;
      },
    );
  }
}

class ConfirmPasswordFormField extends ConsumerWidget {
  const ConfirmPasswordFormField({super.key, required this.fieldWidth});

  final double? fieldWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final password =
        ref.watch(identityModelProvider.select((model) => model.password));
    final confirmedPassword = ref.watch(
        identityModelProvider.select((model) => model.confirmedPassword));
    final showPassword =
        ref.watch(identityModelProvider.select((model) => model.showPassword));

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
        final model = ref.read(identityModelProvider);
        model.confirmedPassword = value;
      },
    );
  }
}

class ShowPasswordButton extends StatelessWidget {
  const ShowPasswordButton({
    super.key,
    required this.value,
    required this.onChanged,
  });

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

class UseActiveDirectoryCheckButton extends ConsumerWidget {
  const UseActiveDirectoryCheckButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final hasActiveDirectorySupport = ref.watch(identityModelProvider
        .select((model) => model.hasActiveDirectorySupport));
    final useActiveDirectory = ref.watch(
        identityModelProvider.select((model) => model.useActiveDirectory));
    final isConnected =
        ref.watch(identityModelProvider.select((model) => model.isConnected));

    return Visibility(
      visible: hasActiveDirectorySupport != false,
      child: YaruCheckButton(
        value: useActiveDirectory,
        title: Text(lang.activeDirectoryOption),
        onChanged: isConnected && hasActiveDirectorySupport == true
            ? (v) => ref.read(identityModelProvider).useActiveDirectory = v!
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

class AutoLoginSwitch extends ConsumerWidget {
  const AutoLoginSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context);
    final autoLogin =
        ref.watch(identityModelProvider.select((model) => model.autoLogin));

    return YaruSwitchButton(
      title: Text(lang.whoAreYouPageRequirePassword),
      contentPadding: kContentPadding,
      value: !autoLogin,
      onChanged: (value) {
        final model = ref.read(identityModelProvider);
        model.autoLogin = !value;
      },
    );
  }
}
