import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';

void main() {
  testWidgets('contains radio and labels', (tester) async {
    Widget builder({required Widget? title, required Widget? subtitle}) {
      return MaterialApp(
        home: Scaffold(
          body: RadioButton<int>(
            title: title,
            subtitle: subtitle,
            value: 0,
            groupValue: 0,
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
    expect(find.byTypeOf<Radio<int>>(), findsOneWidget);

    await tester
        .pumpWidget(builder(title: const Text('title'), subtitle: null));
    expect(find.text('title'), findsOneWidget);
    expect(find.text('subtitle'), findsNothing);
    expect(find.byTypeOf<Radio<int>>(), findsOneWidget);

    await tester
        .pumpWidget(builder(title: null, subtitle: const Text('subtitle')));
    expect(find.text('title'), findsNothing);
    expect(find.text('subtitle'), findsOneWidget);
    expect(find.byTypeOf<Radio<int>>(), findsOneWidget);
  });

  testWidgets('the labels react to taps', (tester) async {
    int? changedValue;
    Widget builder({required int value, required int groupValue}) {
      return MaterialApp(
        home: Scaffold(
          body: RadioButton<int>(
            title: Text('title'),
            subtitle: Text('subtitle'),
            value: value,
            groupValue: groupValue,
            onChanged: (v) => changedValue = v,
          ),
        ),
      );
    }

    await tester.pumpWidget(builder(value: 1, groupValue: 1));
    await tester.tap(find.text('title'));
    expect(changedValue, equals(1));

    await tester.pumpWidget(builder(value: 2, groupValue: 3));
    await tester.tap(find.text('subtitle'));
    expect(changedValue, equals(2));
  });

  testWidgets('mouse cursor changes depending on the state', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              RadioButton<int>(
                title: Text('enabled'),
                value: 0,
                groupValue: 0,
                onChanged: (_) {},
              ),
              RadioButton<int>(
                title: Text('disabled'),
                value: 0,
                groupValue: 0,
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
              RadioButton<int>(
                title: Text('enabled'),
                value: 0,
                groupValue: 0,
                onChanged: (_) {},
              ),
              RadioButton<int>(
                title: Text('disabled'),
                value: 0,
                groupValue: 0,
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
