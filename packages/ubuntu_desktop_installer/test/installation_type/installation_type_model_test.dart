import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:ubuntu_desktop_installer/pages/installation_type/installation_type_model.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/mocks.dart';

import 'installation_type_model_test.mocks.dart';

@GenerateMocks([DiskStorageService])
void main() {
  test('init existing OS', () async {
    final client = MockSubiquityClient();
    // when(client.getExistingOS()).thenAnswer((_) async => 'Ubuntu 18.04 LTS');

    final model = InstallationTypeModel(client, MockDiskStorageService());
    await model.init();
    // verify(client.getExistingOS()).called(1);

    // expect(model.existingOS, equals('Ubuntu 18.04 LTS'));
  });

  test('notify changes', () {
    final model = InstallationTypeModel(
      MockSubiquityClient(),
      MockDiskStorageService(),
    );

    var wasNotified = false;
    model.addListener(() => wasNotified = true);

    wasNotified = false;
    expect(model.installationType, equals(InstallationType.erase));
    model.installationType = InstallationType.manual;
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.advancedFeature, equals(AdvancedFeature.none));
    model.advancedFeature = AdvancedFeature.lvm;
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.encryption, isFalse);
    model.encryption = true;
    expect(wasNotified, isTrue);
  });

  test('product info', () {
    final model = InstallationTypeModel(
      MockSubiquityClient(),
      MockDiskStorageService(),
    );
    expect(model.productInfo, isNotEmpty);
  });
}
