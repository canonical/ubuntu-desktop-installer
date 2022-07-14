import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages/install_alongside/storage_button.dart';
import 'package:ubuntu_desktop_installer/pages/install_alongside/storage_split_view.dart';
import 'package:ubuntu_desktop_installer/widgets/storage_size_box.dart';
import 'package:ubuntu_wizard/utils.dart';

import '../test_utils.dart';

void main() {
  setUpAll(() => UbuntuTester.context = AlertDialog);

  testWidgets('resize by drag', (tester) async {
    int? size;

    await tester.pumpWidget(tester.buildApp(
      (_) => StorageSplitView(
        currentSize: 50,
        minimumSize: 20,
        maximumSize: 75,
        totalSize: 100,
        partition: const Partition(),
        existingOS: const OsProber(long: 'Windows', label: '', type: ''),
        productInfo: ProductInfo(name: 'Ubuntu', version: '22.10'),
        onResize: (v) => size = v,
      ),
    ));
    await tester.pumpAndSettle();

    expect(size, isNull);

    final indicator = find.ancestor(
      of: find.byKey(const Key('indicator')),
      matching: find.byType(Container),
    );
    expect(indicator, findsOneWidget);

    await tester.drag(indicator, const Offset(100, 0));
    expect(size, greaterThan(50));

    await tester.drag(indicator, const Offset(-200, 0));
    expect(size, lessThan(50));
  });

  testWidgets('resize existing partition via dialog', (tester) async {
    int? size;

    await tester.pumpWidget(tester.buildApp(
      (_) => StorageSplitView(
        currentSize: toBytes(50, DataUnit.megabytes),
        minimumSize: toBytes(20, DataUnit.megabytes),
        maximumSize: toBytes(75, DataUnit.megabytes),
        totalSize: toBytes(100, DataUnit.megabytes),
        partition: const Partition(),
        existingOS: const OsProber(long: 'Windows', label: '', type: ''),
        productInfo: ProductInfo(name: 'Ubuntu', version: '22.10'),
        onResize: (v) => size = v,
      ),
    ));
    await tester.pumpAndSettle();

    final windows = find.ancestor(
        of: find.text('Windows'), matching: find.byType(StorageButton));
    expect(windows, findsOneWidget);

    await tester.tap(windows);
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(StorageSizeBox), '25');
    await tester.pump();

    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump();

    await tester.pumpAndSettle();

    expect(size, equals(toBytes(25, DataUnit.megabytes)));
  });

  testWidgets('allocate installation space via dialog', (tester) async {
    int? size;

    await tester.pumpWidget(tester.buildApp(
      (_) => StorageSplitView(
        currentSize: toBytes(50, DataUnit.megabytes),
        minimumSize: toBytes(20, DataUnit.megabytes),
        maximumSize: toBytes(75, DataUnit.megabytes),
        totalSize: toBytes(100, DataUnit.megabytes),
        partition: const Partition(),
        existingOS: const OsProber(long: 'Windows', label: '', type: ''),
        productInfo: ProductInfo(name: 'Ubuntu'),
        onResize: (v) => size = v,
      ),
    ));
    await tester.pumpAndSettle();

    final windows = find.ancestor(
        of: find.text('Ubuntu'), matching: find.byType(StorageButton));
    expect(windows, findsOneWidget);

    await tester.tap(windows);
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(StorageSizeBox), '25');
    await tester.pump();

    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump();

    await tester.pumpAndSettle();

    expect(size, equals(toBytes(75, DataUnit.megabytes)));
  });
}
