import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/active_directory/active_directory_model.dart';
import 'package:ubuntu_desktop_installer/pages/active_directory/active_directory_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';

import 'test_active_directory.mocks.dart';
export '../test_utils.dart';
export 'test_active_directory.mocks.dart';

@GenerateMocks([ActiveDirectoryModel])
ActiveDirectoryModel buildActiveDirectoryModel({
  bool? isUsed,
  bool? isValid,
  String? domainName,
  String? adminName,
  String? password,
  List<AdDomainNameValidation>? domainNameValidation,
  AdAdminNameValidation? adminNameValidation,
  AdPasswordValidation? passwordValidation,
  AdJoinResult? joinResult,
}) {
  final model = MockActiveDirectoryModel();
  when(model.init()).thenAnswer((_) async => isUsed ?? false);
  when(model.isValid).thenReturn(isValid ?? false);
  when(model.domainName).thenReturn(domainName ?? '');
  when(model.adminName).thenReturn(adminName ?? '');
  when(model.password).thenReturn(password ?? '');
  when(model.domainNameValidation)
      .thenReturn(domainNameValidation ?? [AdDomainNameValidation.OK]);
  when(model.adminNameValidation)
      .thenReturn(adminNameValidation ?? AdAdminNameValidation.OK);
  when(model.passwordValidation)
      .thenReturn(passwordValidation ?? AdPasswordValidation.OK);
  when(model.getJoinResult())
      .thenAnswer((_) async => joinResult ?? AdJoinResult.OK);
  return model;
}

Widget buildActiveDirectoryPage(ActiveDirectoryModel model) {
  return ProviderScope(
    overrides: [activeDirectoryModelProvider.overrideWith((_) => model)],
    child: const ActiveDirectoryPage(),
  );
}
