import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages/filesystem/installation_type/installation_type_model.dart';
import 'package:ubuntu_desktop_installer/services.dart';

import 'test_installation_type.mocks.dart';
export 'test_installation_type.mocks.dart';

@GenerateMocks([InstallationTypeModel])
InstallationTypeModel buildInstallationTypeModel({
  InstallationType? installationType,
  AdvancedFeature? advancedFeature,
  bool? encryption,
  ProductInfo? productInfo,
  List<OsProber>? existingOS,
  bool? canInstallAlongside,
  bool? hasStorage,
  bool? hasBitLocker,
  bool? isDone,
}) {
  final model = MockInstallationTypeModel();
  when(model.installationType)
      .thenReturn(installationType ?? InstallationType.erase);
  when(model.advancedFeature)
      .thenReturn(advancedFeature ?? AdvancedFeature.none);
  when(model.encryption).thenReturn(encryption ?? false);
  when(model.productInfo).thenReturn(productInfo ?? ProductInfo(name: ''));
  when(model.existingOS).thenReturn(existingOS);
  when(model.canInstallAlongside).thenReturn(canInstallAlongside ?? false);
  when(model.hasStorage).thenReturn(hasStorage ?? true);
  when(model.hasBitLocker).thenReturn(hasBitLocker ?? false);
  when(model.isDone).thenReturn(isDone ?? false);
  return model;
}
