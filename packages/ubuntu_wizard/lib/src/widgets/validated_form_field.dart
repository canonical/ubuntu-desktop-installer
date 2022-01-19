import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:yaru_icons/yaru_icons.dart';

import '../../utils.dart';
import 'password_strength_label.dart';
import 'success_icon.dart';

/// The regular expression pattern for valid usernames:
/// - must start with a lowercase letter
/// - may contain lowercase letters, digits, hyphens, and underscores
const kValidUsernamePattern = r'^[a-z][a-z0-9-_]*$';

/// The regular expression pattern for valid hostnames:
/// - must start and end with a letter or digit
/// - may contain letters, digits, hyphens, and dots
const kValidHostnamePattern = r'^[a-zA-Z0-9]([a-zA-Z0-9.-]*[a-zA-Z0-9])*$';

// The spacing between the form field and the success icon.
const _kIconSpacing = 10.0;

/// A [TextFormField] rewarding a validated input with a specific widget.
///
/// See also:
///  * [SuccessIcon]
///  * [EqualValidator]
class ValidatedFormField extends StatefulWidget {
  /// The controller used to get the [TextField] values. If [controller] is
  /// null, a controller is created internally and its text is set to
  /// [initialValue].
  final TextEditingController? controller;

  /// An optional value to initialize the form field with when not using a
  /// [controller].
  final String? initialValue;

  /// Called when the user changes the text in the field.
  final ValueChanged<ValidatedString>? onChanged;

  /// The validator used to validate the [TextField] value.
  final FieldValidator<String?> validator;

  /// Whether this input field should focus itself automatically.
  final bool autofocus;

  /// Defines the keyboard focus for the [TextField].
  final FocusNode? focusNode;

  /// The label above the [TextField]
  final String? labelText;

  /// The label below the [TextField]
  final String? helperText;

  /// This boolean is forwarded to the [TextField] to decide
  /// if the digits should be obscured.
  final bool obscureText;

  /// The specific widget shown right to the [TextField] if the
  /// input value is valid.
  final Widget? successWidget;

  /// Sets the optional field width for layout reasons.
  final double? fieldWidth;

  /// Sets the optional space between the [TextField] and the successWidget
  final double? spacing;

  /// See [FormField.autovalidateMode].
  final AutovalidateMode autovalidateMode;

  /// Enables or disables TextField (defaults to true)
  final bool enabled;

  /// An optional Widget placed inside the text input.
  final Widget? suffixIcon;

  /// Creates a [TextFormField] and a check mark.
  ///
  /// The `validator' helps to decide when to show the check mark.
  ValidatedFormField({
    Key? key,
    this.controller,
    this.initialValue,
    this.onChanged,
    FieldValidator<String?>? validator,
    bool? autofocus,
    this.focusNode,
    this.labelText,
    this.helperText,
    bool? obscureText,
    this.successWidget,
    this.spacing = _kIconSpacing,
    this.fieldWidth,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.enabled = true,
    this.suffixIcon,
  })  : validator = validator ?? _NoValidator(),
        autofocus = autofocus ?? false,
        obscureText = obscureText ?? false,
        super(key: key);

  @override
  State<ValidatedFormField> createState() => _ValidatedFormFieldState();
}

