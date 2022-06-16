import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/pages/select_guided_storage/select_guided_storage_model.dart';
import 'package:ubuntu_desktop_installer/pages/select_guided_storage/select_guided_storage_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';

import '../test_utils.dart';
import 'select_guided_storage_model_test.mocks.dart';
import 'select_guided_storage_page_test.mocks.dart';

// ignore_for_file: type=lint

@GenerateMocks([SelectGuidedStorageModel])
void main() {
  final testStorages = <Disk>[
    testDisk(path: '/dev/sda', size: 12, model: 'SDA', vendor: 'ATA'),
    testDisk(path: '/dev/sdb', size: 23, model: 'SDB', vendor: 'ATA'),
  ];

  SelectGuidedStorageModel buildModel({
    List<Disk>? storages,
    int? selectedIndex,
    Disk? selectedStorage,
  }) {
    final model = MockSelectGuidedStorageModel();
    when(model.storages).thenReturn(storages ?? <Disk>[]);
    when(model.selectedIndex).thenReturn(selectedIndex ?? 0);
    when(model.selectedStorage).thenReturn(selectedStorage);
    return model;
  }

  Widget buildPage(SelectGuidedStorageModel model) {
    return ChangeNotifierProvider<SelectGuidedStorageModel>.value(
      value: model,
      child: const SelectGuidedStoragePage(),
    );
  }

  testWidgets('list of guided storages', (tester) async {
    final model = buildModel(storages: testStorages);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    await tester.tap(find.byType(DropdownButton<int>));
    await tester.pumpAndSettle();

    for (final storage in testStorages) {
      expect(
        find.descendant(
          of: find.byType(DropdownButton<int>),
          matching: find.textContaining(storage.path!),
        ),
        findsOneWidget,
      );
    }
  });

  testWidgets('select a guided storage', (tester) async {
    final model = buildModel(storages: testStorages);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    await tester.tap(find.byType(DropdownButton<int>));
    await tester.pumpAndSettle();
    await tester.pump();

    final dropdownItem = find.descendant(
      of: find.byType(DropdownMenuItem<int>),
      matching: find.byKey(ValueKey(1)),
    );
    await tester.ensureVisible(dropdownItem.last);
    await tester.tap(dropdownItem.last);
    verify(model.selectStorage(1)).called(1);
  });

  testWidgets('selected guided storage', (tester) async {
    final selectedStorage = testStorages.last;
    final model = buildModel(
      storages: testStorages,
      selectedStorage: selectedStorage,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));
    expect(find.text(selectedStorage.path!), findsOneWidget);
    expect(find.text(filesize(selectedStorage.size)), findsOneWidget);
  });

  testWidgets('loads and saves guided storages', (tester) async {
    final model = buildModel(storages: testStorages);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    verify(model.loadGuidedStorage()).called(1);
    verifyNever(model.saveGuidedStorage());

    final installButton = find.widgetWithText(
        OutlinedButton, tester.lang.selectGuidedStorageInstallNow);
    expect(installButton, findsOneWidget);

    await tester.tap(installButton);
    verify(model.saveGuidedStorage()).called(1);
  });

  testWidgets('creates a model', (tester) async {
    final service = MockDiskStorageService();
    when(service.getGuidedStorage()).thenAnswer((_) async => testStorages);
    registerMockService<DiskStorageService>(service);

    await tester.pumpWidget(tester.buildApp(SelectGuidedStoragePage.create));

    final page = find.byType(SelectGuidedStoragePage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model = Provider.of<SelectGuidedStorageModel>(context, listen: false);
    expect(model, isNotNull);
  });
}
