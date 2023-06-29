import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/installer.dart';
import 'package:ubuntu_desktop_installer/pages/install/install_model.dart';
import 'package:ubuntu_desktop_installer/pages/install/install_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';

import 'test_install.mocks.dart';
export '../test_utils.dart';
export 'test_install.mocks.dart';

@GenerateMocks([InstallModel])
InstallModel buildInstallModel({
  ApplicationState? state,
  bool? isDone,
  bool? hasError,
  bool? isInstalling,
  Stream<String>? log,
  InstallationEvent? event,
  bool? isLogVisible,
  bool? isPlaying,
  ProductInfo? productInfo,
}) {
  final model = MockInstallModel();
  when(model.state).thenReturn(state);
  when(model.isDone).thenReturn(isDone ?? false);
  when(model.hasError).thenReturn(hasError ?? false);
  when(model.isInstalling).thenReturn(isInstalling ?? false);
  when(model.log).thenAnswer((_) => log ?? const Stream<String>.empty());
  when(model.event).thenReturn(event ?? InstallationEvent.fromString(''));
  when(model.isLogVisible).thenReturn(isLogVisible ?? false);
  when(model.isPlaying).thenReturn(isPlaying ?? false);
  when(model.productInfo)
      .thenReturn(productInfo ?? ProductInfo(name: 'Ubuntu'));
  return model;
}

Widget buildPage(InstallModel model) {
  return ProviderScope(
    overrides: [installModelProvider.overrideWith((_) => model)],
    child: SlidesContext(slides: [
      (context) => const SizedBox.expand(child: Text('slide1')),
      (context) => const SizedBox.expand(child: Text('slide2')),
    ], child: const InstallPage()),
  );
}
