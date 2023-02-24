import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/pages/allocate_disk_space/allocate_disk_space_dialogs.dart';
import 'package:ubuntu_desktop_installer/pages/allocate_disk_space/allocate_disk_space_model.dart';
import 'package:ubuntu_desktop_installer/pages/allocate_disk_space/allocate_disk_space_page.dart';
import 'package:ubuntu_desktop_installer/pages/allocate_disk_space/storage_types.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../test_utils.dart';
import 'allocate_disk_space_page_test.dart';
import 'allocate_disk_space_page_test.mocks.dart';

// ignore_for_file: type=lint

void main() {
  setUpAll(() => UbuntuTester.context = AlertDialog);

  testWidgets('create partition', (tester) async {
    final disk = testDisk();
    final gap = Gap(offset: 0, size: 1000000, usable: GapUsable.YES);
    final model = buildModel(selectedDisk: disk);

    registerMockService<UdevService>(MockUdevService());

    await tester.pumpWidget(
      ChangeNotifierProvider<AllocateDiskSpaceModel>.value(
        value: model,
        child: tester.buildApp((_) => AllocateDiskSpacePage()),
      ),
    );

    final result = showCreatePartitionDialog(
        tester.element(find.byType(AllocateDiskSpacePage)), disk, gap);
    await tester.pumpAndSettle();

    await tester.tap(find.byType(DropdownButton<DataUnit>));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(ValueKey(DataUnit.bytes)).last);
    await tester.pump();

    await tester.enterText(find.byType(SpinBox), '123');
    await tester.pump();

    await tester.tap(find.byType(DropdownButton<PartitionFormat?>));
    await tester.pumpAndSettle();

    await tester.tap(find.byWidgetPredicate((widget) {
      if (widget is! DropdownMenuItem<PartitionFormat?>) return false;
      return widget.value == PartitionFormat.btrfs;
    }).last);
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(Autocomplete<String>), '/tst');
    await tester.pump();

    await tester
        .tap(find.widgetWithText(FilledButton, tester.lang.okButtonText));
    await result;

    verify(model.addPartition(
      disk,
      gap,
      size: 123,
      format: PartitionFormat.btrfs,
      mount: '/tst',
    )).called(1);
  });

  testWidgets('edit partition', (tester) async {
    tester.binding.window.devicePixelRatioTestValue = 1;
    tester.binding.window.physicalSizeTestValue = Size(960, 680);

    final disk = testDisk(partitions: [
      Partition(
        number: 1,
        size: 1234567,
        format: 'ext4',
        wipe: 'superblock',
        mount: '/tst',
        preserve: true,
      ),
      Gap(offset: 123, size: 1000000, usable: GapUsable.YES),
    ]);
    final model = buildModel(selectedDisk: disk);

    registerMockService<UdevService>(MockUdevService());

    await tester.pumpWidget(
      ChangeNotifierProvider<AllocateDiskSpaceModel>.value(
        value: model,
        child: tester.buildApp((_) => AllocateDiskSpacePage()),
      ),
    );

    final result = showEditPartitionDialog(
      tester.element(find.byType(AllocateDiskSpacePage)),
      disk,
      disk.partitions.whereType<Partition>().first,
      disk.partitions.whereType<Gap>().first,
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byType(DropdownButton<DataUnit>));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(ValueKey(DataUnit.bytes)).last);
    await tester.pump();

    await tester.enterText(find.byType(SpinBox), '123');
    await tester.pump();

    await tester.tap(find.byType(DropdownButton<PartitionFormat?>));
    await tester.pumpAndSettle();

    await tester.tap(find.byWidgetPredicate((widget) {
      if (widget is! DropdownMenuItem<PartitionFormat?>) return false;
      return widget.value == PartitionFormat.btrfs;
    }).last);
    await tester.pumpAndSettle();

    await tester.tap(find.byType(YaruCheckbox));
    await tester.pump();

    await tester.enterText(find.byType(Autocomplete<String>), '/tst');
    await tester.pump();

    await tester
        .tap(find.widgetWithText(FilledButton, tester.lang.okButtonText));
    await result;

    verify(model.editPartition(
      disk,
      disk.partitions.whereType<Partition>().first,
      size: 123,
      format: PartitionFormat.btrfs,
      wipe: false,
      mount: '/tst',
    )).called(1);
  });
}
