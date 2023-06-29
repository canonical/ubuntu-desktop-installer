import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/installer/installer_model.dart';

import 'test_utils.dart';

void main() {
  test('init', () async {
    final controller = StreamController<ApplicationStatus>();

    final service = MockInstallerService();
    when(service.monitorStatus()).thenAnswer((_) => controller.stream);

    final model = InstallerModel(service);
    await model.init();
    verify(service.monitorStatus()).called(1);
    expect(controller.hasListener, isTrue);

    await model.dispose();
    expect(controller.hasListener, isFalse);
  });

  test('has route', () async {
    final service = MockInstallerService();
    when(service.hasRoute('a')).thenReturn(true);
    when(service.hasRoute('b')).thenReturn(false);

    final model = InstallerModel(service);

    expect(model.hasRoute('a'), isTrue);
    expect(model.hasRoute('b'), isFalse);
  });
}
