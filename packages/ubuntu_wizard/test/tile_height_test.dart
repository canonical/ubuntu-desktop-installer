import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_wizard/widgets.dart';

void main() {
  testWidgets('default height of list tile', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              ListTile(title: const Text('one line')),
              ListTile(
                title: const Text('two lines'),
                subtitle: const Text('subtitle'),
              ),
              ListTile(
                isThreeLine: true,
                title: const Text('three lines'),
                subtitle: const Text('sub\ntitle'),
              ),
            ],
          ),
        ),
      ),
    );

    final tile1 = find.widgetWithText(ListTile, 'one line');
    expect(tile1, findsOneWidget);
    expect(
      tester.getSize(tile1).height,
      defaultTileHeight(tester.element(tile1)),
    );

    final tile2 = find.widgetWithText(ListTile, 'two lines');
    expect(tile2, findsOneWidget);
    expect(
      tester.getSize(tile2).height,
      defaultTileHeight(tester.element(tile2), isTwoLine: true),
    );

    final tile3 = find.widgetWithText(ListTile, 'three lines');
    expect(tile3, findsOneWidget);
    expect(
      tester.getSize(tile3).height,
      defaultTileHeight(tester.element(tile3), isThreeLine: true),
    );

    expectLater(
      () => defaultTileHeight(tester.element(tile1),
          isTwoLine: true, isThreeLine: true),
      throwsAssertionError,
    );
  });
}
