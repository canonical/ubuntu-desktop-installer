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
    model.setRealname(ValidatedString('Ubuntu'));
    model.setUsername(ValidatedString('ubuntu'));
    model.setPassword(ValidatedString('password'));

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
    model.setRealname(ValidatedString('Ubuntu Impish'));
    expect(model.username, equals('ubuntu-impish'));
  });

  test('password strength', () {
    // see password_test.dart for more detailed password strength tests
    final model = ProfileSetupModel(MockSubiquityClient());

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
    final model = ProfileSetupModel(MockSubiquityClient());

    var wasNotified = false;
    model.addListener(() => wasNotified = true);

    wasNotified = false;
    expect(model.realname, isEmpty);
    model.setRealname(ValidatedString('Ubuntu Impish'));
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.username, equals('ubuntu-impish')); // generated
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

    // NOTE: The advanced options cannot be skipped for now (#431).
    //       See [ProfileSetupModel.showAdvancedOptions] for more details.
    //
    // wasNotified = false;
    // expect(model.showAdvancedOptions, isFalse);
    // model.showAdvancedOptions = true;
    // expect(wasNotified, isTrue);
  });

  test('validation', () {
    final model = ProfileSetupModel(MockSubiquityClient());
    expect(model.isValid, isFalse);

    void testValid(
      ValidatedString realname,
      ValidatedString username,
      ValidatedString password,
      ValidatedString confirmedPassword,
      Matcher matcher,
    ) {
      model.setRealname(realname);
      model.setUsername(username);
      model.setPassword(password);
      model.setConfirmedPassword(confirmedPassword);
      expect(model.isValid, matcher);
    }

    // any field invalid
    testValid(
      ValidatedString('', isValid: false),
      ValidatedString('username', isValid: true),
      ValidatedString('password', isValid: true),
      ValidatedString('confirmed', isValid: true),
      isFalse,
    );
    testValid(
      ValidatedString('realname', isValid: true),
      ValidatedString('', isValid: false),
      ValidatedString('password', isValid: true),
      ValidatedString('confirmed', isValid: true),
      isFalse,
    );
    testValid(
      ValidatedString('realname', isValid: true),
      ValidatedString('username', isValid: true),
      ValidatedString('', isValid: false),
      ValidatedString('confirmed', isValid: true),
      isFalse,
    );
    testValid(
      ValidatedString('realname', isValid: true),
      ValidatedString('username', isValid: true),
      ValidatedString('password', isValid: true),
      ValidatedString('', isValid: false),
      isFalse,
    );

    // all fields valid
    testValid(
      ValidatedString('realname', isValid: true),
      ValidatedString('username', isValid: true),
      ValidatedString('password', isValid: true),
      ValidatedString('confirmed', isValid: true),
      isTrue,
    );
  });
}
