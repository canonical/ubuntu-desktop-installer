import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/pages/filesystem/allocate_disk_space/allocate_disk_space_dialogs.dart';
import 'package:ubuntu_desktop_installer/pages/filesystem/allocate_disk_space/allocate_disk_space_model.dart';
import 'package:ubuntu_desktop_installer/pages/filesystem/allocate_disk_space/allocate_disk_space_page.dart';
import 'package:ubuntu_desktop_installer/pages/filesystem/allocate_disk_space/storage_types.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../test_utils.dart';
import 'allocate_disk_space_page_test.dart';
import 'allocate_disk_space_page_test.mocks.dart';

// ignore_for_file: type=lint

void main() {
  setUpAll(() => UbuntuTester.context = AlertDialog);

  testWidgets('create partition', (tester) async {
    final disk = fakeDisk();
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

    await tester.tap(find.byType(MenuButtonBuilder<DataUnit>));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(ValueKey(DataUnit.bytes)).last);
    await tester.pump();

    await tester.enterText(find.byType(SpinBox), '123');
    await tester.pump();

    await tester.tap(find.byType(MenuButtonBuilder<PartitionFormat?>));
    await tester.pumpAndSettle();

    await tester.tap(find.menuItem(PartitionFormat.btrfs.name!));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(YaruAutocomplete<String>), '/tst');
    await tester.pump();

    await tester.tap(find.button(tester.lang.okButtonText));
    await result;

    verify(model.addPartition(
      disk,
      gap,
      size: 123,
      format: PartitionFormat.btrfs,
      mount: '/tst',
    )).called(1);
  });

  testWidgets('create partition with invalid mount point', (tester) async {
    final disk = fakeDisk();
    final gap = Gap(offset: 0, size: 1000000, usable: GapUsable.YES);
    final model = buildModel(selectedDisk: disk);

    registerMockService<UdevService>(MockUdevService());

    await tester.pumpWidget(
      ChangeNotifierProvider<AllocateDiskSpaceModel>.value(
        value: model,
        child: tester.buildApp((_) => AllocateDiskSpacePage()),
      ),
    );

    showCreatePartitionDialog(
        tester.element(find.byType(AllocateDiskSpacePage)), disk, gap);
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(YaruAutocomplete<String>), '/tst foo');
    await tester.pump();

    expect(find.button(tester.lang.okButtonText), isDisabled);
  });

  testWidgets('edit partition', (tester) async {
    tester.binding.window.devicePixelRatioTestValue = 1;
    tester.binding.window.physicalSizeTestValue = Size(960, 680);

    final disk = fakeDisk(partitions: [
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
      null,
      disk.partitions.whereType<Gap>().first,
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byType(MenuButtonBuilder<DataUnit>));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(ValueKey(DataUnit.bytes)).last);
    await tester.pump();

    await tester.enterText(find.byType(SpinBox), '123');
    await tester.pump();

    await tester.tap(find.byType(MenuButtonBuilder<PartitionFormat?>));
    await tester.pumpAndSettle();

    await tester.tap(find.menuItem(PartitionFormat.btrfs.name!));
    await tester.pumpAndSettle();

    await tester.tap(find.byType(YaruCheckbox));
    await tester.pump();

    await tester.enterText(find.byType(YaruAutocomplete<String>), '/tst');
    await tester.pump();

    await tester.tap(find.button(tester.lang.okButtonText));
    await result;

    verify(model.editPartition(
      disk,
      disk.partitions.whereType<Partition>().first,
      size: 123,
      format: PartitionFormat.btrfs,
      wipe: true,
      mount: '/tst',
    )).called(1);
  });

  testWidgets('edit partition with invalid mount point', (tester) async {
    tester.binding.window.devicePixelRatioTestValue = 1;
    tester.binding.window.physicalSizeTestValue = Size(960, 680);

    final disk = fakeDisk(partitions: [
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

    showEditPartitionDialog(
      tester.element(find.byType(AllocateDiskSpacePage)),
      disk,
      disk.partitions.whereType<Partition>().first,
      null,
      disk.partitions.whereType<Gap>().first,
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(YaruAutocomplete<String>), 'tst');
    await tester.pump();

    expect(find.button(tester.lang.okButtonText), isDisabled);
  });
}
