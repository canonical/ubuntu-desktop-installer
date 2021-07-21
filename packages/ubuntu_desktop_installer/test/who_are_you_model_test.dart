import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages/who_are_you/who_are_you_model.dart';

import 'who_are_you_model_test.mocks.dart';

@GenerateMocks([SubiquityClient])
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
    await model.loadIdentity();
    verify(client.identity()).called(1);

    expect(model.realName, equals(identity.realname));
    expect(model.username, equals(identity.username));
    expect(model.password, isEmpty); // not loaded
    expect(model.hostName, equals(identity.hostname));
  });

  test('load null identity', () async {
    final client = MockSubiquityClient();
    when(client.identity()).thenAnswer((_) async => IdentityData());

    final model = WhoAreYouModel(client);
    await model.loadIdentity();
    verify(client.identity()).called(1);

    expect(model.realName, isEmpty);
    expect(model.username, isEmpty);
    expect(model.password, isEmpty);
    expect(model.hostName, isEmpty);
  });

  test('save identity', () async {
    final identity = IdentityData(
      realname: 'Ubuntu',
      username: 'ubuntu',
      cryptedPassword: WhoAreYouModel.encryptPassword('passwd'),
      hostname: 'impish',
    );

    final client = MockSubiquityClient();

    final model = WhoAreYouModel(client);
    model.realName = identity.realname!;
    model.username = identity.username!;
    model.hostName = identity.hostname!;
    model.password = 'passwd';

    await model.saveIdentity();

    verify(client.setIdentity(identity)).called(1);
  });

  test('encrypt & decrypt password', () {
    final password = 'passwd';
    final encrypted = WhoAreYouModel.encryptPassword(password);
    final decrypted = WhoAreYouModel.decryptPassword(encrypted);
    expect(decrypted, equals(password));
    expect(encrypted, isNot(equals(password)));
  });

  test('notify changes', () {
    final model = WhoAreYouModel(MockSubiquityClient());

    var wasNotified = false;
    model.addListener(() => wasNotified = true);

    wasNotified = false;
    expect(model.loginStrategy, LoginStrategy.requirePassword);
    model.loginStrategy = LoginStrategy.autoLogin;
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.realName, isEmpty);
    model.realName = 'Ubuntu';
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.username, isEmpty);
    model.username = 'ubuntu';
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.password, isEmpty);
    model.password = 'passwd';
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.hostName, isEmpty);
    model.hostName = 'impish';
    expect(wasNotified, isTrue);
  });

  test('password strength', () {
    final model = WhoAreYouModel(MockSubiquityClient());

    void testPasswordStrength(String password, Matcher matcher) {
      model.password = password;
      expect(model.passwordStrength, matcher);
    }

    testPasswordStrength('', isNull);
    testPasswordStrength('p', isNull);

    // 2
    testPasswordStrength('pw', equals(PasswordStrength.weakPassword));
    testPasswordStrength('p4', equals(PasswordStrength.weakPassword));
    testPasswordStrength('p@', equals(PasswordStrength.weakPassword));

    // 6
    testPasswordStrength('passwd', equals(PasswordStrength.weakPassword));
    testPasswordStrength('p4sswd', equals(PasswordStrength.averagePassword));
    // FIXME: 'p@sswd' should be considered average if 'p4sswd' is
    testPasswordStrength('p@sswd', equals(PasswordStrength.weakPassword));

    // 8
    testPasswordStrength('password', equals(PasswordStrength.weakPassword));
    testPasswordStrength('Password', equals(PasswordStrength.weakPassword));
    testPasswordStrength('p4ssword', equals(PasswordStrength.averagePassword));
    testPasswordStrength('P4ssword', equals(PasswordStrength.averagePassword));
    testPasswordStrength('p@ssw0rd', equals(PasswordStrength.averagePassword));
    testPasswordStrength('P@ssw0rd', equals(PasswordStrength.averagePassword));

    // 9
    testPasswordStrength('passsword', equals(PasswordStrength.weakPassword));
    testPasswordStrength('p4sssword', equals(PasswordStrength.averagePassword));
    testPasswordStrength('P4sssword', equals(PasswordStrength.averagePassword));
    testPasswordStrength('p@sssword', equals(PasswordStrength.strongPassword));
    testPasswordStrength('P@sssword', equals(PasswordStrength.strongPassword));
    testPasswordStrength('p@sssw0rd', equals(PasswordStrength.strongPassword));
    testPasswordStrength('P@sssw0rd', equals(PasswordStrength.strongPassword));
  });
}
