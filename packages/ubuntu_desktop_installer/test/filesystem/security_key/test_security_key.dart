import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/filesystem/security_key/security_key_model.dart';

import 'test_security_key.mocks.dart';
export 'test_security_key.mocks.dart';

@GenerateMocks([SecurityKeyModel])
SecurityKeyModel buildSecurityKeyModel({
  bool? isValid,
  String? securityKey,
  String? confirmedSecurityKey,
  bool? showSecurityKey,
}) {
  final model = MockSecurityKeyModel();
  when(model.isValid).thenReturn(isValid ?? true);
  when(model.securityKey).thenReturn(securityKey ?? '');
  when(model.confirmedSecurityKey).thenReturn(confirmedSecurityKey ?? '');
  when(model.showSecurityKey).thenReturn(showSecurityKey ?? false);
  return model;
}
