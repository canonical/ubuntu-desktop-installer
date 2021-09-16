import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/pages/configure_secure_boot/configure_secure_boot_model.dart';

void main() {
  group('ConfigureSecureBootModel', () {
    test('init model with secure boot off should have not validated form', () {
      final model =
          ConfigureSecureBootModel(secureBootMode: SecureBootMode.turnOff);

      expect(model.isFormValid, false);
    });

    test('init model with secure boot off should have text field enabled', () {
      final model =
          ConfigureSecureBootModel(secureBootMode: SecureBootMode.turnOff);

      expect(model.areTextFieldsEnabled, true);
    });

    test('setting secure boot on should disable text fields', () {
      final model =
          ConfigureSecureBootModel(secureBootMode: SecureBootMode.turnOff);

      model.setSecureBootMode(SecureBootMode.dontInstall);

      expect(model.areTextFieldsEnabled, false);
    });

    test('setting secure boot off should enable text fields', () {
      final model =
          ConfigureSecureBootModel(secureBootMode: SecureBootMode.turnOff);

      model.setSecureBootMode(SecureBootMode.dontInstall);
      model.setSecureBootMode(SecureBootMode.turnOff);

      expect(model.areTextFieldsEnabled, true);
    });

    test('setting secure boot off should enable text fields', () {
      final model =
          ConfigureSecureBootModel(secureBootMode: SecureBootMode.turnOff);

      model.setSecureBootMode(SecureBootMode.dontInstall);
      model.setSecureBootMode(SecureBootMode.turnOff);

      expect(model.areTextFieldsEnabled, true);
    });

    test(
        'setting different confirmation should invalid confirmation key and form',
        () {
      final model =
          ConfigureSecureBootModel(secureBootMode: SecureBootMode.turnOff);

      model.setSecurityKey('mykey');
      model.setConfirmKey('differentkey');

      expect(model.isConfirmationKeyValid, false);
      expect(model.isFormValid, false);
    });
  });
}
