import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/security_key/security_key_model.dart';
import 'package:ubuntu_desktop_installer/services/disk_storage_service.dart';

import 'security_key_model_test.mocks.dart';

@GenerateMocks([DiskStorageService])
void main() {
  test('notify changes', () {
    final model = SecurityKeyModel(MockDiskStorageService());

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

    wasNotified = false;
    expect(model.showSecurityKey, isFalse);
    model.showSecurityKey = true;
    expect(wasNotified, isTrue);
  });

  test('validation', () {
    final model = SecurityKeyModel(MockDiskStorageService());
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

  test('save, clear and load security key', () async {
    final service = MockDiskStorageService();

    final model = SecurityKeyModel(service);
    model.securityKey = 'foo123';
    model.confirmedSecurityKey = 'foo123';

    await model.saveSecurityKey();
    expect(model.securityKey, isEmpty);
    expect(model.confirmedSecurityKey, isEmpty);

    verify(service.securityKey = 'foo123').called(1);
    verifyNever(service.setGuidedStorage());
    when(service.securityKey).thenReturn('bar456');

    await model.loadSecurityKey();
    verify(service.securityKey).called(1);
    expect(model.securityKey, 'bar456');
    expect(model.confirmedSecurityKey, 'bar456');
  });
}
