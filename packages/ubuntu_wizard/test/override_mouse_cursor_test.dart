import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_wizard/widgets.dart';

void main() {
  testWidgets('override mouse cursor', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              ListTile(title: const Text('normal'), onTap: () {}),
              const ListTile(title: Text('disabled')),
              OverrideMouseCursor(
                cursor: SystemMouseCursors.basic,
                child: ListTile(title: const Text('basic'), onTap: () {}),
              ),
              const OverrideMouseCursor(
                cursor: SystemMouseCursors.alias,
                child: ListTile(title: Text('alias')),
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

    MouseCursor? debugDeviceActiveCursor() {
      return WidgetsBinding.instance.mouseTracker.debugDeviceActiveCursor(1);
    }

    await gesture.moveTo(tester.getCenter(find.text('normal')));
    await tester.pump();
    expect(debugDeviceActiveCursor(), SystemMouseCursors.click);

    await gesture.moveTo(tester.getCenter(find.text('disabled')));
    await tester.pump();
    expect(debugDeviceActiveCursor(), SystemMouseCursors.basic);

    await gesture.moveTo(tester.getCenter(find.text('basic')));
    await tester.pump();
    expect(debugDeviceActiveCursor(), SystemMouseCursors.basic);

    await gesture.moveTo(tester.getCenter(find.text('alias')));
    await tester.pump();
    expect(debugDeviceActiveCursor(), SystemMouseCursors.alias);
  });
}
