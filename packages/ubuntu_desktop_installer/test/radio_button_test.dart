import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ubuntu_desktop_installer/widgets.dart';

import 'widget_tester_extensions.dart';

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
}
