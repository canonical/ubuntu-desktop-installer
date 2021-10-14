import 'dart:async';

import 'package:dbus/dbus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/services/hostname_service.dart';

import 'hostname_service_test.mocks.dart';

@GenerateMocks([DBusRemoteObject])
void main() {
  late MockDBusRemoteObject mock;
  late StreamController<DBusPropertiesChangedSignal> controller;

  setUp(() {
    mock = MockDBusRemoteObject();
    controller = StreamController<DBusPropertiesChangedSignal>(sync: true);
    when(mock.propertiesChanged).thenAnswer((_) => controller.stream);
  });

  void whenHostname({
    required String hostname,
    required String prettyHostname,
    required String staticHostname,
  }) {
    when(mock.getProperty(kHostnameInterface, 'Hostname'))
        .thenAnswer((_) async => DBusString(hostname));
    when(mock.getProperty(kHostnameInterface, 'PrettyHostname'))
        .thenAnswer((_) async => DBusString(prettyHostname));
    when(mock.getProperty(kHostnameInterface, 'StaticHostname'))
        .thenAnswer((_) async => DBusString(staticHostname));
  }

  void emitHostname({
    required String hostname,
    required String prettyHostname,
    required String staticHostname,
  }) {
    final signal = DBusSignal(
      sender: '',
      path: DBusObjectPath(kHostnamePath),
      interface: kHostnameInterface,
      name: 'PropertiesChanged',
      values: <DBusValue>[
        const DBusString(kHostnameInterface),
        DBusDict.stringVariant({
          'Hostname': DBusString(hostname),
          'PrettyHostname': DBusString(prettyHostname),
          'StaticHostname': DBusString(staticHostname),
        }),
      ],
    );
    controller.add(DBusPropertiesChangedSignal(signal));
  }

  void whenSetHostname({
    required String prettyHostname,
    required String staticHostname,
  }) {
    when(mock.callMethod(
      kHostnameInterface,
      'SetPrettyHostname',
      [DBusString(prettyHostname), const DBusBoolean(false)],
      replySignature: null,
      noReplyExpected: false,
      noAutoStart: false,
      allowInteractiveAuthorization: false,
    )).thenAnswer((realInvocation) async => DBusMethodSuccessResponse([]));
    when(mock.callMethod(
      kHostnameInterface,
      'SetStaticHostname',
      [DBusString(staticHostname), const DBusBoolean(false)],
      replySignature: null,
      noReplyExpected: false,
      noAutoStart: false,
      allowInteractiveAuthorization: false,
    )).thenAnswer((realInvocation) async => DBusMethodSuccessResponse([]));
  }

  void verifySetHostname({
    required String prettyHostname,
    required String staticHostname,
  }) {
    verify(mock.callMethod(
      kHostnameInterface,
      'SetPrettyHostname',
      [DBusString(prettyHostname), const DBusBoolean(false)],
      replySignature: null,
      noReplyExpected: false,
      noAutoStart: false,
      allowInteractiveAuthorization: false,
    )).called(1);
    verify(mock.callMethod(
      kHostnameInterface,
      'SetStaticHostname',
      [DBusString(staticHostname), const DBusBoolean(false)],
      replySignature: null,
      noReplyExpected: false,
      noAutoStart: false,
      allowInteractiveAuthorization: false,
    )).called(1);
  }

  test('initializes properties', () async {
    final service = HostnameService(mock);
    expect(service.hostname, isEmpty);
    expect(service.staticHostname, isEmpty);

    whenHostname(
      hostname: 'host',
      prettyHostname: 'pretty',
      staticHostname: 'static',
    );

    await service.init();

    expect(service.hostname, equals('pretty'));
    expect(service.staticHostname, equals('static'));
  });

  test('hostname is used as a fallback', () async {
    final service = HostnameService(mock);

    whenHostname(
      hostname: 'host',
      prettyHostname: '',
      staticHostname: '',
    );

    await service.init();

    expect(service.hostname, equals('host'));
    expect(service.staticHostname, equals('host'));
  });

  test('listens to hostname changes', () async {
    final service = HostnameService(mock);

    whenHostname(
      hostname: 'host1',
      prettyHostname: 'pretty1',
      staticHostname: 'static1',
    );

    await service.init();

    emitHostname(
      hostname: 'host2',
      prettyHostname: 'pretty2',
      staticHostname: 'static2',
    );

    expect(service.hostname, equals('pretty2'));
    expect(service.staticHostname, equals('static2'));

    expect(service.hostnameChanged, emitsInOrder(['pretty1', 'pretty2']));
    expect(service.staticHostnameChanged, emitsInOrder(['static1', 'static2']));
  });

  test('static hostname is sanitized', () async {
    final service = HostnameService(mock);

    whenSetHostname(
      prettyHostname: '#öst  N@me?',
      staticHostname: 'st-n-me',
    );

    await service.setHostname('#öst  N@me?');

    verifySetHostname(
      prettyHostname: '#öst  N@me?',
      staticHostname: 'st-n-me',
    );
  });
}
