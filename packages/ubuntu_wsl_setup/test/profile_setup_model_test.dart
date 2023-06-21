import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wsl_setup/pages/profile_setup/profile_setup_model.dart';

void main() {
  test('load profile setup', () async {
    const identity = IdentityData(username: 'ubuntu');

    final client = MockSubiquityClient();
    when(client.getIdentity()).thenAnswer((_) async => identity);

    final model = ProfileSetupModel(client);
    await model.loadProfileSetup();
    verify(client.getIdentity()).called(1);

    expect(model.username, equals(identity.username));
  });

  test('save profile', () async {
    final client = MockSubiquityClient();

    final model = ProfileSetupModel(client);
    model.realname = 'Ubuntu';
    model.username = 'ubuntu';
    model.password = 'password';

    final identity = IdentityData(
      realname: model.realname,
      username: model.username,
      cryptedPassword: encryptPassword('password', salt: 'test'),
    );

    await model.saveProfileSetup(salt: 'test');
    verify(client.setIdentity(identity)).called(1);
  });

  test('username generation', () {
    final client = MockSubiquityClient();

    final model = ProfileSetupModel(client);
    model.realname = 'Ubuntu Impish';
    expect(model.username, equals('ubuntu-impish'));
  });

  test('password strength', () {
    // see password_test.dart for more detailed password strength tests
    final model = ProfileSetupModel(MockSubiquityClient());

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
    final model = ProfileSetupModel(MockSubiquityClient());

    var wasNotified = false;
    model.addListener(() => wasNotified = true);

    wasNotified = false;
    expect(model.realname, isEmpty);
    model.realname = 'Ubuntu Impish';
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.username, equals('ubuntu-impish')); // generated
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

    // NOTE: The advanced options cannot be skipped for now (#431).
    //       See [ProfileSetupModel.showAdvancedOptions] for more details.
    //
    // wasNotified = false;
    // expect(model.showAdvancedOptions, isFalse);
    // model.showAdvancedOptions = true;
    // expect(wasNotified, isTrue);
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

    final model = ProfileSetupModel(client);
    expect(model.isValid, isFalse);

    void testValid(
      String realname,
      String username,
      String password,
      String confirmedPassword,
      Matcher matcher,
    ) async {
      model.realname = realname;
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

  test('validation', () {
    final client = MockSubiquityClient();
    when(client.validateUsername(any))
        .thenAnswer((_) async => UsernameValidation.OK);
    final model = ProfileSetupModel(client);
    expect(model.isValid, isFalse);

    void testValid(
      String realname,
      String username,
      String password,
      String confirmedPassword,
      Matcher matcher,
    ) {
      model.realname = realname;
      model.username = username;
      model.password = password;
      model.confirmedPassword = confirmedPassword;
      expect(model.isValid, matcher);
    }

    // any field missing
    testValid('', 'username', 'password', 'password', isFalse);
    testValid('realname', '', 'password', '', isFalse);
    testValid('realname', '', '', 'password', isFalse);
    testValid('realname', '', 'password', 'password', isFalse);
    testValid('realname', 'username', '', '', isFalse);
    testValid('realname', 'username', 'password', '', isFalse);
    testValid('realname', 'username', '', 'password', isFalse);

    // password matching
    testValid('Ubuntu', 'ubuntu', 'password', 'confirmed', isFalse);
    testValid('Ubuntu', 'ubuntu', 'password', 'password', isTrue);

    // username validation
    testValid('User', '123', 'password', 'password', isFalse);
    testValid('User', 'UBUNTU', 'password', 'password', isFalse);
    testValid('User', 'inv@lid', 'password', 'password', isFalse);
  });
}
