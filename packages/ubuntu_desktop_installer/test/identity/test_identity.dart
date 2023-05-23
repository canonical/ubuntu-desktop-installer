import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/identity/identity_model.dart';
import 'package:ubuntu_desktop_installer/pages/identity/identity_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';

import 'test_identity.mocks.dart';
export 'test_identity.mocks.dart';

@GenerateMocks([
  ActiveDirectoryService,
  ConfigService,
  IdentityService,
  NetworkService,
  TelemetryService,
])
IdentityModel buildIdentityModel({
  bool? isValid,
  String? realName,
  String? hostname,
  String? username,
  String? password,
  String? confirmedPassword,
  PasswordStrength? passwordStrength,
  bool? autoLogin,
  bool? showPassword,
  bool? isConnected,
  bool? hasActiveDirectorySupport,
  bool? useActiveDirectory,
}) {
  final model = MockIdentityModel();
  when(model.isValid).thenReturn(isValid ?? false);
  when(model.realName).thenReturn(realName ?? '');
  when(model.hostname).thenReturn(hostname ?? '');
  when(model.username).thenReturn(username ?? '');
  when(model.password).thenReturn(password ?? '');
  when(model.confirmedPassword).thenReturn(confirmedPassword ?? '');
  when(model.passwordStrength)
      .thenReturn(passwordStrength ?? PasswordStrength.weak);
  when(model.autoLogin).thenReturn(autoLogin ?? false);
  when(model.showPassword).thenReturn(showPassword ?? false);
  when(model.usernameOk).thenReturn(true);
  when(model.usernameValidation).thenReturn(UsernameValidation.OK);
  when(model.isConnected).thenReturn(isConnected ?? false);
  when(model.hasActiveDirectorySupport)
      .thenReturn(hasActiveDirectorySupport ?? false);
  when(model.useActiveDirectory).thenReturn(useActiveDirectory ?? false);
  return model;
}

@GenerateMocks([IdentityModel])
Widget buildIdentityPage(IdentityModel model) {
  return ProviderScope(
    overrides: [identityModelProvider.overrideWith((_) => model)],
    child: const IdentityPage(),
  );
}
