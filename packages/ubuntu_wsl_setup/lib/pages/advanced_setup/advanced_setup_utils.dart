part of 'advanced_setup_page.dart';

// Validates that a form field input is valid according to the given callback.
//
// See also:
//  * [ValidatedFormField]
class _CallbackValidator extends FieldValidator<String?> {
  _CallbackValidator(this._callback, {required String errorText})
      : super(errorText);

  final bool Function(String?) _callback;

  @override
  bool isValid(String? value) => _callback(value);
}
