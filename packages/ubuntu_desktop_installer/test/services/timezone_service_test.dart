import 'package:dbus/dbus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/services/timezone_service.dart';

import 'timezone_service_test.mocks.dart';

@GenerateMocks([DBusRemoteObject])
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

  group('xdg', () {
    test('get timezone', () async {
      final object = MockDBusRemoteObject();
      when(object.getProperty(
        'org.freedesktop.timedate1',
        'Timezone',
        signature: DBusSignature.string,
      )).thenAnswer((_) async => const DBusString('Europe/Rome'));

      final service = XdgTimezoneService(object);
      expect(await service.getTimezone(), equals('Europe/Rome'));
    });

    test('set timezone', () async {
      final object = MockDBusRemoteObject();
      when(object.callMethod(
        'org.freedesktop.timedate1',
        'SetTimezone',
        const [DBusString('Europe/Berlin'), DBusBoolean(false)],
        replySignature: DBusSignature.empty,
      )).thenAnswer((_) async => DBusMethodSuccessResponse());

      final service = XdgTimezoneService(object);
      await service.setTimezone('Europe/Berlin');
      verify(object.callMethod(
        'org.freedesktop.timedate1',
        'SetTimezone',
        const [DBusString('Europe/Berlin'), DBusBoolean(false)],
        replySignature: DBusSignature.empty,
      )).called(1);
    });
  });
}
