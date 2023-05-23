import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/rst/rst_model.dart';
import 'package:ubuntu_desktop_installer/pages/rst/rst_page.dart';
import 'package:ubuntu_wizard/utils.dart';

import 'test_rst.mocks.dart';
export 'test_rst.mocks.dart';

RstModel buildRstModel({bool? hasRst}) {
  final model = MockRstModel();
  when(model.hasRst()).thenAnswer((_) async => hasRst ?? false);
  return model;
}

@GenerateMocks([RstModel, UrlLauncher])
Widget buildRstPage(RstModel model) {
  return ProviderScope(
    overrides: [
      rstModelProvider.overrideWith((_) => model),
    ],
    child: const RstPage(),
  );
}
