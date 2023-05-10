import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/keyboard/keyboard_model.dart';
import 'package:ubuntu_desktop_installer/pages/keyboard/keyboard_page.dart';
import 'package:ubuntu_desktop_installer/pages/keyboard/keyboard_widgets.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';

import '../test_utils.dart';
import 'keyboard_model_test.mocks.dart';
import 'keyboard_page_test.mocks.dart';

@GenerateMocks([KeyboardModel])
void main() {
  MockKeyboardModel buildModel({
    bool? isValid,
    List<String>? layouts,
    int? selectedLayoutIndex,
    List<String>? variants,
    int? selectedVariantIndex,
  }) {
    final model = MockKeyboardModel();
    when(model.init()).thenAnswer((_) async => true);
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
    return model;
  }

  Widget buildPage(KeyboardModel model) {
    final service = MockKeyboardService();
    when(service.getKeyboardStep(any)).thenAnswer(
        (_) async => const AnyStep.stepPressKey(keycodes: {}, symbols: []));
    registerMockService<KeyboardService>(service);

    return ProviderScope(
      overrides: [
        keyboardModelProvider.overrideWith((_) => model),
      ],
      child: Consumer(
        builder: (context, ref, child) => FutureBuilder(
          future: KeyboardPage.load(ref),
          builder: (context, snapshot) => const KeyboardPage(),
        ),
      ),
    );
  }

  testWidgets('initializes the model & input source', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));
    verify(model.init()).called(1);
    verify(model.updateInputSource()).called(1);
  });

  testWidgets('select keyboard layout', (tester) async {
    final model = buildModel(
      layouts: List.generate(3, (i) => 'Layout $i'),
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    for (var i = 0; i < 3; ++i) {
      final layoutTile = find.listTile('Layout $i');
      expect(layoutTile, findsOneWidget);
      await tester.tap(layoutTile);
      verify(model.selectLayout(i)).called(1);
    }
  });

  testWidgets('select keyboard variant', (tester) async {
    final model = buildModel(
      variants: List.generate(3, (i) => 'Variant $i'),
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    for (var i = 0; i < 3; ++i) {
      await tester.tap(find.byType(MenuButtonBuilder<int>));
      await tester.pumpAndSettle();
      final variantItem = find.menuItem('Variant $i');
      expect(variantItem, findsOneWidget);
      await tester.tap(variantItem);
      await tester.pumpAndSettle();
      verify(model.selectVariant(i)).called(1);
    }
  });

  testWidgets('type to test keyboard', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final textField = find.textField(tester.lang.typeToTest);
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'foo bar');
    await tester.pump();
    expect(find.textField('foo bar'), findsOneWidget);
  });

  testWidgets('detect keyboard layout', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final detectButton = find.button(tester.lang.detectButtonText);
    expect(detectButton, findsOneWidget);
    await tester.tap(detectButton);
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.byType(DetectKeyboardView), findsOneWidget);

    final context = tester.element(find.byType(DetectKeyboardView));
    Navigator.of(context)
        .pop(const AnyStep.stepResult(layout: 'layout', variant: 'variant'));
    await tester.pumpAndSettle();
    verify(model.trySelectLayoutVariant('layout', 'variant'));
  });

  testWidgets('valid input', (tester) async {
    final model = buildModel(isValid: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final nextButton = find.button(tester.ulang.nextLabel);
    expect(nextButton, findsOneWidget);
    expect(nextButton, isEnabled);
  });

  testWidgets('invalid input', (tester) async {
    final model = buildModel(isValid: false);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final nextButton = find.button(tester.ulang.nextLabel);
    expect(nextButton, findsOneWidget);
    expect(nextButton, isDisabled);
  });

  testWidgets('key search', (tester) async {
    final model = buildModel();
    when(model.searchLayout('foo')).thenReturn(-1);
    when(model.searchLayout('bar')).thenReturn(2);

    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final keySearch = find.byType(KeySearch);
    expect(keySearch, findsOneWidget);
    expect(keySearch, hasFocus);

    await tester.sendKeyEvent(LogicalKeyboardKey.keyF);
    await tester.sendKeyEvent(LogicalKeyboardKey.keyO);
    await tester.sendKeyEvent(LogicalKeyboardKey.keyO);
    await tester.pumpAndSettle(kKeySearchInterval);
    await tester.pumpAndSettle();
    verify(model.searchLayout('foo')).called(1);
    verifyNever(model.selectLayout(any));

    await tester.sendKeyEvent(LogicalKeyboardKey.keyB);
    await tester.sendKeyEvent(LogicalKeyboardKey.keyA);
    await tester.sendKeyEvent(LogicalKeyboardKey.keyR);
    await tester.pumpAndSettle(kKeySearchInterval);
    await tester.pumpAndSettle();
    verify(model.searchLayout('bar')).called(1);
    verify(model.selectLayout(2)).called(1);
  });

  testWidgets('continue on the next page', (tester) async {
    final model = buildModel(isValid: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final nextButton = find.button(tester.ulang.nextLabel);
    expect(nextButton, findsOneWidget);
    await tester.tap(nextButton);
    await tester.pumpAndSettle();

    verify(model.save()).called(1);
    expect(find.text('Next page'), findsOneWidget);
  });
}
