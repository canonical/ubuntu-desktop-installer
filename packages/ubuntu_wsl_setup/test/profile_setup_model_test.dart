import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_test/mocks.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wsl_setup/pages/profile_setup/profile_setup_model.dart';

void main() {
  test('load profile setup', () async {
    const identity = IdentityData(username: 'ubuntu');

    final client = MockSubiquityClient();
    when(client.identity()).thenAnswer((_) async => identity);

    final model = ProfileSetupModel(client);
    await model.loadProfileSetup();
    verify(client.identity()).called(1);

    expect(model.username, equals(identity.username));
  });

  test('save profile', () async {
    final client = MockSubiquityClient();

    final model = ProfileSetupModel(client);
    model.username = 'ubuntu';
    model.password = 'password';

    final identity = IdentityData(
      username: model.username,
      cryptedPassword: encryptPassword('password', salt: 'test'),
    );

    await model.saveProfileSetup(salt: 'test');
    verify(client.setIdentity(identity)).called(1);
  });

  test('password strength', () {
    // see password_test.dart for more detailed password strength tests
    final model = ProfileSetupModel(MockSubiquityClient());

    void testPasswordStrength(String password, Matcher matcher) {
      model.password = password;
      expect(model.passwordStrength, matcher);
    }

    testPasswordStrength('password', equals(PasswordStrength.weak));
    testPasswordStrength('P4ssword', equals(PasswordStrength.moderate));
    testPasswordStrength('P@ssw0rd123', equals(PasswordStrength.strong));
  });

  test('notify changes', () {
    final model = ProfileSetupModel(MockSubiquityClient());

    var wasNotified = false;
    model.addListener(() => wasNotified = true);

    wasNotified = false;
    expect(model.username, isEmpty);
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
    expect(model.showAdvancedOptions, isFalse);
    model.showAdvancedOptions = true;
    expect(wasNotified, isTrue);
  });

  test('validation', () {
    final model = ProfileSetupModel(MockSubiquityClient());
    expect(model.isValid, isFalse);

    void testValid(
      String username,
      String password,
      String confirmedPassword,
      Matcher matcher,
    ) {
      model.username = username;
      model.password = password;
      model.confirmedPassword = confirmedPassword;
      expect(model.isValid, matcher);
    }

    // any field missing
    testValid('', 'password', '', isFalse);
    testValid('', '', 'password', isFalse);
    testValid('', 'password', 'password', isFalse);
    testValid('username', '', '', isFalse);
    testValid('username', 'password', '', isFalse);
    testValid('username', '', 'password', isFalse);

    // password matching
    testValid('ubuntu', 'password', 'confirmed', isFalse);
    testValid('ubuntu', 'password', 'password', isTrue);

    // username validation
    testValid('123', 'password', 'password', isFalse);
    testValid('UBUNTU', 'password', 'password', isFalse);
    testValid('inv@lid', 'password', 'password', isFalse);
  });
}
