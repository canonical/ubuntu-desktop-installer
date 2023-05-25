import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/loading/loading_model.dart';
import 'package:ubuntu_desktop_installer/pages/loading/loading_page.dart';

import 'test_loading.mocks.dart';
export '../test_utils.dart';
export 'test_loading.mocks.dart';

LoadingModel buildLoadingModel({Duration? delay}) {
  final model = MockLoadingModel();
  when(model.init()).thenAnswer((_) => Future.delayed(delay ?? Duration.zero));
  return model;
}

@GenerateMocks([LoadingModel])
Widget buildLoadingPage(LoadingModel model) {
  return ProviderScope(
    overrides: [loadingModelProvider.overrideWith((_) => model)],
    child: const LoadingPage(),
  );
}
