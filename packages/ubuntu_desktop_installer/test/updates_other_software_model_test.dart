import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/updates_other_software/updates_other_software_model.dart';
import 'package:ubuntu_test/mocks.dart';

void main() {
  late UpdateOtherSoftwareModel model;

  setUp(() {
    model = UpdateOtherSoftwareModel(
        client: MockSubiquityClient(),
        installationMode: InstallationMode.normal);
  });

  test('init state should be able to set installation mode', () {
    expect(model.installationMode, InstallationMode.normal);
  });

  test('should notify listeners when set installation mode', () {
    InstallationMode? mode;
    model.addListener(() => mode = model.installationMode);
    model.setInstallationMode(InstallationMode.minimal);
    expect(mode, InstallationMode.minimal);
  });

  test('should have third party option set to false by default', () {
    expect(model.installThirdParty, isFalse);
  });

  test('should be able to set third party', () {
    bool? shouldInstallThirdParty;
    model.addListener(() => shouldInstallThirdParty = model.installThirdParty);
    model.setInstallThirdParty(true);
    expect(shouldInstallThirdParty, isTrue);
  });

  test('should not notify installation mode when passed null', () {
    InstallationMode? mode;
    model.addListener(() => mode = model.installationMode);
    model.setInstallationMode(null);
    expect(mode, isNull);
  });

  test('should not notify third party when passed null', () {
    bool? shouldInstallThirdParty;
    model.addListener(() => shouldInstallThirdParty = model.installThirdParty);
    model.setInstallThirdParty(null);
    expect(shouldInstallThirdParty, isNull);
  });

  test('set the installation source', () async {
    final client = MockSubiquityClient();
    final model = UpdateOtherSoftwareModel(
        client: client, installationMode: InstallationMode.normal);

    await model.selectInstallationSource();
    verify(client.setSource('ubuntu-desktop')).called(1);

    model.setInstallationMode(InstallationMode.minimal);
    await model.selectInstallationSource();
    verify(client.setSource('ubuntu-desktop-minimal')).called(1);
  });
}
