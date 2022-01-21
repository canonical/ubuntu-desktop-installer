import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages/who_are_you/who_are_you_model.dart';
import 'package:ubuntu_test/mocks.dart';
import 'package:ubuntu_wizard/utils.dart';

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
  });

  test('does not override identity', () async {
    const identity = IdentityData(
      realname: null,
      username: '',
      hostname: 'impish',
    );

    final client = MockSubiquityClient();
    when(client.identity()).thenAnswer((_) async => identity);

    final model = WhoAreYouModel(client);
    model.setRealName(ValidatedString('Ubuntu', isValid: true));
    model.setUsername(ValidatedString('ubuntu', isValid: true));

    await IOOverrides.runZoned(() async {
      await model.loadIdentity();
    }, createFile: (path) => MockProductNameFile('impish'));
    verify(client.identity()).called(1);

    expect(model.realName, equals('Ubuntu')); // retained
    expect(model.username, equals('ubuntu')); // retained
    expect(model.hostname, equals('impish')); // loaded
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
    model.setRealName(ValidatedString(identity.realname!));
    model.setUsername(ValidatedString(identity.username!));
    model.setHostname(ValidatedString(identity.hostname!));
    model.setPassword(ValidatedString('passwd'));

    await model.saveIdentity(salt: 'test');

    verify(client.setIdentity(identity)).called(1);
  });

  test('password strength', () {
    // see password_test.dart for more detailed password strength tests
    final model = WhoAreYouModel(MockSubiquityClient());

    void testPasswordStrength(String password, Matcher matcher) {
      model.setPassword(ValidatedString(password));
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
    model.setRealName(ValidatedString('Ubuntu Impish'));
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.hostname, isEmpty);
    model.setHostname(ValidatedString('impish'));
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.username, 'ubuntu-impish');
    model.setUsername(ValidatedString('ubuntu'));
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.password, isEmpty);
    model.setPassword(ValidatedString('password'));
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.confirmedPassword, isEmpty);
    model.setConfirmedPassword(ValidatedString('password'));
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
      ValidatedString realName,
      ValidatedString hostname,
      ValidatedString username,
      ValidatedString password,
      ValidatedString confirmedPassword,
      Matcher matcher,
    ) {
      model.setRealName(realName);
      model.setHostname(hostname);
      model.setUsername(username);
      model.setPassword(password);
      model.setConfirmedPassword(confirmedPassword);
      expect(model.isValid, matcher);
    }

    // any field invalid
    testValid(
      ValidatedString('', isValid: false),
      ValidatedString('hostname', isValid: true),
      ValidatedString('username', isValid: true),
      ValidatedString('password', isValid: true),
      ValidatedString('confirmed', isValid: true),
      isFalse,
    );
    testValid(
      ValidatedString('realname', isValid: true),
      ValidatedString('', isValid: false),
      ValidatedString('username', isValid: true),
      ValidatedString('password', isValid: true),
      ValidatedString('confirmed', isValid: true),
      isFalse,
    );
    testValid(
      ValidatedString('realname', isValid: true),
      ValidatedString('hostname', isValid: true),
      ValidatedString('', isValid: false),
      ValidatedString('password', isValid: true),
      ValidatedString('confirmed', isValid: true),
      isFalse,
    );
    testValid(
      ValidatedString('realname', isValid: true),
      ValidatedString('hostname', isValid: true),
      ValidatedString('username', isValid: true),
      ValidatedString('', isValid: false),
      ValidatedString('confirmed', isValid: true),
      isFalse,
    );
    testValid(
      ValidatedString('realname', isValid: true),
      ValidatedString('hostname', isValid: true),
      ValidatedString('username', isValid: true),
      ValidatedString('password', isValid: true),
      ValidatedString('', isValid: false),
      isFalse,
    );

    // all fields valid
    testValid(
      ValidatedString('realname', isValid: true),
      ValidatedString('hostname', isValid: true),
      ValidatedString('username', isValid: true),
      ValidatedString('password', isValid: true),
      ValidatedString('confirmed', isValid: true),
      isTrue,
    );
  });
}
