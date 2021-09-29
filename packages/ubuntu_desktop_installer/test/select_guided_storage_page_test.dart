import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages/select_guided_storage/select_guided_storage_model.dart';
import 'package:ubuntu_desktop_installer/pages/select_guided_storage/select_guided_storage_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';

import 'select_guided_storage_model_test.mocks.dart';
import 'select_guided_storage_page_test.mocks.dart';
import 'widget_tester_extensions.dart';

@GenerateMocks([SelectGuidedStorageModel])
void main() {
  const testStorages = <Disk>[
    Disk(id: 'a', size: 12, label: 'A'),
    Disk(id: 'b', size: 23, label: 'B'),
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
      child: SelectGuidedStoragePage(),
    );
  }

  Widget buildApp(WidgetTester tester, SelectGuidedStorageModel model) {
    return MaterialApp(
      localizationsDelegates: localizationsDelegates,
      home: Wizard(
        routes: {'/': (_) => buildPage(model)},
        onNext: (settings) => '/',
      ),
    );
  }

  testWidgets('list of guided storages', (tester) async {
    final model = buildModel(storages: testStorages);
    await tester.pumpWidget(buildApp(tester, model));

    await tester.tap(find.byTypeOf<DropdownButton<int>>());
    await tester.pumpAndSettle();

    for (final storage in testStorages) {
      expect(
        find.descendant(
          of: find.byTypeOf<DropdownButton<int>>(),
          matching: find.textContaining(storage.id!),
        ),
        findsOneWidget,
      );
    }
  });

  testWidgets('select a guided storage', (tester) async {
    final model = buildModel(storages: testStorages);
    await tester.pumpWidget(buildApp(tester, model));

    await tester.tap(find.byTypeOf<DropdownButton<int>>());
    await tester.pumpAndSettle();
    await tester.pump();

    final dropdownItem = find.descendant(
      of: find.byTypeOf<DropdownMenuItem<int>>(),
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
    await tester.pumpWidget(buildApp(tester, model));
    // in the dropdown and on the page
    expect(find.text(selectedStorage.id!), findsNWidgets(2));
    expect(find.text(filesize(selectedStorage.size)), findsOneWidget);
  });

  testWidgets('loads and saves guided storages', (tester) async {
    final model = buildModel(storages: testStorages);
    await tester.pumpWidget(buildApp(tester, model));

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

    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: localizationsDelegates,
      home: Provider<DiskStorageService>.value(
        value: service,
        child: Wizard(
          routes: {'/': SelectGuidedStoragePage.create},
          onNext: (settings) => '/',
        ),
      ),
    ));

    final page = find.byType(SelectGuidedStoragePage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model = Provider.of<SelectGuidedStorageModel>(context, listen: false);
    expect(model, isNotNull);
  });
}
