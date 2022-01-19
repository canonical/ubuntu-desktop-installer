import 'package:flutter_test/flutter_test.dart';

import 'package:ubuntu_wizard/utils.dart';

void main() {
  test('data class', () {
    final int1 = ValidatedValue<int>(1);
    expect(int1.value, equals(1));
    expect(int1.isValid, isNull);
    expect(int1.toString(), equals('ValidatedValue(value: 1, isValid: null)'));

    final int2 = ValidatedValue<int>(2, isValid: true);
    expect(int2.value, equals(2));
    expect(int2.isValid, isTrue);
    expect(int2.toString(), equals('ValidatedValue(value: 2, isValid: true)'));

    final int3 = ValidatedValue<int>(3, isValid: false);
    expect(int3.value, equals(3));
    expect(int3.isValid, isFalse);
    expect(int3.toString(), equals('ValidatedValue(value: 3, isValid: false)'));

    final int11 = ValidatedValue(1);
    expect(int11, equals(int1));
    expect(int11.hashCode, equals(int1.hashCode));
    expect(int11, isNot(equals(int2)));
    expect(int11.hashCode, isNot(equals(int2.hashCode)));
  });
}
