import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/pages/storage/manual/manual_storage_dialogs.dart';
import 'package:ubuntu_desktop_installer/pages/storage/manual/manual_storage_model.dart';
import 'package:ubuntu_desktop_installer/pages/storage/manual/manual_storage_page.dart';
import 'package:ubuntu_desktop_installer/pages/storage/manual/storage_types.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/ubuntu_test.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:yaru_test/yaru_test.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'test_manual_storage.dart';

void main() {
  setUpAll(() => InstallerTester.context = AlertDialog);

  testWidgets('create partition', (tester) async {
    final disk = fakeDisk();
    const gap = Gap(offset: 0, size: 1000000, usable: GapUsable.YES);
    final model = buildManualStorageModel(selectedDisk: disk);

    registerMockService<UdevService>(MockUdevService());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [manualStorageModelProvider.overrideWith((_) => model)],
        child: tester.buildApp((_) => const ManualStoragePage()),
      ),
    );

    final result = showCreatePartitionDialog(
        tester.element(find.byType(ManualStoragePage)), disk, gap);
    await tester.pumpAndSettle();

    await tester.tap(find.byType(MenuButtonBuilder<DataUnit>));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey(DataUnit.bytes)).last);
    await tester.pump();

    await tester.enterText(find.byType(SpinBox), '123');
    await tester.pump();

    await tester.tap(find.byType(MenuButtonBuilder<PartitionFormat?>));
    await tester.pumpAndSettle();

    await tester.tap(find.menuItem(PartitionFormat.btrfs.name!));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(YaruAutocomplete<String>), '/tst');
    await tester.pump();

    await tester.tapOk();
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
    const gap = Gap(offset: 0, size: 1000000, usable: GapUsable.YES);
    final model = buildManualStorageModel(selectedDisk: disk);

    registerMockService<UdevService>(MockUdevService());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [manualStorageModelProvider.overrideWith((_) => model)],
        child: tester.buildApp((_) => const ManualStoragePage()),
      ),
    );

    showCreatePartitionDialog(
        tester.element(find.byType(ManualStoragePage)), disk, gap);
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(YaruAutocomplete<String>), '/tst foo');
    await tester.pump();

    expect(find.button(tester.ulang.okLabel), isDisabled);
  });

  testWidgets('edit partition', (tester) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(960, 680);

    final disk = fakeDisk(partitions: [
      const Partition(
        number: 1,
        size: 1234567,
        format: 'ext4',
        wipe: 'superblock',
        mount: '/tst',
        preserve: true,
      ),
      const Gap(offset: 123, size: 1000000, usable: GapUsable.YES),
    ]);
    final model = buildManualStorageModel(selectedDisk: disk);

    registerMockService<UdevService>(MockUdevService());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [manualStorageModelProvider.overrideWith((_) => model)],
        child: tester.buildApp((_) => const ManualStoragePage()),
      ),
    );

    final result = showEditPartitionDialog(
      tester.element(find.byType(ManualStoragePage)),
      disk,
      disk.partitions.whereType<Partition>().first,
      null,
      disk.partitions.whereType<Gap>().first,
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byType(MenuButtonBuilder<DataUnit>));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey(DataUnit.bytes)).last);
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

    await tester.tapOk();
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
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(960, 680);

    final disk = fakeDisk(partitions: [
      const Partition(
        number: 1,
        size: 1234567,
        format: 'ext4',
        wipe: 'superblock',
        mount: '/tst',
        preserve: true,
      ),
      const Gap(offset: 123, size: 1000000, usable: GapUsable.YES),
    ]);
    final model = buildManualStorageModel(selectedDisk: disk);

    registerMockService<UdevService>(MockUdevService());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [manualStorageModelProvider.overrideWith((_) => model)],
        child: tester.buildApp((_) => const ManualStoragePage()),
      ),
    );

    showEditPartitionDialog(
      tester.element(find.byType(ManualStoragePage)),
      disk,
      disk.partitions.whereType<Partition>().first,
      null,
      disk.partitions.whereType<Gap>().first,
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(YaruAutocomplete<String>), 'tst');
    await tester.pump();

    expect(find.button(tester.ulang.okLabel), isDisabled);
  });
}
