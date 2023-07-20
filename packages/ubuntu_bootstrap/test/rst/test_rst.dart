import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_bootstrap/pages/rst/rst_model.dart';
import 'package:ubuntu_bootstrap/pages/rst/rst_page.dart';

import 'test_rst.mocks.dart';
export '../test_utils.dart';
export 'test_rst.mocks.dart';

@GenerateMocks([RstModel])
RstModel buildRstModel({bool? hasRst}) {
  final model = MockRstModel();
  when(model.hasRst()).thenAnswer((_) async => hasRst ?? false);
  return model;
}

Widget buildRstPage(RstModel model) {
  return ProviderScope(
    overrides: [
      rstModelProvider.overrideWith((_) => model),
    ],
    child: const RstPage(),
  );
}
