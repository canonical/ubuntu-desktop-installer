import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_utils/src/color.dart';

void main() {
  test('hex string', () {
    expect(const Color(0x01020304).toHex(), equals('#01020304'));
    expect(const Color(0xffabcdef).toHex(), equals('#ffabcdef'));
    expect(const Color.fromARGB(0x11, 0x22, 0x33, 0x44).toHex(),
        equals('#11223344'));
  });
}
