import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/secure_boot/secure_boot_model.dart';

import 'test_secure_boot.dart';

void main() {
  test('init model with secure boot off should have not validated form', () {
    final model = SecureBootModel(
        storage: MockStorageService(), secureBootMode: SecureBootMode.turnOff);

    expect(model.isFormValid, false);
  });

  test('has secure boot', () async {
    final storage = MockStorageService();
    final model = SecureBootModel(storage: storage);

    when(storage.hasSecureBoot()).thenAnswer((_) async => true);
    expect(await model.hasSecureBoot(), isTrue);

    when(storage.hasSecureBoot()).thenAnswer((_) async => false);
    expect(await model.hasSecureBoot(), isFalse);
  });

  test('init model with secure boot off should have text field enabled', () {
    final model = SecureBootModel(
        storage: MockStorageService(), secureBootMode: SecureBootMode.turnOff);

    expect(model.areTextFieldsEnabled, true);
  });

  test('setting secure boot on should disable text fields', () {
    final model = SecureBootModel(storage: MockStorageService());

    model.setSecureBootMode(SecureBootMode.dontInstall);

    expect(model.areTextFieldsEnabled, false);
  });

  test('setting secure boot off should enable text fields', () {
    final model = SecureBootModel(storage: MockStorageService());

    model.setSecureBootMode(SecureBootMode.dontInstall);
    model.setSecureBootMode(SecureBootMode.turnOff);

    expect(model.areTextFieldsEnabled, true);
  });

  test(
      'setting different confirmation should invalid confirmation key and form',
      () {
    final model = SecureBootModel(storage: MockStorageService());

    model.setSecurityKey('mykey');
    model.setConfirmKey('differentkey');

    expect(model.isConfirmationKeyValid, false);
    expect(model.isFormValid, false);
  });
}
