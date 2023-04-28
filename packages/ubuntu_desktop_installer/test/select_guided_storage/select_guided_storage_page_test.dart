import 'package:dartx/dartx.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/pages/filesystem/select_guided_storage/select_guided_storage_model.dart';
import 'package:ubuntu_desktop_installer/pages/filesystem/select_guided_storage/select_guided_storage_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';

import '../test_utils.dart';
import 'select_guided_storage_model_test.mocks.dart';
import 'select_guided_storage_page_test.mocks.dart';

// ignore_for_file: type=lint

@GenerateMocks([SelectGuidedStorageModel])
void main() {
  final testDisks = <Disk>[
    fakeDisk(path: '/dev/sda', size: 12, model: 'SDA', vendor: 'ATA'),
    fakeDisk(path: '/dev/sdb', size: 23, model: 'SDB', vendor: 'ATA'),
  ];
  final testStorages = testDisks
      .map((disk) =>
          GuidedStorageTargetReformat(diskId: disk.id, capabilities: []))
      .toList();

  SelectGuidedStorageModel buildModel({
    List<Disk>? disks,
    List<GuidedStorageTargetReformat>? storages,
    int? selectedIndex,
    Disk? selectedDisk,
    GuidedStorageTargetReformat? selectedStorage,
    bool? isDone,
  }) {
    final model = MockSelectGuidedStorageModel();
    when(model.storages)
        .thenReturn(storages ?? <GuidedStorageTargetReformat>[]);
    when(model.selectedIndex).thenReturn(selectedIndex ?? 0);
    when(model.selectedDisk).thenReturn(selectedDisk);
    when(model.selectedStorage).thenReturn(selectedStorage);
    when(model.getDisk(any))
        .thenAnswer((i) => disks?.elementAtOrNull(i.positionalArguments.first));
    when(model.getStorage(any)).thenAnswer(
        (i) => storages?.elementAtOrNull(i.positionalArguments.first));
    when(model.isDone).thenReturn(isDone ?? false);
    return model;
  }

  Widget buildPage(SelectGuidedStorageModel model) {
    return ChangeNotifierProvider<SelectGuidedStorageModel>.value(
      value: model,
      child: const SelectGuidedStoragePage(),
    );
  }

  testWidgets('list of guided storages', (tester) async {
    final model = buildModel(storages: testStorages, disks: testDisks);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    await tester.tap(find.byType(MenuButtonBuilder<int>));
    await tester.pumpAndSettle();

    for (final disk in testDisks) {
      expect(
        find.descendant(
          of: find.byType(MenuItemButton),
          matching: find.textContaining(disk.sysname),
        ),
        findsOneWidget,
      );
    }
  });

  testWidgets('select a guided storage', (tester) async {
    final model = buildModel(storages: testStorages, disks: testDisks);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    await tester.tap(find.byType(MenuButtonBuilder<int>));
    await tester.pumpAndSettle();
    await tester.pump();

    final dropdownItem = find.descendant(
      of: find.byType(MenuItemButton),
      matching: find.byKey(ValueKey(1)),
    );
    await tester.ensureVisible(dropdownItem.last);
    await tester.tap(dropdownItem.last);
    verify(model.selectStorage(1)).called(1);
  });

  testWidgets('selected guided storage', (tester) async {
    final selectedDisk = testDisks.last;
    final selectedStorage = testStorages.last;
    final model = buildModel(
      disks: testDisks,
      storages: testStorages,
      selectedDisk: selectedDisk,
      selectedStorage: selectedStorage,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));
    expect(find.text(selectedDisk.sysname), findsOneWidget);
    expect(find.text(filesize(selectedDisk.size)), findsOneWidget);
  });

  testWidgets('loads and saves guided storages', (tester) async {
    final model = buildModel(
        storages: testStorages,
        disks: testDisks,
        selectedStorage: testStorages.first);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    verify(model.loadGuidedStorage()).called(1);
    verifyNever(model.saveGuidedStorage());

    final continueButton =
        find.widgetWithText(FilledButton, tester.ulang.nextLabel);
    expect(continueButton, findsOneWidget);

    await tester.tap(continueButton);
    verify(model.saveGuidedStorage()).called(1);
  });

  testWidgets('creates a model', (tester) async {
    final service = MockDiskStorageService();
    when(service.getStorage()).thenAnswer((_) async => []);
    when(service.useEncryption).thenReturn(false);
    when(service.getGuidedStorage())
        .thenAnswer((_) async => fakeGuidedStorageResponse());
    registerMockService<DiskStorageService>(service);

    await tester.pumpWidget(tester.buildApp(SelectGuidedStoragePage.create));

    final page = find.byType(SelectGuidedStoragePage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model = Provider.of<SelectGuidedStorageModel>(context, listen: false);
    expect(model, isNotNull);
  });
}
