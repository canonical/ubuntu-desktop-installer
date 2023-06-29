import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_wsl_setup/is_locale_set.dart';

void main() {
  test('default is not set', () async {
    final client = MockSubiquityClient();
    when(client.getLocale()).thenAnswer((_) async => 'C.UTF-8');
    expect(await isLocaleSet(client), isFalse);
  });
  test('any other is set', () async {
    final client = MockSubiquityClient();
    when(client.getLocale()).thenAnswer((_) async => 'en_US.UTF-8');
    expect(await isLocaleSet(client), isTrue);
  });
}
