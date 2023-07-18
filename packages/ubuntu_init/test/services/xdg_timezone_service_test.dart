import 'package:dbus/dbus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_init/src/services/xdg_timezone_service.dart';

import 'xdg_timezone_service_test.mocks.dart';

@GenerateMocks([DBusRemoteObject])
void main() {
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
}
