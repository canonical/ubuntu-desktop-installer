import 'dart:async';

import 'package:dbus/dbus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/services/ubuntu_pro_client.dart';

import 'ubuntu_pro_client_test.mocks.dart';

@GenerateMocks([DBusClient, DBusPropertiesChangedSignal, DBusRemoteObject])
void main() {
  test('create', () {
    expect(UbuntuProClient(), isA<UbuntuProClient>());
  });

  test('connect', () async {
    final object = MockDBusRemoteObject();
    when(object.propertiesChanged).thenAnswer((_) => Stream.empty());
    when(object.getAllProperties(kUbuntuProInterface))
        .thenAnswer((_) async => {});

    final client = UbuntuProDBusClient(object);
    await client.connect();

    verify(object.propertiesChanged).called(1);
    verify(object.getAllProperties(kUbuntuProInterface)).called(1);
  });

  test('close', () async {
    final dbus = MockDBusClient();
    final object = MockDBusRemoteObject();
    when(object.client).thenReturn(dbus);

    final client = UbuntuProDBusClient(object);
    await client.close();

    verify(dbus.close()).called(1);
  });

  test('properties', () async {
    final object = MockDBusRemoteObject();
    final controller =
        StreamController<DBusPropertiesChangedSignal>(sync: true);
    when(object.propertiesChanged).thenAnswer((_) => controller.stream);
    when(object.getAllProperties(kUbuntuProInterface)).thenAnswer((_) async {
      return {
        'DaemonVersion': DBusString('1.2.3'),
        'Attached': DBusBoolean(true),
      };
    });

    final client = UbuntuProDBusClient(object);
    expect(client.daemonVersion, isEmpty);
    expect(client.isAttached, isFalse);

    await client.connect();

    expect(client.daemonVersion, equals('1.2.3'));
    expect(client.isAttached, isTrue);

    final properties = MockDBusPropertiesChangedSignal();
    when(properties.propertiesInterface).thenReturn(kUbuntuProInterface);
    when(properties.changedProperties).thenReturn({
      'DaemonVersion': DBusString('1.2.4'),
      'Attached': DBusBoolean(false),
    });

    final changedProperties = Completer<List<String>>();
    client.propertiesChanged.listen(changedProperties.complete);

    controller.add(properties);

    await expectLater(changedProperties.future,
        completion(equals(['DaemonVersion', 'Attached'])));

    expect(client.daemonVersion, equals('1.2.4'));
    expect(client.isAttached, isFalse);
  });

  test('attach', () async {
    final object = MockDBusRemoteObject();
    when(object.callMethod(
            kUbuntuProInterface, 'Attach', [DBusString('token1234')]))
        .thenAnswer((_) async => DBusMethodSuccessResponse());

    final client = UbuntuProDBusClient(object);
    await client.attach('token1234');

    verify(object.callMethod(
        kUbuntuProInterface, 'Attach', [DBusString('token1234')])).called(1);
  });

  test('detach', () async {
    final object = MockDBusRemoteObject();
    when(object.callMethod(kUbuntuProInterface, 'Detach', []))
        .thenAnswer((_) async => DBusMethodSuccessResponse());

    final client = UbuntuProDBusClient(object);
    await client.detach();

    verify(object.callMethod(kUbuntuProInterface, 'Detach', [])).called(1);
  });

  test('failure', () async {
    final object = MockDBusRemoteObject();
    when(object.callMethod(
            kUbuntuProInterface, 'Attach', [DBusString('token1234')]))
        .thenAnswer((_) async {
      throw DBusMethodResponseException(DBusMethodErrorResponse(
          UbuntuProAuthFailedException.name,
          [DBusString('Ubuntu Pro auth failed')]));
    });

    final client = UbuntuProDBusClient(object);
    await expectLater(client.attach('token1234'),
        throwsA(isA<UbuntuProAuthFailedException>()));
  });

  test('auth failure', () async {
    final object = MockDBusRemoteObject();
    when(object.callMethod(kUbuntuProInterface, 'Detach', []))
        .thenAnswer((_) async {
      throw DBusMethodResponseException(DBusMethodErrorResponse(
          UbuntuProFailedException.name, [DBusString('Ubuntu Pro failed')]));
    });

    final client = UbuntuProDBusClient(object);
    await expectLater(
        client.detach(), throwsA(isA<UbuntuProFailedException>()));
  });
}
