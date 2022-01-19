import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/pages/choose_security_key/choose_security_key_model.dart';
import 'package:ubuntu_test/mocks.dart';
import 'package:ubuntu_wizard/utils.dart';

void main() {
  test('notify changes', () {
    final model = ChooseSecurityKeyModel(MockSubiquityClient());

    var wasNotified = false;
    model.addListener(() => wasNotified = true);

    wasNotified = false;
    expect(model.securityKey, isEmpty);
    model.setSecurityKey(ValidatedString('foo'));
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.confirmedSecurityKey, isEmpty);
    model.setConfirmedSecurityKey(ValidatedString('bar'));
    expect(wasNotified, isTrue);
  });

  test('validation', () {
    final model = ChooseSecurityKeyModel(MockSubiquityClient());
    expect(model.isValid, isFalse);

    void testValid(
      ValidatedString securityKey,
      ValidatedString confirmedSecurityKey,
      Matcher matcher,
    ) {
      model.setSecurityKey(securityKey);
      model.setConfirmedSecurityKey(confirmedSecurityKey);
      expect(model.isValid, matcher);
    }

    testValid(ValidatedString(''), ValidatedString(''), isFalse);
    testValid(ValidatedString('foo', isValid: true),
        ValidatedString('foo', isValid: true), isTrue);
    testValid(ValidatedString('foo', isValid: true),
        ValidatedString('bar', isValid: false), isFalse);
  });
}
