import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ubuntu_wizard/widgets.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('has rounded border', (tester) async {
    await tester.pumpWidget(
      RoundedContainer(
        borderColor: Colors.red,
        borderRadius: 10,
        borderWidth: 2,
      ),
    );

    final container = tester.widget<Container>(find.byType(Container));
    final decoration = container.decoration! as BoxDecoration;
    expect(decoration.border, equals(Border.all(color: Colors.red, width: 2)));
    expect(decoration.borderRadius, equals(BorderRadius.circular(10)));
  });

  testWidgets('has rounded clip inside border', (tester) async {
    await tester.pumpWidget(RoundedContainer(borderRadius: 10, borderWidth: 2));

    final clipRRect = tester.widget<ClipRRect>(
      find.descendant(
        of: find.byType(Container),
        matching: find.byType(ClipRRect),
      ),
    );
    // clip radius = border radius - border width / 2
    expect(clipRRect.borderRadius, equals(BorderRadius.circular(9)));
  });

  testWidgets('has material for effects inside rounded clip', (tester) async {
    await tester.pumpWidget(RoundedContainer());

    expect(
      find.descendant(
        of: find.byType(ClipRRect),
        matching: find.byType(Material),
      ),
      findsOneWidget,
    );
  });
}
