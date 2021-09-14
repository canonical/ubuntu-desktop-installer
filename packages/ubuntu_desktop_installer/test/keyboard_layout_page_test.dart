import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages/keyboard_layout/keyboard_layout_model.dart';
import 'package:ubuntu_desktop_installer/pages/keyboard_layout/keyboard_layout_page.dart';
import 'package:ubuntu_desktop_installer/pages/keyboard_layout/keyboard_layout_widgets.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/mocks.dart';
import 'package:ubuntu_wizard/widgets.dart';

import 'keyboard_layout_page_test.mocks.dart';
import 'widget_tester_extensions.dart';

@GenerateMocks([KeyboardLayoutModel, KeyboardService])
void main() {
  KeyboardLayoutModel buildModel({
    bool? isValid,
    List<String>? layouts,
    int? selectedLayoutIndex,
    List<String>? variants,
    int? selectedVariantIndex,
  }) {
    final model = MockKeyboardLayoutModel();
    when(model.isValid).thenReturn(isValid ?? false);
    when(model.layoutCount).thenReturn(layouts?.length ?? 0);
    for (var i = 0; i < (layouts?.length ?? 0); ++i) {
      when(model.layoutName(i)).thenReturn(layouts![i]);
    }
    when(model.selectedLayoutIndex).thenReturn(selectedLayoutIndex ?? 0);
    when(model.variantCount).thenReturn(variants?.length ?? 0);
    for (var i = 0; i < (variants?.length ?? 0); ++i) {
      when(model.variantName(i)).thenReturn(variants![i]);
    }
    when(model.selectedVariantIndex).thenReturn(selectedVariantIndex ?? 0);
    when(model.onLayoutSelected).thenAnswer((_) => Stream<int>.empty());
    when(model.onVariantSelected).thenAnswer((_) => Stream<int>.empty());
    return model;
  }

  Widget buildPage(KeyboardLayoutModel model) {
    final client = MockSubiquityClient();
    when(client.getKeyboardStep(any))
        .thenAnswer((_) async => KeyboardStep.pressKey());
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<KeyboardLayoutModel>.value(value: model),
        Provider<SubiquityClient>.value(value: client),
      ],
      child: KeyboardLayoutPage(),
    );
  }

  Widget buildApp(WidgetTester tester, KeyboardLayoutModel model) {
    tester.binding.window.devicePixelRatioTestValue = 1;
    tester.binding.window.physicalSizeTestValue = Size(960, 680);
    return MaterialApp(
      localizationsDelegates: localizationsDelegates,
      home: Wizard(
        routes: {
          '/': (_) => buildPage(model),
          '/next': (_) => Text('Next page'),
        },
      ),
    );
  }

  testWidgets('initializes the model', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(buildApp(tester, model));
    verify(model.init()).called(1);
  });

  testWidgets('select keyboard layout', (tester) async {
    final model = buildModel(
      layouts: List.generate(3, (i) => 'Layout $i'),
    );
    await tester.pumpWidget(buildApp(tester, model));

    for (var i = 0; i < 3; ++i) {
      final layoutTile = find.widgetWithText(ListTile, 'Layout $i');
      expect(layoutTile, findsOneWidget);
      await tester.tap(layoutTile);
      verify(model.selectLayout(i)).called(1);
    }
  });

  testWidgets('select keyboard variant', (tester) async {
    final model = buildModel(
      variants: List.generate(3, (i) => 'Variant $i'),
    );
    await tester.pumpWidget(buildApp(tester, model));

    for (var i = 0; i < 3; ++i) {
      final variantTile = find.widgetWithText(ListTile, 'Variant $i');
      expect(variantTile, findsOneWidget);
      await tester.tap(variantTile);
      verify(model.selectVariant(i)).called(1);
    }
  });

  testWidgets('type to test keyboard', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(buildApp(tester, model));

    final textField = find.widgetWithText(TextField, tester.lang.typeToTest);
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'foo bar');
    await tester.pump();
    expect(find.widgetWithText(TextField, 'foo bar'), findsOneWidget);
  });

  testWidgets('detect keyboard layout', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(buildApp(tester, model));

    final detectButton =
        find.widgetWithText(OutlinedButton, tester.lang.detectLayout);
    expect(detectButton, findsOneWidget);
    await tester.tap(detectButton);
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.byType(DetectKeyboardLayoutView), findsOneWidget);

    final context = tester.element(find.byType(DetectKeyboardLayoutView));
    Navigator.of(context)
        .pop(KeyboardStep.result(layout: 'layout', variant: 'variant'));
    await tester.pumpAndSettle();
    verify(model.trySelectLayoutVariant('layout', 'variant'));
  });

  testWidgets('valid input', (tester) async {
    final model = buildModel(isValid: true);
    await tester.pumpWidget(buildApp(tester, model));

    final continueButton = find.widgetWithText(
      OutlinedButton,
      tester.ulang.continueAction,
    );
    expect(continueButton, findsOneWidget);
    expect(tester.widget<OutlinedButton>(continueButton).enabled, isTrue);
  });

  testWidgets('invalid input', (tester) async {
    final model = buildModel(isValid: false);
    await tester.pumpWidget(buildApp(tester, model));

    final continueButton = find.widgetWithText(
      OutlinedButton,
      tester.ulang.continueAction,
    );
    expect(continueButton, findsOneWidget);
    expect(tester.widget<OutlinedButton>(continueButton).enabled, isFalse);
  });

  testWidgets('continue on the next page', (tester) async {
    final model = buildModel(isValid: true);
    await tester.pumpWidget(buildApp(tester, model));

    final continueButton = find.widgetWithText(
      OutlinedButton,
      tester.ulang.continueAction,
    );
    expect(continueButton, findsOneWidget);
    await tester.tap(continueButton);
    await tester.pumpAndSettle();

    verify(model.applyKeyboardSettings()).called(1);
    expect(find.text('Next page'), findsOneWidget);
  });

  testWidgets('creates a model', (tester) async {
    final service = MockKeyboardService();
    when(service.layouts).thenReturn([]);

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: localizationsDelegates,
        home: MultiProvider(
          providers: [
            Provider<KeyboardService>.value(value: service),
            Provider<SubiquityClient>(create: (_) => MockSubiquityClient()),
          ],
          child: Wizard(
            routes: {'/': KeyboardLayoutPage.create},
            onNext: (settings) => '/',
          ),
        ),
      ),
    );

    final page = find.byType(KeyboardLayoutPage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model = Provider.of<KeyboardLayoutModel>(context, listen: false);
    expect(model, isNotNull);
  });
}
