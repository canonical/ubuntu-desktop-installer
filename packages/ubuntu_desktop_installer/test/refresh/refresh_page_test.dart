import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/pages/refresh/refresh_model.dart';
import 'package:ubuntu_desktop_installer/pages/refresh/refresh_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';

import '../test_utils.dart';
import 'refresh_state_test.dart';
import 'refresh_model_test.mocks.dart';
import 'refresh_page_test.mocks.dart';

@GenerateMocks([RefreshModel])
void main() {
  RefreshModel buildModel({required RefreshState state}) {
    final model = MockRefreshModel();
    when(model.state).thenReturn(state);
    return model;
  }

  Widget buildPage(RefreshModel model) {
    return ChangeNotifierProvider<RefreshModel>.value(
      value: model,
      child: const RefreshPage(),
    );
  }

  testWidgets('checking', (tester) async {
    final model = buildModel(state: const RefreshState.checking());
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final indicator = find.byType(CircularProgressIndicator);
    expect(indicator, findsOneWidget);
    final progress = tester.widget<CircularProgressIndicator>(indicator);
    expect(progress, isNotNull);
    expect(progress.value, isNull); // indeterminate

    expect(
      find.widgetWithText(OutlinedButton, tester.ulang.goBackLabel),
      findsOneWidget,
    );
    expect(
      find.widgetWithText(OutlinedButton, tester.lang.skipButtonText),
      findsOneWidget,
    );
  });

  testWidgets('available', (tester) async {
    final model = buildModel(state: available);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final indicator = find.byType(CircularProgressIndicator);
    expect(indicator, findsOneWidget);
    final progress = tester.widget<CircularProgressIndicator>(indicator);
    expect(progress, isNotNull);
    expect(progress.value, isZero);

    expect(find.textContaining('1.2.3'), findsOneWidget);
    expect(
      find.widgetWithText(ElevatedButton, tester.lang.refreshInstall('1.2.4')),
      findsOneWidget,
    );

    expect(
      find.widgetWithText(OutlinedButton, tester.ulang.goBackLabel),
      findsOneWidget,
    );
    expect(
      find.widgetWithText(OutlinedButton, tester.lang.skipButtonText),
      findsOneWidget,
    );
  });

  testWidgets('unavailable', (tester) async {
    final model = buildModel(state: unavailable);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final indicator = find.byType(CircularProgressIndicator);
    expect(indicator, findsOneWidget);
    final progress = tester.widget<CircularProgressIndicator>(indicator);
    expect(progress, isNotNull);
    expect(progress.value, isZero);

    expect(find.text(tester.lang.refreshUpToDate('1.2.3')), findsOneWidget);
    expect(
      find.widgetWithText(ElevatedButton, tester.lang.refreshInstall('1.2.4')),
      findsNothing,
    );

    expect(
      find.widgetWithText(OutlinedButton, tester.ulang.goBackLabel),
      findsOneWidget,
    );
    expect(
      find.widgetWithText(OutlinedButton, tester.lang.skipButtonText),
      findsOneWidget,
    );
  });

  testWidgets('progress', (tester) async {
    final model = buildModel(state: notReady);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final indicator = find.byType(CircularProgressIndicator);
    expect(indicator, findsOneWidget);
    final progress = tester.widget<CircularProgressIndicator>(indicator);
    expect(progress, isNotNull);
    expect(progress.value, 0.25);

    expect(find.byType(OutlinedButton), findsNothing);
  });

  testWidgets('done', (tester) async {
    final model = buildModel(state: done);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final indicator = find.byType(CircularProgressIndicator);
    expect(indicator, findsOneWidget);
    final progress = tester.widget<CircularProgressIndicator>(indicator);
    expect(progress, isNotNull);
    expect(progress.value, isZero);

    expect(
      find.widgetWithText(ElevatedButton, tester.lang.restartButtonText),
      findsOneWidget,
    );
  });

  testWidgets('error', (tester) async {
    final model = buildModel(state: error);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final indicator = find.byType(CircularProgressIndicator);
    expect(indicator, findsOneWidget);
    final progress = tester.widget<CircularProgressIndicator>(indicator);
    expect(progress, isNotNull);
    expect(progress.value, isZero);

    expect(
      find.widgetWithText(ElevatedButton, tester.lang.restartButtonText),
      findsOneWidget,
    );
  });

  testWidgets('creates a model', (tester) async {
    final storage = MockRefreshService();
    when(storage.state).thenReturn(checking);
    when(storage.stateChanged).thenAnswer((_) => const Stream.empty());
    when(storage.check()).thenAnswer((_) async => checking);
    registerMockService<RefreshService>(storage);

    await tester.pumpWidget(tester.buildApp(RefreshPage.create));

    final page = find.byType(RefreshPage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model = Provider.of<RefreshModel>(context, listen: false);
    expect(model, isNotNull);
  });
}
