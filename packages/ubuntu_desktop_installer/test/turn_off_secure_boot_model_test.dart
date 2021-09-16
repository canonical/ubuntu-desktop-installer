import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/pages/turn_off_secure_boot/turn_off_secure_boot_model.dart';

void main() {
  group('TurnOffSecureBootModel', () {
    test('init model with secure boot off should have not validated form', () {
      final model =
          TurnOffSecureBootModel(secureBootMode: SecureBootMode.turnoff);

      expect(model.isFormValid, false);
    });

    test('init model with secure boot off should have text field enabled', () {
      final model =
          TurnOffSecureBootModel(secureBootMode: SecureBootMode.turnoff);

      expect(model.areTextFieldEnabled, true);
    });

    test('setting secure boot on should disable text fields', () {
      final model =
          TurnOffSecureBootModel(secureBootMode: SecureBootMode.turnoff);

      model.setSecureBootMode(SecureBootMode.dontinstall);

      expect(model.areTextFieldEnabled, false);
    });

    test('setting secure boot off should enable text fields', () {
      final model =
          TurnOffSecureBootModel(secureBootMode: SecureBootMode.turnoff);

      model.setSecureBootMode(SecureBootMode.dontinstall);
      model.setSecureBootMode(SecureBootMode.turnoff);

      expect(model.areTextFieldEnabled, true);
    });

    test('setting secure boot off should enable text fields', () {
      final model =
          TurnOffSecureBootModel(secureBootMode: SecureBootMode.turnoff);

      model.setSecureBootMode(SecureBootMode.dontinstall);
      model.setSecureBootMode(SecureBootMode.turnoff);

      expect(model.areTextFieldEnabled, true);
    });

    test(
        'setting different confirmation should invalid confirmation key and form',
        () {
      final model =
          TurnOffSecureBootModel(secureBootMode: SecureBootMode.turnoff);

      model.setSecurityKey('mykey');
      model.setConfirmKey('differentkey');

      expect(model.isConfrmationKeyValid, false);
      expect(model.isFormValid, false);
    });
  });
}
