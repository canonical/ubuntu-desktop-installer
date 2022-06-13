import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages/who_are_you/who_are_you_model.dart';
import 'package:ubuntu_test/mocks.dart';
import 'package:ubuntu_wizard/utils.dart';

// ignore_for_file: type=lint

class MockProductNameFile extends Mock implements File {
  MockProductNameFile(this._product);
  final String _product;
  @override
  Future<String> readAsString({Encoding encoding = utf8}) async => _product;
}

void main() {
  test('load identity', () async {
    const identity = IdentityData(
      realname: 'Ubuntu',
      username: 'ubuntu',
      cryptedPassword: 'anything',
      hostname: 'impish',
    );

    final client = MockSubiquityClient();
    when(client.identity()).thenAnswer((_) async => identity);

    final model = WhoAreYouModel(client);

    await IOOverrides.runZoned(() async {
      await model.loadIdentity();
    }, createFile: (path) => MockProductNameFile('impish'));
    verify(client.identity()).called(1);

    expect(model.realName, equals(identity.realname));
    expect(model.username, equals(identity.username));
    expect(model.password, isEmpty); // not loaded
    expect(model.hostname, equals(identity.hostname));
    expect(model.showPassword, false);
  });

  test('empty username and hostname', () async {
    const identity = IdentityData(realname: 'Ubuntu');

    final client = MockSubiquityClient();
    when(client.identity()).thenAnswer((_) async => identity);

    final model = WhoAreYouModel(client);
    await IOOverrides.runZoned(() async {
      await model.loadIdentity();
    }, createFile: (path) => MockProductNameFile('impish'));
    verify(client.identity()).called(1);

    expect(model.hostname, equals('ubuntu-impish'));
  });

  test('non-empty username and empty hostname', () async {
    const identity = IdentityData(username: 'user');

    final client = MockSubiquityClient();
    when(client.identity()).thenAnswer((_) async => identity);

    final model = WhoAreYouModel(client);
    await IOOverrides.runZoned(() async {
      await model.loadIdentity();
    }, createFile: (path) => MockProductNameFile('impish'));

    expect(model.hostname, equals('user-impish'));
  });

  test('save identity', () async {
    final identity = IdentityData(
      realname: 'Ubuntu',
      username: 'ubuntu',
      cryptedPassword: encryptPassword('passwd', salt: 'test'),
      hostname: 'impish',
    );

    final client = MockSubiquityClient();

    final model = WhoAreYouModel(client);
    model.realName = identity.realname;
    model.username = identity.username;
    model.hostname = identity.hostname;
    model.password = 'passwd';

    await model.saveIdentity(salt: 'test');

    verify(client.setIdentity(identity)).called(1);
  });

  test('password strength', () {
    // see password_test.dart for more detailed password strength tests
    final model = WhoAreYouModel(MockSubiquityClient());

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
    final model = WhoAreYouModel(MockSubiquityClient());

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
    expect(model.loginStrategy, LoginStrategy.requirePassword);
    model.loginStrategy = LoginStrategy.autoLogin;
    expect(wasNotified, isTrue);
  });

  test('validation', () {
    final model = WhoAreYouModel(MockSubiquityClient());
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

    // any field missing
    testValid('', 'host', 'user', 'passwd', 'passwd', isFalse);
    testValid('real', '', 'user', 'passwd', 'passwd', isFalse);
    testValid('real', 'host', '', 'passwd', 'passwd', isFalse);
    testValid('real', 'host', 'user', '', 'passwd', isFalse);

    // username validation
    testValid('real', 'host', '123', 'passwd', 'passwd', isFalse);
    testValid('real', 'host', 'UBUNTU', 'passwd', 'passwd', isFalse);
    testValid('real', 'host', 'inv@lid', 'passwd', 'passwd', isFalse);

    // host name validation
    testValid('real', 'ubuntu-21.10', 'user', 'passwd', 'passwd', isTrue);
    testValid('real', '.ubuntu', 'user', 'passwd', 'passwd', isFalse);
    testValid('real', 'ubuntu-', 'user', 'passwd', 'passwd', isFalse);
    testValid('real', 'inv@lid', 'user', 'passwd', 'passwd', isFalse);

    // password matching
    testValid('real', 'host', 'user', 'passwd', 'passwd', isTrue);
    testValid('real', 'host', 'user', 'passwd', 'mismatch', isFalse);
  });

  test('server validation', () async {
    const kRoot = 'root';
    const kPlugdev = 'plugdev';
    const kTooLong = 'too_long';

    final client = MockSubiquityClient();
    when(client.validateUsername(kRoot))
        .thenAnswer((_) async => UsernameValidation.ALREADY_IN_USE);
    when(client.validateUsername(kPlugdev))
        .thenAnswer((_) async => UsernameValidation.SYSTEM_RESERVED);
    when(client.validateUsername(kTooLong))
        .thenAnswer((_) async => UsernameValidation.TOO_LONG);

    final model = WhoAreYouModel(client);
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
    final client = MockSubiquityClient();
    when(client.identity()).thenAnswer((_) async {
      return IdentityData(
        realname: 'Default',
        username: 'default',
        hostname: 'default',
      );
    });

    final model = WhoAreYouModel(client);
    model.realName = 'User';
    model.username = 'user';
    model.hostname = 'ubuntu';

    await IOOverrides.runZoned(() async {
      await model.loadIdentity();
    }, createFile: (path) => MockProductNameFile(''));
    verify(client.identity()).called(1);

    expect(model.realName, equals('User'));
    expect(model.username, equals('user'));
    expect(model.hostname, equals('ubuntu'));
  });
}
