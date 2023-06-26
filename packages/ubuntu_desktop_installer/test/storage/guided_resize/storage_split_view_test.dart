import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:split_view/split_view.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages/storage/guided_resize/storage_button.dart';
import 'package:ubuntu_desktop_installer/pages/storage/guided_resize/storage_split_view.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_desktop_installer/widgets/storage_size_box.dart';
import 'package:ubuntu_utils/ubuntu_utils.dart';

import '../../test_utils.dart';

void main() {
  setUpAll(() => InstallerTester.context = AlertDialog);

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

  testWidgets('rebuild on storage change', (tester) async {
    int? size;

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: localizationsDelegates,
        home: Scaffold(
          body: StorageSplitView(
            currentSize: 55,
            minimumSize: 20,
            maximumSize: 75,
            totalSize: 100,
            partition: const Partition(number: 1),
            existingOS: const OsProber(long: 'Windows', label: '', type: ''),
            productInfo: ProductInfo(name: 'Ubuntu'),
            onResize: (v) => size = v,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final controller1 =
        tester.widget<SplitView>(find.byType(SplitView)).controller;
    expect(controller1, isNotNull);
    expect(
      controller1!.weights,
      orderedEquals([moreOrLessEquals(55 / 100), moreOrLessEquals(45 / 100)]),
    );

    final indicator = find.ancestor(
      of: find.byKey(const Key('indicator')),
      matching: find.byType(Container),
    );
    expect(indicator, findsOneWidget);

    final windowWidth = tester.view.physicalSize.width;
    await tester.drag(indicator, Offset(windowWidth, 0));
    expect(size, 75);

    await tester.drag(indicator, Offset(-windowWidth, 0));
    expect(size, 20);

    // rebuild with different size and limits
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: localizationsDelegates,
        home: Scaffold(
          body: StorageSplitView(
            currentSize: 35,
            minimumSize: 30,
            maximumSize: 50,
            totalSize: 60,
            partition: const Partition(number: 2),
            existingOS: const OsProber(long: 'Windows', label: '', type: ''),
            productInfo: ProductInfo(name: 'Ubuntu'),
            onResize: (v) => size = v,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final controller2 =
        tester.widget<SplitView>(find.byType(SplitView)).controller;
    expect(controller2, isNotNull);
    expect(
      controller2!.weights,
      orderedEquals([moreOrLessEquals(35 / 60), moreOrLessEquals(25 / 60)]),
    );

    await tester.drag(indicator, Offset(windowWidth, 0));
    expect(size, 50);

    await tester.drag(indicator, Offset(-windowWidth, 0));
    expect(size, 30);
  });
}
