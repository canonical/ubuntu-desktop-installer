import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ubuntu_desktop_installer/widgets.dart';

enum TestEnum { foo, bar, baz }

Type typeOf<T>() => T;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('builds an item for each value', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: MenuButtonBuilder<TestEnum>(
            selected: TestEnum.bar,
            values: TestEnum.values,
            onSelected: (_) {},
            iconBuilder: (context, value, _) => Icon(Icons.arrow_drop_down),
            itemBuilder: (context, value, _) => Text(value.toString()),
          ),
        ),
      ),
    );

    await tester.tap(find.byType(typeOf<PopupMenuButton<TestEnum>>()));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.arrow_drop_down), findsOneWidget);
    for (final value in TestEnum.values) {
      expect(find.text(value.toString()), findsOneWidget);
    }
  });

  testWidgets('selects initial value', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: MenuButtonBuilder<TestEnum>(
            selected: TestEnum.bar,
            values: TestEnum.values,
            onSelected: (_) {},
            iconBuilder: (context, value, _) => Icon(Icons.arrow_drop_down),
            itemBuilder: (context, value, _) => Text(value.toString()),
          ),
        ),
      ),
    );

    await tester.tap(find.byType(typeOf<PopupMenuButton<TestEnum>>()));
    await tester.pumpAndSettle();

    final item = find.ancestor(
      of: find.text(TestEnum.bar.toString()),
      matching: find.byType(typeOf<CheckedPopupMenuItem<TestEnum>>()),
    );
    expect(tester.widget<CheckedPopupMenuItem<TestEnum>>(item).checked, isTrue);
  });

  testWidgets('selects tapped value', (tester) async {
    TestEnum? selectedValue;
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: MenuButtonBuilder<TestEnum>(
            selected: TestEnum.bar,
            values: TestEnum.values,
            onSelected: (value) => selectedValue = value,
            iconBuilder: (context, value, _) => Icon(Icons.arrow_drop_down),
            itemBuilder: (context, value, _) => Text(value.toString()),
          ),
        ),
      ),
    );

    await tester.tap(find.byType(typeOf<PopupMenuButton<TestEnum>>()));
    await tester.pumpAndSettle();

    await tester.tap(find.text(TestEnum.baz.toString()).last);
    await tester.pumpAndSettle();

    expect(selectedValue, equals(TestEnum.baz));
  });
}