class _ValidatedFormFieldState extends State<ValidatedFormField> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller =
        widget.controller ?? TextEditingController(text: widget.initialValue);
    _controller.addListener(() {
      final value = _controller.text;
      final isValid = widget.validator.isValid(value);
      widget.onChanged?.call(ValidatedValue(value, isValid: isValid));
    });
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(ValidatedFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_focusNode.hasFocus &&
        widget.initialValue != null &&
        oldWidget.initialValue != widget.initialValue) {
      scheduleMicrotask(() {
        _controller.text = widget.initialValue!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final formField = TextFormField(
      autofocus: widget.autofocus,
      autovalidateMode: widget.autovalidateMode,
      controller: _controller,
      focusNode: _focusNode,
      validator: widget.validator,
      obscureText: widget.obscureText,
      enabled: widget.enabled,
      decoration: InputDecoration(
        labelText: widget.labelText,
        helperText: widget.helperText,
        suffixIcon: widget.suffixIcon,
      ),
    );

    return Row(
      children: [
        widget.fieldWidth == null
            ? Expanded(child: formField)
            : SizedBox(width: widget.fieldWidth, child: formField),
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: _controller,
          builder: (context, value, child) {
            return Padding(
              padding: EdgeInsets.only(left: widget.spacing ?? 0.0),
              child: widget.successWidget == null ||
                      !widget.validator.isValid(value.text)
                  ? const SizedBox.shrink()
                  : _alignBaseline(widget.successWidget),
            );
          },
        ),
      ],
    );
  }

  Widget? _alignBaseline(Widget? child) {
    if (widget.helperText?.isNotEmpty != true) {
      return child;
    }

    final border = Theme.of(context).inputDecorationTheme.border;
    return Baseline(
      baseline: border?.borderSide.width ?? 0,
      baselineType: TextBaseline.alphabetic,
      child: child,
    );
  }
}

/// Input field for the user's real name. The real name is validated to ensure
/// that it's not empty.
class RealNameFormField extends StatelessWidget {
  const RealNameFormField({
    Key? key,
    required this.realName,
    required this.onChanged,
    this.labelText,
    this.helperText,
    this.requiredText,
    this.fieldWidth,
    this.autofocus,
  }) : super(key: key);

  final String realName;
  final ValueChanged<ValidatedString> onChanged;
  final String? labelText;
  final String? helperText;
  final String? requiredText;
  final double? fieldWidth;
  final bool? autofocus;

  @override
  Widget build(BuildContext context) {
    return ValidatedFormField(
      autofocus: autofocus,
      fieldWidth: fieldWidth,
      labelText: labelText,
      helperText: helperText,
      successWidget: const SuccessIcon(),
      initialValue: realName,
      validator: RequiredValidator(errorText: requiredText ?? ''),
      onChanged: onChanged,
    );
  }
}

/// Username input field that validates that the username is valid.
///
/// See also: [kValidUsernamePattern]
class UsernameFormField extends StatelessWidget {
  const UsernameFormField({
    Key? key,
    required this.username,
    required this.onChanged,
    this.labelText,
    this.helperText,
    this.requiredText,
    this.invalidText,
    this.fieldWidth,
    this.autofocus,
  }) : super(key: key);

  final String username;
  final ValueChanged<ValidatedString> onChanged;
  final String? labelText;
  final String? helperText;
  final String? requiredText;
  final String? invalidText;
  final double? fieldWidth;
  final bool? autofocus;

  @override
  Widget build(BuildContext context) {
    return ValidatedFormField(
      autofocus: autofocus,
      fieldWidth: fieldWidth,
      labelText: labelText,
      helperText: helperText,
      successWidget: const SuccessIcon(),
      initialValue: username,
      validator: MultiValidator([
        RequiredValidator(errorText: requiredText ?? ''),
        PatternValidator(kValidUsernamePattern, errorText: invalidText ?? ''),
      ]),
      onChanged: onChanged,
    );
  }
}

/// Validates a password that it's not empty, and displays its strength.
class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    Key? key,
    required this.password,
    required this.onChanged,
    this.passwordStrength,
    this.labelText,
    this.requiredText,
    this.fieldWidth,
    this.autofocus,
  }) : super(key: key);

  final String password;
  final PasswordStrength? passwordStrength;
  final String? labelText;
  final String? requiredText;
  final ValueChanged<ValidatedString> onChanged;
  final double? fieldWidth;
  final bool? autofocus;

  @override
  State<PasswordFormField> createState() => PasswordFormFieldState();
}

@visibleForTesting
class PasswordFormFieldState extends State<PasswordFormField> {
  var _obscureText = true;

