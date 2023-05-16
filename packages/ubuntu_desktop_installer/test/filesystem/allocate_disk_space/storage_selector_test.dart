import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/pages/filesystem/allocate_disk_space/storage_selector.dart';
import 'package:yaru_test/yaru_test.dart';

void main() {
  testWidgets('initial selection', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Center(
          child: StorageSelector(
            title: '',
            storages: [
              for (var i = 0; i < 3; i++)
                fakeDisk(model: 'model$i', vendor: 'vendor$i'),
            ],
            selected: 1,
            onSelected: (_) {},
          ),
        ),
      ),
    ));
    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey(1)), findsOneWidget);
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
                fakeDisk(model: 'model$i', vendor: 'vendor$i'),
            ],
            onSelected: (v) => selected = v,
          ),
        ),
      ),
    ));

    await tester.tap(find.byType(StorageSelector));
    await tester.pumpAndSettle();

    final menuItem = find.descendant(
      of: find.byType(MenuItemButton),
      matching: find.byKey(const ValueKey(1)),
    );
    await tester.ensureVisible(menuItem);
    await tester.tap(menuItem);

    expect(selected, equals(1));
  });

  testWidgets('disabled item', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Center(
          child: StorageSelector(
            title: '',
            storages: [
              for (var i = 0; i < 3; i++)
                fakeDisk(model: 'model$i', vendor: 'vendor$i'),
            ],
            enabled: (disk) => disk.model != 'model1',
            onSelected: (_) {},
          ),
        ),
      ),
    ));

    await tester.tap(find.byType(StorageSelector));
    await tester.pumpAndSettle();

    final menuItem1 = find.ancestor(
      of: find.byKey(const ValueKey(1)),
      matching: find.byType(MenuItemButton),
    );
    expect(menuItem1, isDisabled);

    final menuItem2 = find.ancestor(
      of: find.byKey(const ValueKey(2)),
      matching: find.byType(MenuItemButton),
    );
    expect(menuItem2, isEnabled);
  });
}
