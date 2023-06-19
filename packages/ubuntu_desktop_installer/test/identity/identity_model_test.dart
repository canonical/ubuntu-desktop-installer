import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/identity/identity_model.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_wizard/utils.dart';

import 'test_identity.dart';

class MockProductNameFile extends Mock implements File {
  MockProductNameFile(this._product);
  final String _product;
  @override
  Future<String> readAsString({Encoding encoding = utf8}) async => _product;
}

void main() {
  test('init', () async {
    const identity = Identity(
      realname: 'Ubuntu',
      username: 'ubuntu',
      cryptedPassword: 'anything',
      hostname: 'impish',
    );

    final service = MockIdentityService();
    when(service.getIdentity()).thenAnswer((_) async => identity);

    final activeDirectory = MockActiveDirectoryService();
    when(activeDirectory.isUsed()).thenAnswer((_) async => false);
    when(activeDirectory.hasSupport()).thenAnswer((_) async => false);

    final network = MockNetworkService();
    when(network.propertiesChanged).thenAnswer((_) => const Stream.empty());

    final telemetry = MockTelemetryService();

    final model = IdentityModel(
      service: service,
      activeDirectory: activeDirectory,
      network: network,
      telemetry: telemetry,
    );

    await IOOverrides.runZoned(() async {
      await model.init();
    }, createFile: (path) => MockProductNameFile('impish'));
    verify(service.getIdentity()).called(1);

    expect(model.realName, equals(identity.realname));
    expect(model.username, equals(identity.username));
    expect(model.password, isEmpty); // not loaded
    expect(model.hostname, equals(identity.hostname));
    expect(model.showPassword, false);
    expect(model.autoLogin, false);
    expect(model.hasActiveDirectorySupport, false);
  });

  test('load auto-login', () async {
    final service = MockIdentityService();
    when(service.getIdentity())
        .thenAnswer((_) async => const Identity(autoLogin: true));

    final activeDirectory = MockActiveDirectoryService();
    when(activeDirectory.isUsed()).thenAnswer((_) async => false);
    when(activeDirectory.hasSupport()).thenAnswer((_) async => false);

    final network = MockNetworkService();
    when(network.propertiesChanged).thenAnswer((_) => const Stream.empty());

    final telemetry = MockTelemetryService();

    final model = IdentityModel(
      service: service,
      activeDirectory: activeDirectory,
      network: network,
      telemetry: telemetry,
    );

    await IOOverrides.runZoned(() async {
      await model.init();
    }, createFile: (path) => MockProductNameFile('impish'));

    expect(model.autoLogin, true);
  });

  test('empty username and hostname', () async {
    const identity = Identity(realname: 'Ubuntu');

    final service = MockIdentityService();
    when(service.getIdentity()).thenAnswer((_) async => identity);

    final activeDirectory = MockActiveDirectoryService();
    when(activeDirectory.isUsed()).thenAnswer((_) async => false);
    when(activeDirectory.hasSupport()).thenAnswer((_) async => false);

    final network = MockNetworkService();
    when(network.propertiesChanged).thenAnswer((_) => const Stream.empty());

    final telemetry = MockTelemetryService();

    final model = IdentityModel(
      service: service,
      activeDirectory: activeDirectory,
      network: network,
      telemetry: telemetry,
    );
    await IOOverrides.runZoned(() async {
      await model.init();
    }, createFile: (path) => MockProductNameFile('impish'));
    verify(service.getIdentity()).called(1);

    expect(model.hostname, equals('ubuntu-impish'));
  });

  test('non-empty username and empty hostname', () async {
    const identity = Identity(username: 'user');

    final service = MockIdentityService();
    when(service.getIdentity()).thenAnswer((_) async => identity);

    final activeDirectory = MockActiveDirectoryService();
    when(activeDirectory.isUsed()).thenAnswer((_) async => false);
    when(activeDirectory.hasSupport()).thenAnswer((_) async => false);

    final network = MockNetworkService();
    when(network.propertiesChanged).thenAnswer((_) => const Stream.empty());

    final telemetry = MockTelemetryService();

    final model = IdentityModel(
      service: service,
      activeDirectory: activeDirectory,
      network: network,
      telemetry: telemetry,
    );
    await IOOverrides.runZoned(() async {
      await model.init();
    }, createFile: (path) => MockProductNameFile('impish'));

    expect(model.hostname, equals('user-impish'));
  });

  test('save', () async {
    final identity = Identity(
      realname: 'Ubuntu',
      username: 'ubuntu',
      cryptedPassword: encryptPassword('passwd', salt: 'test'),
      hostname: 'impish',
    );

    final service = MockIdentityService();

    final activeDirectory = MockActiveDirectoryService();

    final network = MockNetworkService();
    when(network.propertiesChanged).thenAnswer((_) => const Stream.empty());

    final telemetry = MockTelemetryService();

    final model = IdentityModel(
      service: service,
      activeDirectory: activeDirectory,
      network: network,
      telemetry: telemetry,
    );
    model.realName = identity.realname;
    model.username = identity.username;
    model.hostname = identity.hostname;
    model.password = 'passwd';

    model.autoLogin = false;
    model.useActiveDirectory = false;

    await model.save(salt: 'test');

    verify(service.setIdentity(identity)).called(1);
    verify(activeDirectory.setUsed(false)).called(1);
    verify(telemetry.addMetric('UseActiveDirectory', false)).called(1);
  });

  test('save auto-login', () async {
    final service = MockIdentityService();

    final activeDirectory = MockActiveDirectoryService();

    final network = MockNetworkService();
    when(network.propertiesChanged).thenAnswer((_) => const Stream.empty());

    final telemetry = MockTelemetryService();

    final model = IdentityModel(
      service: service,
      activeDirectory: activeDirectory,
      network: network,
      telemetry: telemetry,
    );
    model.username = 'someone';
    model.password = 'not-empty';

    model.autoLogin = true;
    await model.save(salt: 'test');
    verify(service.setIdentity(Identity(
      username: 'someone',
      cryptedPassword: encryptPassword('not-empty', salt: 'test'),
      autoLogin: true,
    ))).called(1);

    model.autoLogin = false;
    await model.save(salt: 'test');
    verify(service.setIdentity(Identity(
      username: 'someone',
      cryptedPassword: encryptPassword('not-empty', salt: 'test'),
      autoLogin: false,
    ))).called(1);
  });

  test('password strength', () {
    // see password_test.dart for more detailed password strength tests
    final service = MockIdentityService();
    final activeDirectory = MockActiveDirectoryService();
    final network = MockNetworkService();
    when(network.propertiesChanged).thenAnswer((_) => const Stream.empty());

    final telemetry = MockTelemetryService();
    final model = IdentityModel(
      service: service,
      activeDirectory: activeDirectory,
      network: network,
      telemetry: telemetry,
    );

    void testPasswordStrength(String password, Matcher matcher) {
      model.password = password;
      expect(model.passwordStrength, matcher);
    }

    testPasswordStrength('password', equals(PasswordStrength.weak));
    testPasswordStrength('P4ssword', equals(PasswordStrength.fair));
    testPasswordStrength('P@555w0rD', equals(PasswordStrength.good));
    testPasswordStrength('321Dr0w55@P', equals(PasswordStrength.strong));
  });

  test('notify changes', () {
    final service = MockIdentityService();
    final activeDirectory = MockActiveDirectoryService();
    final network = MockNetworkService();
    when(network.propertiesChanged).thenAnswer((_) => const Stream.empty());

    final telemetry = MockTelemetryService();
    final model = IdentityModel(
      service: service,
      activeDirectory: activeDirectory,
      network: network,
      telemetry: telemetry,
    );

    var wasNotified = false;
    model.addListener(() => wasNotified = true);

    wasNotified = false;
    expect(model.realName, isEmpty);
    model.realName = 'Ubuntu Impish';
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.hostname, isEmpty);
    model.hostname = 'impish';
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.username, 'ubuntu-impish');
    model.username = 'ubuntu';
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.password, isEmpty);
    model.password = 'password';
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.confirmedPassword, isEmpty);
    model.confirmedPassword = 'password';
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.autoLogin, false);
    model.autoLogin = true;
    expect(wasNotified, isTrue);
  });

  test('validation', () {
    final service = MockIdentityService();
    final activeDirectory = MockActiveDirectoryService();
    final network = MockNetworkService();
    when(network.propertiesChanged).thenAnswer((_) => const Stream.empty());

    final telemetry = MockTelemetryService();
    final model = IdentityModel(
      service: service,
      activeDirectory: activeDirectory,
      network: network,
      telemetry: telemetry,
    );

    expect(model.isValid, isFalse);

    void testValid(
      String realName,
      String hostname,
      String username,
      String password,
      String confirmedPassword,
      Matcher matcher,
    ) {
      model.realName = realName;
      model.hostname = hostname;
      model.username = username;
      model.password = password;
      model.confirmedPassword = confirmedPassword;
      expect(model.isValid, matcher);
    }

    // required field missing
    testValid('real', '', 'user', 'passwd', 'passwd', isFalse);
    testValid('real', 'host', '', 'passwd', 'passwd', isFalse);
    testValid('real', 'host', 'user', '', 'passwd', isFalse);

    // username validation
    testValid('real', 'host', '123', 'passwd', 'passwd', isFalse);
    testValid('real', 'host', 'UBUNTU', 'passwd', 'passwd', isFalse);
    testValid('real', 'host', 'inv@lid', 'passwd', 'passwd', isFalse);
    testValid('real', 'host', 'thisusernameislongerthanitshouldbe', 'passwd',
        'passwd', isFalse);

    // host name validation
    testValid('real', 'ubuntu-21.10', 'user', 'passwd', 'passwd', isTrue);
    testValid('real', '.ubuntu', 'user', 'passwd', 'passwd', isFalse);
    testValid('real', 'ubuntu-', 'user', 'passwd', 'passwd', isFalse);
    testValid('real', 'inv@lid', 'user', 'passwd', 'passwd', isFalse);
    testValid(
        'real',
        'thishostnameiswaytoolongandyoureallyshoulduseashorteroneimeanitduh',
        'user',
        'passwd',
        'passwd',
        isFalse);

    // password matching
    testValid('real', 'host', 'user', 'passwd', 'passwd', isTrue);
    testValid('real', 'host', 'user', 'passwd', 'mismatch', isFalse);

    // real name validation
    testValid('', 'host', 'user', 'passwd', 'passwd', isTrue);
    testValid(
        'these are slightly more than the allowed one hundred and sixty characters for the extraordinarily lengthy name of the user who is currently running the installer',
        'host',
        'user',
        'passwd',
        'passwd',
        isFalse);
  });

  test('server validation', () async {
    const kRoot = 'root';
    const kPlugdev = 'plugdev';
    const kTooLong = 'too_long';

    final service = MockIdentityService();
    when(service.validateUsername(kRoot))
        .thenAnswer((_) async => UsernameValidation.ALREADY_IN_USE);
    when(service.validateUsername(kPlugdev))
        .thenAnswer((_) async => UsernameValidation.SYSTEM_RESERVED);
    when(service.validateUsername(kTooLong))
        .thenAnswer((_) async => UsernameValidation.TOO_LONG);

    final network = MockNetworkService();
    when(network.propertiesChanged).thenAnswer((_) => const Stream.empty());

    final telemetry = MockTelemetryService();

    final model = IdentityModel(
      service: service,
      activeDirectory: MockActiveDirectoryService(),
      network: network,
      telemetry: telemetry,
    );
    expect(model.isValid, isFalse);

    void testValid(
      String realname,
      String username,
      String password,
      String confirmedPassword,
      Matcher matcher,
    ) async {
      model.realName = realname;
      model.username = username;
      model.password = password;
      model.confirmedPassword = confirmedPassword;
      await model.validate();
      expect(model.isValid, matcher);
    }

    testValid('User', kRoot, 'password', 'password', isFalse);
    testValid('User', kPlugdev, 'password', 'password', isFalse);
    testValid('User', kTooLong, 'password', 'password', isFalse);
  });

  test('respect existing values', () async {
    final service = MockIdentityService();
    when(service.getIdentity()).thenAnswer((_) async {
      return const Identity(
        realname: 'Default',
        username: 'default',
        hostname: 'default',
      );
    });

    final activeDirectory = MockActiveDirectoryService();
    when(activeDirectory.isUsed()).thenAnswer((_) async => false);
    when(activeDirectory.hasSupport()).thenAnswer((_) async => false);

    final network = MockNetworkService();
    when(network.propertiesChanged).thenAnswer((_) => const Stream.empty());

    final telemetry = MockTelemetryService();

    final model = IdentityModel(
      service: service,
      activeDirectory: activeDirectory,
      network: network,
      telemetry: telemetry,
    );
    model.realName = 'User';
    model.username = 'user';
    model.hostname = 'ubuntu';

    await IOOverrides.runZoned(() async {
      await model.init();
    }, createFile: (path) => MockProductNameFile(''));
    verify(service.getIdentity()).called(1);

    expect(model.realName, equals('User'));
    expect(model.username, equals('user'));
    expect(model.hostname, equals('ubuntu'));
  });

  test('site connectivity', () async {
    final networkChanged = StreamController<List<String>>(sync: true);

    final service = MockIdentityService();
    final activeDirectory = MockActiveDirectoryService();
    final network = MockNetworkService();
    final telemetry = MockTelemetryService();
    when(network.isConnected).thenReturn(false);
    when(network.isConnectedSite).thenReturn(false);
    when(network.propertiesChanged).thenAnswer((_) => networkChanged.stream);

    final model = IdentityModel(
      service: service,
      activeDirectory: activeDirectory,
      network: network,
      telemetry: telemetry,
    );
    expect(model.isConnected, isFalse);

    var wasNotified = false;
    model.addListener(() => wasNotified = true);

    when(network.isConnectedSite).thenReturn(true);
    networkChanged.add(['State']);

    expect(wasNotified, isTrue);
    expect(model.isConnected, isTrue);
  });

  test('active directory support', () async {
    final service = MockIdentityService();
    when(service.getIdentity()).thenAnswer((_) async => const Identity());

    final activeDirectory = MockActiveDirectoryService();
    when(activeDirectory.isUsed()).thenAnswer((_) async => true);
    when(activeDirectory.hasSupport()).thenAnswer((_) async => true);

    final network = MockNetworkService();
    when(network.propertiesChanged).thenAnswer((_) => const Stream.empty());

    final telemetry = MockTelemetryService();

    final model = IdentityModel(
      service: service,
      activeDirectory: activeDirectory,
      network: network,
      telemetry: telemetry,
    );
    expect(model.useActiveDirectory, isFalse);
    expect(model.hasActiveDirectorySupport, isNull);

    await model.init();
    expect(model.useActiveDirectory, isTrue);
    expect(model.hasActiveDirectorySupport, isTrue);

    when(activeDirectory.isUsed()).thenAnswer((_) async => false);
    when(activeDirectory.hasSupport()).thenAnswer((_) async => false);

    await model.init();
    expect(model.useActiveDirectory, isFalse);
    expect(model.hasActiveDirectorySupport, isFalse);
  });
}
