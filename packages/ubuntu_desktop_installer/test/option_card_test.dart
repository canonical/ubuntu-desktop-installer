import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ubuntu_desktop_installer/widgets.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('reacts to tap', (tester) async {
    var wasSelected = false;
    await tester.pumpWidget(
      MaterialApp(
        home: OptionCard(
          selected: false,
          onSelected: () => wasSelected = true,
        ),
      ),
    );

    await tester.tap(find.byType(OptionCard));
    expect(wasSelected, isTrue);
  });

  testWidgets('reacts to hover', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: OptionCard(selected: false, onSelected: () {}),
      ),
    );

    final state = tester.state<OptionCardState>(find.byType(OptionCard));
    expect(state.hovered, isFalse);

    final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
    await gesture.addPointer();
    addTearDown(gesture.removePointer);
    await tester.pump();
    await gesture.moveTo(tester.getCenter(find.byType(OptionCard)));
    await tester.pumpAndSettle();

    expect(state.hovered, isTrue);
  });
}