  @visibleForTesting
  bool get obscureText => _obscureText;

  @override
  Widget build(BuildContext context) {
    return ValidatedFormField(
      autofocus: widget.autofocus,
      fieldWidth: widget.fieldWidth,
      obscureText: _obscureText,
      labelText: widget.labelText,
      successWidget: widget.passwordStrength != null
          ? PasswordStrengthLabel(strength: widget.passwordStrength!)
          : null,
      suffixIcon: widget.password.isNotEmpty
          ? IconButton(
              onPressed: () => setState(() => _obscureText = !_obscureText),
              icon: Icon(_obscureText ? YaruIcons.hide : YaruIcons.view),
            )
          : null,
      initialValue: widget.password,
      validator: RequiredValidator(errorText: widget.requiredText ?? ''),
      onChanged: widget.onChanged,
    );
  }
}

/// Validates that a confirmed password matches the original password.
class ConfirmPasswordFormField extends StatefulWidget {
  const ConfirmPasswordFormField({
    Key? key,
    required this.password,
    required this.confirmedPassword,
    required this.onChanged,
    this.obscureText,
    this.labelText,
    this.helperText,
    this.mismatchText,
    this.fieldWidth,
    this.autofocus,
  }) : super(key: key);

  final String password;
  final String confirmedPassword;
  final ValueChanged<ValidatedString> onChanged;
  final bool? obscureText;
  final String? labelText;
  final String? helperText;
  final String? mismatchText;
  final double? fieldWidth;
  final bool? autofocus;

  @override
  State<ConfirmPasswordFormField> createState() =>
      ConfirmPasswordFormFieldState();
}

@visibleForTesting
class ConfirmPasswordFormFieldState extends State<ConfirmPasswordFormField> {
  var _obscureText = true;

  @visibleForTesting
  bool get obscureText => _obscureText;

  @override
  Widget build(BuildContext context) {
    return ValidatedFormField(
      autofocus: widget.autofocus,
      obscureText: _obscureText,
      labelText: widget.labelText,
      helperText: widget.helperText,
      fieldWidth: widget.fieldWidth,
      successWidget: widget.password.isNotEmpty ? const SuccessIcon() : null,
      suffixIcon: widget.confirmedPassword.isNotEmpty
          ? IconButton(
              onPressed: () => setState(() => _obscureText = !_obscureText),
              icon: Icon(_obscureText ? YaruIcons.hide : YaruIcons.view),
            )
          : null,
      initialValue: widget.confirmedPassword,
      autovalidateMode: AutovalidateMode.always,
      validator:
          EqualValidator(widget.password, errorText: widget.mismatchText ?? ''),
      onChanged: widget.onChanged,
    );
  }
}

/// Validates that a hostname is valid.
///
/// See also: [kValidHostnamePattern]
class HostnameFormField extends StatelessWidget {
  const HostnameFormField({
    Key? key,
    required this.hostname,
    required this.onChanged,
    this.labelText,
    this.helperText,
    this.requiredText,
    this.invalidText,
    this.fieldWidth,
    this.autofocus,
  }) : super(key: key);

  final String hostname;
  final ValueChanged<ValidatedString> onChanged;
  final String? labelText;
  final String? helperText;
  final String? requiredText;
  final String? invalidText;
  final double? fieldWidth;
  final bool? autofocus;

  @override
  Widget build(BuildContext context) {
    return ValidatedFormField(
      autofocus: autofocus,
      fieldWidth: fieldWidth,
      labelText: labelText,
      helperText: helperText,
      successWidget: const SuccessIcon(),
      initialValue: hostname,
      validator: MultiValidator([
        RequiredValidator(errorText: requiredText ?? ''),
        PatternValidator(kValidHostnamePattern, errorText: invalidText ?? ''),
      ]),
      onChanged: onChanged,
    );
  }
}

class _NoValidator extends FieldValidator<String?> {
  _NoValidator() : super('');

  @override
  bool isValid(String? value) => true;
}
