import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages/allocate_disk_space/storage_size_box.dart';
import 'package:ubuntu_wizard/utils.dart';

// ignore_for_file: type=lint

void main() {
  testWidgets('enter size', (tester) async {
    int? size;

    await tester.pumpStorageSizeBox(
      StorageSizeBox(
        unit: DataUnit.megabytes,
        size: toBytes(123, DataUnit.megabytes),
        available: toBytes(500, DataUnit.megabytes),
        onSizeChanged: (value) => size = value,
        onUnitSelected: (_) {},
      ),
    );

    await tester.enterText(find.byType(SpinBox), '456');
    await tester.pump();

    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump();

    expect(size, isNotNull);
    expect(fromBytes(size!, DataUnit.megabytes), equals(456));
  });

  testWidgets('select unit', (tester) async {
    DataUnit? unit;

    await tester.pumpStorageSizeBox(
      StorageSizeBox(
        unit: DataUnit.gigabytes,
        size: toBytes(1, DataUnit.gigabytes),
        available: toBytes(5, DataUnit.gigabytes),
        onSizeChanged: (_) {},
        onUnitSelected: (value) => unit = value,
      ),
    );

    await tester.tap(find.byType(DropdownButton<DataUnit>));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(ValueKey(DataUnit.megabytes)).last);
    await tester.pump();

    expect(unit, equals(DataUnit.megabytes));
  });

  group('present size', () {
    final fiveGb = toBytes(5, DataUnit.gigabytes);

    testWidgets('in gigabytes', (tester) async {
      await tester.pumpStorageSizeBox(
        StorageSizeBox(
          unit: DataUnit.gigabytes,
          size: fiveGb,
          available: fiveGb,
          onSizeChanged: (_) {},
          onUnitSelected: (_) {},
        ),
      );
      expect(find.widgetWithText(SpinBox, '5'), findsOneWidget);
    });

    testWidgets('in megabytes', (tester) async {
      await tester.pumpStorageSizeBox(
        StorageSizeBox(
          unit: DataUnit.megabytes,
          size: fiveGb,
          available: fiveGb,
          onSizeChanged: (_) {},
          onUnitSelected: (_) {},
        ),
      );
      expect(
          find.widgetWithText(SpinBox, (5 * 1024).toString()), findsOneWidget);
    });

    testWidgets('in kilobytes', (tester) async {
      await tester.pumpStorageSizeBox(
        StorageSizeBox(
          unit: DataUnit.kilobytes,
          size: fiveGb,
          available: fiveGb,
          onSizeChanged: (_) {},
          onUnitSelected: (_) {},
        ),
      );
      expect(find.widgetWithText(SpinBox, (5 * 1024 * 1024).toString()),
          findsOneWidget);
    });
  });
}

extension StorageSizeBoxTester on WidgetTester {
  Future<void> pumpStorageSizeBox(StorageSizeBox widget) {
    return pumpWidget(
      MaterialApp(
        localizationsDelegates: localizationsDelegates,
        home: Scaffold(body: widget),
      ),
    );
  }
}
