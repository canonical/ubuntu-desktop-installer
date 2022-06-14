import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_wizard/utils.dart';

// ignore_for_file: type=lint

void main() {
  test('hex string', () {
    expect(Color(0x01020304).toHex(), equals('#01020304'));
    expect(Color(0xffabcdef).toHex(), equals('#ffabcdef'));
    expect(Color.fromARGB(0x11, 0x22, 0x33, 0x44).toHex(), equals('#11223344'));
  });
}
