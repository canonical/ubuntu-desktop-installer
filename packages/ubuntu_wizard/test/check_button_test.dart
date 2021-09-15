import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_wizard/widgets.dart';

void main() {
  testWidgets('contains checkbox and labels', (tester) async {
    Widget builder({required Widget? title, required Widget? subtitle}) {
      return MaterialApp(
        home: Scaffold(
          body: CheckButton(
            title: title,
            subtitle: subtitle,
            value: false,
            onChanged: (_) {},
          ),
        ),
      );
    }

    await tester.pumpWidget(
      builder(title: const Text('title'), subtitle: const Text('subtitle')),
    );
    expect(find.text('title'), findsOneWidget);
    expect(find.text('subtitle'), findsOneWidget);
    expect(find.byType(Checkbox), findsOneWidget);

    await tester
        .pumpWidget(builder(title: const Text('title'), subtitle: null));
    expect(find.text('title'), findsOneWidget);
    expect(find.text('subtitle'), findsNothing);
    expect(find.byType(Checkbox), findsOneWidget);

    await tester
        .pumpWidget(builder(title: null, subtitle: const Text('subtitle')));
    expect(find.text('title'), findsNothing);
    expect(find.text('subtitle'), findsOneWidget);
    expect(find.byType(Checkbox), findsOneWidget);
  });

  testWidgets('the labels react to taps', (tester) async {
    bool? changedValue;
    Widget builder({required bool initialValue}) {
      return MaterialApp(
        home: Scaffold(
          body: CheckButton(
            title: Text('title'),
            subtitle: Text('subtitle'),
            value: initialValue,
            onChanged: (v) => changedValue = v,
          ),
        ),
      );
    }

    await tester.pumpWidget(builder(initialValue: false));
    await tester.tap(find.text('title'));
    expect(changedValue, isTrue);

    await tester.pumpWidget(builder(initialValue: false));
    await tester.tap(find.text('subtitle'));
    expect(changedValue, isTrue);

    await tester.pumpWidget(builder(initialValue: true));
    await tester.tap(find.text('title'));
    expect(changedValue, isFalse);

    await tester.pumpWidget(builder(initialValue: true));
    await tester.tap(find.text('subtitle'));
    expect(changedValue, isFalse);
  });

  testWidgets('mouse cursor changes depending on the state', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              CheckButton(
                title: Text('enabled'),
                value: false,
                onChanged: (_) {},
              ),
              CheckButton(
                title: Text('disabled'),
                value: false,
                onChanged: null,
              ),
            ],
          ),
        ),
      ),
    );

    final gesture =
        await tester.createGesture(kind: PointerDeviceKind.mouse, pointer: 1);
    await gesture.addPointer(location: Offset.zero);
    addTearDown(gesture.removePointer);

    await gesture
        .moveTo(tester.getCenter(find.widgetWithText(MouseRegion, 'enabled')));
    await tester.pump();
    expect(RendererBinding.instance!.mouseTracker.debugDeviceActiveCursor(1),
        SystemMouseCursors.click);

    await gesture
        .moveTo(tester.getCenter(find.widgetWithText(MouseRegion, 'disabled')));
    await tester.pump();
    expect(RendererBinding.instance!.mouseTracker.debugDeviceActiveCursor(1),
        SystemMouseCursors.basic);
  });

  testWidgets('text color changes depending on the state', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              CheckButton(
                title: Text('enabled'),
                value: false,
                onChanged: (_) {},
              ),
              CheckButton(
                title: Text('disabled'),
                value: false,
                onChanged: null,
              ),
            ],
          ),
        ),
      ),
    );

    final enabled = tester.element(find.text('enabled'));
    expect(DefaultTextStyle.of(enabled).style.color,
        isNot(equals(Theme.of(enabled).disabledColor)));

    final disabled = tester.element(find.text('disabled'));
    expect(DefaultTextStyle.of(disabled).style.color,
        equals(Theme.of(disabled).disabledColor));
  });
}
