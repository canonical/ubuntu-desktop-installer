import 'package:flutter_test/flutter_test.dart';

import 'package:subiquity_client/subiquity_client.dart';

void main() {
  test('checks for expected languages', () {
    final client = SubiquityClient();
    expect(client.languagelist.contains('English'), true);
    expect(client.languagelist.contains('English (UK)'), true);
    expect(client.languagelist.contains('中文(简体)'), true);
    expect(client.languagelist.contains('Русский'), true);
  });
}
