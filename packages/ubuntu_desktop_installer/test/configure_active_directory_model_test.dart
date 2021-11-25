import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/pages/configure_active_directory/configure_active_directory_model.dart';

void main() {
  test('notify changes', () {
    final model = ConfigureActiveDirectoryModel();

    var wasNotified = false;
    model.addListener(() => wasNotified = true);

    wasNotified = false;
    expect(model.domain, isEmpty);
    model.domain = 'domain';
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.admin, isEmpty);
    model.admin = 'admin';
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.password, isEmpty);
    model.password = 'password';
    expect(wasNotified, isTrue);
  });

  test('validation', () {
    final model = ConfigureActiveDirectoryModel();
    expect(model.isValid, isFalse);

    void testValid(
      String domain,
      String admin,
      String password,
      Matcher matcher,
    ) {
      model.domain = domain;
      model.admin = admin;
      model.password = password;
      expect(model.isValid, matcher);
    }

    testValid('', 'admin', 'passwd', isFalse);
    testValid('domain', '', 'passwd', isFalse);
    testValid('domain', 'admin', '', isFalse);
    testValid('domain', 'admin', 'password', isTrue);
  });
}
