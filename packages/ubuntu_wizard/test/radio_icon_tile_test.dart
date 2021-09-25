import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ubuntu_wizard/widgets.dart';

void main() {
  testWidgets('icon & radio geometries match ', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              RadioIconTile(icon: Icon(Icons.close)),
              RadioListTile<dynamic>(
                value: 1,
                groupValue: 1,
                onChanged: (_) {},
              ),
            ],
          ),
        ),
      ),
    );

    final iconTile = tester.widget<ListTile>(
      find.descendant(
        of: find.byType(RadioIconTile),
        matching: find.byType(ListTile),
      ),
    );

    final radioTile = tester.widget<ListTile>(
      find.descendant(
        of: find.byType(RadioListTile),
        matching: find.byType(ListTile),
      ),
    );

    expect(iconTile.leading, isNotNull);
    expect(radioTile.leading, isNotNull);

    final iconRect = tester.getRect(find.byWidget(iconTile.leading!));
    final radioRect = tester.getRect(find.byWidget(radioTile.leading!));

    expect(iconRect.size, equals(radioRect.size));
    expect(iconRect.left, equals(radioRect.left));
    expect(iconRect.right, equals(radioRect.right));
  });
}
