import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/pages/updates_other_software/updates_other_software_model.dart';

void main() {
  group('UpdatesOtherSoftwareModel', () {
    test('init state should be ablet to set installation mode', () {
      final model =
          UpdateOtherSoftwareModel(installationMode: InstallationMode.normal);

      expect(model.installationMode, InstallationMode.normal);
    });

    test('should notify listeners when set installation mode', () {
      final model =
          UpdateOtherSoftwareModel(installationMode: InstallationMode.normal);

      InstallationMode? mode;

      model.addListener(() => mode = model.installationMode);

      model.setInstallationMode(InstallationMode.minimal);

      expect(mode, InstallationMode.minimal);
    });

    test('should have third party option set to false by default', () {
      final model =
          UpdateOtherSoftwareModel(installationMode: InstallationMode.normal);

      expect(model.installThirdParty, false);
    });

    test('should be able to set third party', () {
      final model =
          UpdateOtherSoftwareModel(installationMode: InstallationMode.normal);

      bool? shouldInstallThirdParty;

      model
          .addListener(() => shouldInstallThirdParty = model.installThirdParty);

      model.setInstallThirdParty(true);

      expect(shouldInstallThirdParty, true);
    });

    test('should not notify installation mode when passed null', () {
      final model =
          UpdateOtherSoftwareModel(installationMode: InstallationMode.normal);

      InstallationMode? mode;

      model.addListener(() => mode = model.installationMode);

      model.setInstallationMode(null);

      expect(mode, null);
    });

    test('should not notify third party when passed null', () {
      final model =
          UpdateOtherSoftwareModel(installationMode: InstallationMode.normal);

      bool? shouldInstallThirdParty;

      model
          .addListener(() => shouldInstallThirdParty = model.installThirdParty);

      model.setInstallThirdParty(null);

      expect(shouldInstallThirdParty, null);
    });
  });
}
