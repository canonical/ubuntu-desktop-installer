import 'package:meta/meta.dart';

/// A value coupled with its validation status.
///
/// See also:
///  * [ValidatedFormField]
@immutable
class ValidatedValue<T> {
  /// Constructs a value coupled with its validation status.
  ValidatedValue(this.value, {this.isValid});

  /// The value itself.
  final T value;

  /// Whether the value is valid, or null if not specified.
  final bool? isValid;

  @override
  String toString() => 'ValidatedValue(value: $value, isValid: $isValid)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ValidatedValue<T> &&
        other.value == value &&
        other.isValid == isValid;
  }

  @override
  int get hashCode => Object.hash(value, isValid);
}

/// A convenience typedef for string-based form validation.
///
/// See also:
///  * [ValidatedFormField]
typedef ValidatedString = ValidatedValue<String>;
