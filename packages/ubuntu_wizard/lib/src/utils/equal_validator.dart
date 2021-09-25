import 'package:form_field_validator/form_field_validator.dart';

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
