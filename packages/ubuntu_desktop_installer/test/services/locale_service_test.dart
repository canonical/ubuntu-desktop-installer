import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/services/locale_service.dart';
import 'package:xdg_locale/xdg_locale.dart';

@GenerateMocks([XdgLocaleClient])
void main() {
  test('get locale', () async {
    final client = MockSubiquityClient();
    when(client.getLocale()).thenAnswer((_) async => 'en_US.UTF-8');

    final service = SubiquityLocaleService(client);

    final locale = await service.getLocale();
    expect(locale, equals('en_US.UTF-8'));

    verify(client.getLocale()).called(1);
  });

  test('set locale', () async {
    final client = MockSubiquityClient();
    when(client.setLocale('en_US.UTF-8')).thenAnswer((_) async {});

    final service = SubiquityLocaleService(client);

    await service.setLocale('en_US.UTF-8');
    verify(client.setLocale('en_US.UTF-8')).called(1);
  });
}
