import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/pages/allocate_disk_space/storage_selector.dart';

import '../test_utils.dart';

// ignore_for_file: type=lint

void main() {
  testWidgets('initial selection', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Center(
          child: StorageSelector(
            title: '',
            storages: [
              for (var i = 0; i < 3; i++)
                testDisk(model: 'model$i', vendor: 'vendor$i'),
            ],
            selected: 1,
            onSelected: (_) {},
          ),
        ),
      ),
    ));
    await tester.pumpAndSettle();

    final button =
        tester.widget<PopupMenuButton<int>>(find.byType(PopupMenuButton<int>));
    expect(button.initialValue, equals(1));
  });

  testWidgets('selection', (tester) async {
    int? selected;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Center(
          child: StorageSelector(
            title: '',
            storages: [
              for (var i = 0; i < 3; i++)
                testDisk(model: 'model$i', vendor: 'vendor$i'),
            ],
            onSelected: (v) => selected = v,
          ),
        ),
      ),
    ));

    await tester.tap(find.byType(PopupMenuButton<int>));
    await tester.pumpAndSettle();

    final menuItem = find.descendant(
      of: find.byType(PopupMenuItem<int>),
      matching: find.byKey(ValueKey(1)),
    );
    await tester.ensureVisible(menuItem.last);
    await tester.tap(menuItem.last);

    expect(selected, equals(1));
  });
}
