import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_bootstrap/services/timezone_service.dart';

void main() {
  group('subiquity', () {
    test('get timezone', () async {
      final client = MockSubiquityClient();
      when(client.getTimezone()).thenAnswer((_) async =>
          const TimeZoneInfo(timezone: 'Europe/Stockholm', fromGeoip: false));

      final service = SubiquityTimezoneService(client);

      final timezone = await service.getTimezone();
      expect(timezone, equals('Europe/Stockholm'));

      verify(client.getTimezone()).called(1);
    });

    test('set timezone', () async {
      final client = MockSubiquityClient();
      when(client.setTimezone('geoip')).thenAnswer((_) async {});
      when(client.setTimezone('Europe/Oslo')).thenAnswer((_) async {});

      final service = SubiquityTimezoneService(client);

      await service.setTimezone('Europe/Oslo');
      verify(client.setTimezone('Europe/Oslo')).called(1);
    });
  });
}
