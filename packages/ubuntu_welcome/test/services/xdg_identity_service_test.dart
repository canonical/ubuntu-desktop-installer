import 'package:dbus/dbus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/services/identity_service.dart';
import 'package:ubuntu_welcome/services/xdg_identity_service.dart';

import 'xdg_identity_service_test.mocks.dart';

@GenerateMocks([DBusRemoteObject, DBusClient])
void main() {
  const testIdentity = Identity(
    realname: 'Arthur Dent',
    username: 'adent',
    hostname: 'heart-of-gold',
    autoLogin: true,
  );
  test('get default user identity', () async {
    final dBusClient = createMockDBusClient(identityData: testIdentity);
    final service = XdgIdentityService(dBusClient, 1000);
    expect(await service.getIdentity(), equals(testIdentity));
  });

  test('set identity', () async {
    final dBusClient = createMockDBusClient();
    final service = XdgIdentityService(dBusClient, 0);
    await service.setIdentity(testIdentity);
    expect(await service.getIdentity(), equals(testIdentity));
  });

  test('apply', () async {
    final dBusClient = createMockDBusClient();
    final service = XdgIdentityService(dBusClient, 0);
    await service.setIdentity(testIdentity.copyWith(password: 'password'));

    verify(dBusClient.callMethod(
      destination: 'org.freedesktop.Accounts',
      path: DBusObjectPath('/org/freedesktop/Accounts'),
      interface: 'org.freedesktop.Accounts',
      name: 'CreateUser',
      values: [
        DBusString(testIdentity.username),
        DBusString(testIdentity.realname),
        const DBusInt32(1),
      ],
      replySignature: DBusSignature.objectPath,
      noReplyExpected: false,
      noAutoStart: false,
      allowInteractiveAuthorization: false,
    )).called(1);

    verify(dBusClient.callMethod(
      destination: 'org.freedesktop.Accounts',
      path: DBusObjectPath('/test/object/path'),
      interface: 'org.freedesktop.Accounts.User',
      name: 'SetPassword',
      values: [
        const DBusString('password'),
        const DBusString(''),
      ],
      replySignature: DBusSignature.empty,
      noReplyExpected: false,
      noAutoStart: false,
      allowInteractiveAuthorization: false,
    )).called(1);

    verify(dBusClient.callMethod(
      destination: 'org.freedesktop.Accounts',
      path: DBusObjectPath('/test/object/path'),
      interface: 'org.freedesktop.Accounts.User',
      name: 'SetAutomaticLogin',
      values: [
        const DBusBoolean(true),
      ],
      replySignature: DBusSignature.empty,
      noReplyExpected: false,
      noAutoStart: false,
      allowInteractiveAuthorization: false,
    )).called(1);

    verify(dBusClient.callMethod(
      destination: 'org.freedesktop.hostname1',
      path: DBusObjectPath('/org/freedesktop/hostname1'),
      interface: 'org.freedesktop.hostname1',
      name: 'SetStaticHostname',
      values: [
        DBusString(testIdentity.hostname),
        const DBusBoolean(false),
      ],
      noReplyExpected: false,
      noAutoStart: false,
      allowInteractiveAuthorization: false,
    )).called(1);
  });
}

MockDBusClient createMockDBusClient({
  Identity identityData = const Identity(),
}) {
  final dBusClient = MockDBusClient();

  when(dBusClient.callMethod(
    destination: 'org.freedesktop.Accounts',
    path: DBusObjectPath('/org/freedesktop/Accounts'),
    interface: 'org.freedesktop.Accounts',
    name: anyNamed('name'),
    values: anyNamed('values'),
    replySignature: DBusSignature.objectPath,
    noReplyExpected: false,
    noAutoStart: false,
    allowInteractiveAuthorization: false,
  )).thenAnswer(
    (i) async {
      if (['FindUserById', 'CreateUser']
          .contains(i.namedArguments[const Symbol('name')])) {
        return DBusMethodSuccessResponse([
          DBusObjectPath('/test/object/path'),
        ]);
      } else {
        throw DBusMethodResponseException(
            DBusMethodErrorResponse.unknownMethod());
      }
    },
  );

  when(dBusClient.callMethod(
    destination: 'org.freedesktop.hostname1',
    path: DBusObjectPath('/org/freedesktop/hostname1'),
    interface: 'org.freedesktop.hostname1',
    name: 'SetStaticHostname',
    values: anyNamed('values'),
    replySignature: null,
    noReplyExpected: false,
    noAutoStart: false,
    allowInteractiveAuthorization: false,
  )).thenAnswer((_) async => DBusMethodSuccessResponse());

  when(dBusClient.callMethod(
    destination: anyNamed('destination'),
    path: anyNamed('path'),
    interface: 'org.freedesktop.DBus.Properties',
    name: 'Get',
    values: anyNamed('values'),
    replySignature: DBusSignature.variant,
    noReplyExpected: false,
    noAutoStart: false,
    allowInteractiveAuthorization: false,
  )).thenAnswer(
    (i) async {
      final values =
          (i.namedArguments[const Symbol('values')] as List<DBusValue>);
      final destination =
          (i.namedArguments[const Symbol('destination')] as String);
      DBusValue? response;
      switch (destination) {
        case 'org.freedesktop.Accounts':
          switch (values[1].asString()) {
            case 'UserName':
              response = DBusString(identityData.username);
              break;
            case 'RealName':
              response = DBusString(identityData.realname);
              break;
            case 'AutomaticLogin':
              response = DBusBoolean(identityData.autoLogin);
              break;
          }
        case 'org.freedesktop.hostname1':
          if (values[1].asString() == 'Hostname') {
            response = DBusString(identityData.hostname);
            break;
          }
      }
      if (response != null) {
        return DBusMethodSuccessResponse([DBusVariant(response)]);
      }
      throw DBusMethodResponseException(DBusMethodErrorResponse.invalidArgs());
    },
  );

  when(dBusClient.callMethod(
    destination: 'org.freedesktop.Accounts',
    path: DBusObjectPath('/test/object/path'),
    interface: 'org.freedesktop.Accounts.User',
    name: anyNamed('name'),
    values: anyNamed('values'),
    replySignature: DBusSignature.empty,
    noReplyExpected: false,
    noAutoStart: false,
    allowInteractiveAuthorization: false,
  )).thenAnswer((i) async => DBusMethodSuccessResponse([]));

  return dBusClient;
}
