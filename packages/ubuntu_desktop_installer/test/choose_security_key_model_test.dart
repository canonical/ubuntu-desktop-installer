import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/pages/choose_security_key/choose_security_key_model.dart';
import 'package:ubuntu_test/mocks.dart';

void main() {
  test('notify changes', () {
    final model = ChooseSecurityKeyModel(MockSubiquityClient());

    var wasNotified = false;
    model.addListener(() => wasNotified = true);

    wasNotified = false;
    expect(model.securityKey, isEmpty);
    model.securityKey = 'foo';
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.confirmedSecurityKey, isEmpty);
    model.confirmedSecurityKey = 'bar';
    expect(wasNotified, isTrue);
  });

  test('validation', () {
    final model = ChooseSecurityKeyModel(MockSubiquityClient());
    expect(model.isValid, isFalse);

    void testValid(
      String securityKey,
      String confirmedSecurityKey,
      Matcher matcher,
    ) {
      model.securityKey = securityKey;
      model.confirmedSecurityKey = confirmedSecurityKey;
      expect(model.isValid, matcher);
    }

    testValid('', '', isFalse);
    testValid('foo', 'foo', isTrue);
    testValid('foo', 'bar', isFalse);
  });
}
