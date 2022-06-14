import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ubuntu_wizard/widgets.dart';

// ignore_for_file: type=lint

void main() {
  testWidgets('layout', (tester) async {
    tester.binding.window.devicePixelRatioTestValue = 1;
    tester.binding.window.physicalSizeTestValue = const Size(600, 400);

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: FormLayout(
          rowSpacing: 10,
          columnSpacing: 20,
          rows: const [
            [
              SizedBox(key: Key('r0c0'), width: 100, height: 10),
              SizedBox(key: Key('r0c1'), width: 200, height: 10),
              SizedBox(key: Key('r0c2'), width: 300, height: 10),
            ],
            [
              SizedBox(key: Key('r1c0'), width: 50, height: 10),
              SizedBox(key: Key('r1c1'), width: 100, height: 20),
              SizedBox(key: Key('r1c2'), width: 150, height: 30),
            ],
            [
              SizedBox(key: Key('r2c0'), width: 75, height: 15),
              SizedBox(key: Key('r2c1'), width: 150, height: 15),
              SizedBox(key: Key('r2c2'), width: 225, height: 15),
            ],
          ],
        ),
      ),
    );

    final r0c0 = tester.getRect(find.byKey(Key('r0c0')));
    final r0c1 = tester.getRect(find.byKey(Key('r0c1')));
    final r0c2 = tester.getRect(find.byKey(Key('r0c2')));

    final r1c0 = tester.getRect(find.byKey(Key('r1c0')));
    final r1c1 = tester.getRect(find.byKey(Key('r1c1')));
    final r1c2 = tester.getRect(find.byKey(Key('r1c2')));

    final r2c0 = tester.getRect(find.byKey(Key('r2c0')));
    final r2c1 = tester.getRect(find.byKey(Key('r2c1')));
    final r2c2 = tester.getRect(find.byKey(Key('r2c2')));

    // rows are spaced and vertically centered
    expect(r0c0.top, isZero);
    expect(r1c2.top, equals(10 + 10));
    expect(r2c0.top, equals(10 + 10 + 30 + 10));
    expect(r0c0.center.dy, equals(r0c1.center.dy));
    expect(r0c1.center.dy, equals(r0c2.center.dy));
    expect(r1c0.center.dy, equals(r1c1.center.dy));
    expect(r1c1.center.dy, equals(r1c2.center.dy));
    expect(r2c0.center.dy, equals(r2c1.center.dy));
    expect(r2c1.center.dy, equals(r2c2.center.dy));

    // columns are spaced and horizontally aligned
    expect(r0c0.left, isZero);
    expect(r0c1.left, equals(100 + 20));
    expect(r0c2.left, equals(100 + 20 + 200 + 20));
    expect(r0c0.left, equals(r1c0.left));
    expect(r1c0.left, equals(r2c0.left));
    expect(r0c1.left, equals(r1c1.left));
    expect(r1c1.left, equals(r2c1.left));
    expect(r0c2.left, equals(r1c2.left));
    expect(r1c2.left, equals(r2c2.left));
    expect(r0c0.right, equals(r1c0.right));
    expect(r1c0.right, equals(r2c0.right));
    expect(r0c1.right, equals(r1c1.right));
    expect(r1c1.right, equals(r2c1.right));
    expect(r0c2.right, equals(r1c2.right));
    expect(r1c2.right, equals(r2c2.right));
  });
}
