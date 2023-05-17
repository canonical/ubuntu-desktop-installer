import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/loading/loading_model.dart';
import 'package:ubuntu_desktop_installer/pages/loading/loading_page.dart';
import 'package:ubuntu_test/ubuntu_test.dart';

import '../test_utils.dart';
import 'loading_page_test.mocks.dart';

@GenerateMocks([LoadingModel])
void main() {
  LoadingModel buildModel({Duration? delay}) {
    final model = MockLoadingModel();
    when(model.init())
        .thenAnswer((_) => Future.delayed(delay ?? Duration.zero));
    return model;
  }

  Widget buildPage(LoadingModel model) {
    return ProviderScope(
      overrides: [loadingModelProvider.overrideWith((_) => model)],
      child: const LoadingPage(),
    );
  }

  testWidgets('init & advance', (tester) async {
    final model = buildModel(delay: const Duration(seconds: 3));
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    verify(model.init()).called(1);
    expect(find.byType(LoadingPage), findsOneWidget);

    await tester.pumpAndSettle(const Duration(seconds: 3));
    expect(find.byType(LoadingPage), findsNothing);
  });

  testWidgets('disabled buttons', (tester) async {
    final model = MockLoadingModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(find.button(tester.ulang.previousLabel), isDisabled);
    expect(find.button(tester.ulang.nextLabel), isDisabled);
  });
}
