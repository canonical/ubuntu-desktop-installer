import 'dart:ui';
import 'package:collection/collection.dart';

/// Parses the given locale string and returns a corresponding [Locale] object.
///
/// The standard format is `language[_territory][.codeset][@modifier]`, but this
/// parser tries to be as relaxed as possible by allowing the parts to be in an
/// arbitrary order.
///
/// Language and country/territory codes are detected by matching against the
/// following rules:
///
/// - language code is 2-3 lowercase letters (ISO 639)
/// - country code is 2-3 uppercase letters (ISO 3166)
///
/// Codeset and modifier are ignored.
Locale parseLocale(String locale) {
  final codes = locale
      .split(RegExp(r'[_\.@]'))
      .where((code) => code.length == 2 || code.length == 3);

  final language = codes.firstWhereOrNull((code) => code == code.toLowerCase());
  final country = codes.firstWhereOrNull((code) => code == code.toUpperCase());

  return Locale(language ?? 'C', country);
}
