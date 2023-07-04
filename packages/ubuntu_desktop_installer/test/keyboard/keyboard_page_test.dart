import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/keyboard/keyboard_widgets.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/ubuntu_test.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:yaru_test/yaru_test.dart';

import 'test_keyboard.dart';

void main() {
  testWidgets('select keyboard layout', (tester) async {
    final model = buildKeyboardModel(
      layouts: List.generate(3, (i) => 'Layout $i'),
    );
    await tester.pumpWidget(tester.buildApp((_) => buildKeyboardPage(model)));

    for (var i = 0; i < 3; ++i) {
      final layoutTile = find.listTile('Layout $i');
      expect(layoutTile, findsOneWidget);
      await tester.tap(layoutTile);
      verify(model.selectLayout(i)).called(1);
    }
  });

  testWidgets('select keyboard variant', (tester) async {
    final model = buildKeyboardModel(
      variants: List.generate(3, (i) => 'Variant $i'),
    );
    await tester.pumpWidget(tester.buildApp((_) => buildKeyboardPage(model)));

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
    final model = buildKeyboardModel();
    await tester.pumpWidget(tester.buildApp((_) => buildKeyboardPage(model)));

    final textField = find.textField(tester.lang.keyboardTestHint);
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'foo bar');
    await tester.pump();
    expect(find.textField('foo bar'), findsOneWidget);
  });

  testWidgets('detect keyboard layout', (tester) async {
    final model = buildKeyboardModel();
    await tester.pumpWidget(tester.buildApp((_) => buildKeyboardPage(model)));

    final detectButton = find.button(tester.lang.keyboardDetectButton);
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

  testWidgets('keyboard detection unsupported', (tester) async {
    final model = buildKeyboardModel(canDetectLayout: false);
    await tester.pumpWidget(tester.buildApp((_) => buildKeyboardPage(model)));

    final detectButton = find.button(tester.lang.keyboardDetectButton);
    expect(detectButton, findsNothing);
  });

  testWidgets('valid input', (tester) async {
    final model = buildKeyboardModel(isValid: true);
    await tester.pumpWidget(tester.buildApp((_) => buildKeyboardPage(model)));

    expect(find.button(tester.ulang.nextLabel), isEnabled);
  });

  testWidgets('invalid input', (tester) async {
    final model = buildKeyboardModel(isValid: false);
    await tester.pumpWidget(tester.buildApp((_) => buildKeyboardPage(model)));

    expect(find.button(tester.ulang.nextLabel), isDisabled);
  });

  testWidgets('key search', (tester) async {
    final model = buildKeyboardModel();
    when(model.searchLayout('foo')).thenReturn(-1);
    when(model.searchLayout('bar')).thenReturn(2);

    await tester.pumpWidget(tester.buildApp((_) => buildKeyboardPage(model)));

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
    final model = buildKeyboardModel(isValid: true);
    await tester.pumpWidget(tester.buildApp((_) => buildKeyboardPage(model)));

    await tester.tapNext();
    await tester.pumpAndSettle();

    verify(model.save()).called(1);
    expect(find.text('Next page'), findsOneWidget);
  });
}
