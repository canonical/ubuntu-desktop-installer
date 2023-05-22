import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:ubuntu_wsl_setup/l10n.dart';

import 'profile_setup_model.dart';

class RealNameFormField extends StatelessWidget {
  const RealNameFormField({super.key, required this.fieldWidth});

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

extension UsernameValidationL10n on UsernameValidation {
  String localize(AppLocalizations lang) {
    switch (this) {
      case UsernameValidation.OK:
        return '';
      case UsernameValidation.ALREADY_IN_USE:
        return lang.profileSetupUsernameInUse;
      case UsernameValidation.SYSTEM_RESERVED:
        return lang.profileSetupUsernameSystemReserved;
      case UsernameValidation.INVALID_CHARS:
        return lang.profileSetupUsernameInvalidChars;
      case UsernameValidation.TOO_LONG:
        return lang.profileSetupUsernameTooLong;
      default:
        throw UnimplementedError(toString());
    }
  }
}

class UsernameFormField extends StatelessWidget {
  const UsernameFormField({super.key, required this.fieldWidth});

  final double? fieldWidth;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final model = context.read<ProfileSetupModel>();
    final username =
        context.select<ProfileSetupModel, String>((model) => model.username);
    final validation = context.select<ProfileSetupModel, UsernameValidation>(
        (model) => model.usernameValidation);

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
        ),
        CallbackValidator((_) => model.usernameOk,
            errorText: validation.localize(lang)),
      ]),
      onChanged: (value) async {
        final model = Provider.of<ProfileSetupModel>(context, listen: false);
        model.username = value;
        await model.validate();
      },
    );
  }
}

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({super.key, required this.fieldWidth});

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

class ConfirmPasswordFormField extends StatelessWidget {
  const ConfirmPasswordFormField({super.key, required this.fieldWidth});

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

// NOTE: The "Show advanced options" checkbox was temporarily removed (#431).
//       See [ProfileSetupModel.showAdvancedOptions] for more details.
//
// class ShowAdvancedOptionsCheckButton extends StatelessWidget {
//   const ShowAdvancedOptionsCheckButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final lang = AppLocalizations.of(context);
//     final showAdvancedOptions = context
//         .select<ProfileSetupModel, bool>((model) => model.showAdvancedOptions);

//     return Align(
//       alignment: Alignment.topLeft,
//       child: IntrinsicWidth(
//         child: YaruCheckButton(
//           contentPadding: kContentPadding,
//           title: Text(lang.profileSetupShowAdvancedOptions),
//           value: showAdvancedOptions,
//           onChanged: (value) {
//             final model =
//                 Provider.of<ProfileSetupModel>(context, listen: false);
//             model.showAdvancedOptions = value!;
//           },
//         ),
//       ),
//     );
//   }
// }
