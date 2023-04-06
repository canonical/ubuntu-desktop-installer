import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/widgets/scoped_list_focus.dart';

void main() {
  testWidgets('arrow keys', (tester) async {
    await tester.pumpScopedListFocus(
      ScopedListFocus(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (_, i) => TextButton(
            onPressed: () {},
            focusNode: FocusNode(),
            child: Text('item $i'),
          ),
        ),
      ),
    );

    await tester.sendKeyDownEvent(LogicalKeyboardKey.tab);
    await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowDown);
    await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowDown);
    await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowUp);
    await tester.pumpAndSettle();

    final item1 = find.widgetWithText(TextButton, 'item 1');
    expect(item1, findsOneWidget);
    expect(tester.widget<TextButton>(item1).focusNode!.hasFocus, isTrue);
  });

  testWidgets('tab key', (tester) async {
    await tester.pumpScopedListFocus(Row(
      children: [
        TextButton(
          onPressed: () {},
          focusNode: FocusNode(),
          child: const Text('button 1'),
        ),
        Flexible(
          child: ScopedListFocus(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (_, i) => TextButton(
                onPressed: () {},
                focusNode: FocusNode(),
                child: Text('item $i'),
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          focusNode: FocusNode(),
          child: const Text('button 2'),
        ),
      ],
    ));

    find.widgetWithText(TextButton, 'item 0');
    tester
        .widget<TextButton>(find.widgetWithText(TextButton, 'item 0'))
        .focusNode!
        .requestFocus();
    await tester.sendKeyDownEvent(LogicalKeyboardKey.tab);
    await tester.pumpAndSettle();

    final button2 = find.widgetWithText(TextButton, 'button 2');
    expect(button2, findsOneWidget);
    expect(tester.widget<TextButton>(button2).focusNode!.hasFocus, isTrue);

    await tester.sendKeyDownEvent(LogicalKeyboardKey.shift);
    await tester.sendKeyDownEvent(LogicalKeyboardKey.tab);
    await tester.sendKeyDownEvent(LogicalKeyboardKey.tab);

    final button1 = find.widgetWithText(TextButton, 'button 1');
    expect(button1, findsOneWidget);
    expect(tester.widget<TextButton>(button1).focusNode!.hasFocus, isTrue);
  });
}

extension on WidgetTester {
  Future<void> pumpScopedListFocus(Widget widget) {
    return pumpWidget(
      MaterialApp(
        shortcuts: Map.from(WidgetsApp.defaultShortcuts)
          ..removeWhere((_, intent) => intent is DirectionalFocusIntent),
        home: Scaffold(
          body: widget,
        ),
      ),
    );
  }
}
