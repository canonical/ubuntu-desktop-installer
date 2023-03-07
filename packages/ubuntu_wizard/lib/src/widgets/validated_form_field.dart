import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

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
  final ValueChanged<String>? onChanged;

  /// Called when the user finishes editing the text in the field.
  final VoidCallback? onEditingComplete;

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
    super.key,
    this.controller,
    this.initialValue,
    this.onChanged,
    this.onEditingComplete,
    FieldValidator<String?>? validator,
    this.autofocus = false,
    this.focusNode,
    this.labelText,
    this.helperText,
    this.obscureText = false,
    this.successWidget,
    double? spacing,
    this.fieldWidth,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.enabled = true,
    this.suffixIcon,
  })  : validator = validator ?? _NoValidator(),
        spacing = spacing ?? (successWidget != null ? _kIconSpacing : null);

  @override
  State<ValidatedFormField> createState() => _ValidatedFormFieldState();
}

class _ValidatedFormFieldState extends State<ValidatedFormField> {
  late final TextEditingController _controller;
  FocusNode? _focusNode;

  FocusNode get focusNode => widget.focusNode ?? _focusNode!;

  @override
  void initState() {
    super.initState();
    _controller =
        widget.controller ?? TextEditingController(text: widget.initialValue);
    if (widget.focusNode == null) {
      _focusNode ??= FocusNode();
    }
    focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (focusNode.hasPrimaryFocus && primaryFocus?.context != null) {
      Actions.maybeInvoke<SelectAllTextIntent>(
        primaryFocus!.context!,
        const SelectAllTextIntent(SelectionChangedCause.keyboard),
      );
    }
  }

  @override
  void dispose() {
    focusNode.removeListener(_onFocusChange);
    _controller.dispose();
    _focusNode?.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(ValidatedFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != null &&
        widget.initialValue != _controller.text &&
        widget.initialValue != oldWidget.initialValue) {
      scheduleMicrotask(() {
        _controller.value = TextEditingValue(
          text: widget.initialValue!,
          selection:
              TextSelection.collapsed(offset: widget.initialValue!.length),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final formField = TextFormField(
      autofocus: widget.autofocus,
      autovalidateMode: widget.autovalidateMode,
      controller: _controller,
      focusNode: focusNode,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
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

class _NoValidator extends FieldValidator<String?> {
  _NoValidator() : super('');

  @override
  bool isValid(String? value) => true;
}

/// Validates that a form field input is valid according to the given callback.
///
/// See also:
///  * [ValidatedFormField]
class CallbackValidator extends FieldValidator<String?> {
  /// The callback used to validate the input.
  CallbackValidator(this._callback, {required String errorText})
      : super(errorText);

  final bool Function(String?) _callback;

  @override
  bool isValid(String? value) => _callback(value);
}

/// Validates that a form field input is equal to the given value.
///
/// See also:
///  * [ValidatedFormField]
class EqualValidator extends FieldValidator<String?> {
  /// Creates an equality validator for the given value and error.
  EqualValidator(this._value, {required String errorText}) : super(errorText);

  final String _value;

  @override
  bool isValid(String? value) => value == _value;
}
