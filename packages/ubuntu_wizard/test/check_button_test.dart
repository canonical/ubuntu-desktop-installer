import 'package:flutter/material.dart';
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
}
