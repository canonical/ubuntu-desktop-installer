import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/pages/installation_complete/installation_complete_model.dart';

void main() {
  group('TextUtils', () {
    test('should parse text with bold inside it', () {
      final parse = TextUtils.parseText('this is text with **bold** in it.');

      expect(parse, [
        TextPart(text: 'this is text with '),
        TextPart(text: 'bold', isBold: true),
        TextPart(text: ' in it.'),
      ]);
    });

    test('should parse text with bold at front', () {
      final parse = TextUtils.parseText('**bold** is first.');

      expect(parse, [
        TextPart(text: 'bold', isBold: true),
        TextPart(text: ' is first.'),
      ]);
    });

    test('should parse text with bold on the end', () {
      final parse = TextUtils.parseText('Last text is **bold**');

      expect(parse, [
        TextPart(text: 'Last text is '),
        TextPart(text: 'bold', isBold: true),
      ]);
    });
  });
}
