import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ubuntu_wizard/widgets.dart';

// ignore_for_file: type=lint

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('reacts to tap', (tester) async {
    var wasSelected = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: OptionCard(
            selected: false,
            onSelected: () => wasSelected = true,
          ),
        ),
      ),
    );

    await tester.tap(find.byType(OptionCard));
    expect(wasSelected, isTrue);
  });

  testWidgets('title text style', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: OptionCard(
            title: Text('title'),
            selected: false,
            onSelected: () {},
          ),
        ),
      ),
    );

    final title = find.text('title');
    expect(title, findsOneWidget);

    final titleStyle = DefaultTextStyle.of(tester.element(title)).style;
    expect(titleStyle, isNotNull);

    final theme = Theme.of(tester.element(title)).textTheme;
    expect(titleStyle.color, equals(theme.bodyText2!.color));
    expect(titleStyle.fontSize, greaterThan(theme.bodyText2!.fontSize!));
  });
}
