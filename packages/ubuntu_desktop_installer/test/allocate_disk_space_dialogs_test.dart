import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages/allocate_disk_space/allocate_disk_space_dialogs.dart';
import 'package:ubuntu_desktop_installer/pages/allocate_disk_space/allocate_disk_space_model.dart';
import 'package:ubuntu_desktop_installer/pages/allocate_disk_space/allocate_disk_space_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';

import 'allocate_disk_space_page_test.dart';
import 'allocate_disk_space_page_test.mocks.dart';
import 'widget_tester_extensions.dart';

void main() {
  setUpAll(() => LangTester.context = AlertDialog);

  testWidgets('create partition', (tester) async {
    tester.binding.window.devicePixelRatioTestValue = 1;
    tester.binding.window.physicalSizeTestValue = Size(960, 680);

    final testDisk = Disk(freeForPartitions: 1000000);
    final model = buildModel(selectedDisk: testDisk);

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AllocateDiskSpaceModel>.value(value: model),
          Provider<UdevService>(create: (_) => MockUdevService()),
        ],
        child: MaterialApp(
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: localizationsDelegates,
          home: Wizard(
            routes: {'/': (_) => AllocateDiskSpacePage()},
          ),
        ),
      ),
    );

    final result = showCreatePartitionDialog(
        tester.element(find.byType(AllocateDiskSpacePage)), testDisk);
    await tester.pumpAndSettle();

    await tester.tap(find.byTypeOf<DropdownButton<DataUnit>>());
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(ValueKey(DataUnit.bytes)).last);
    await tester.pump();

    await tester.enterText(find.byType(SpinBox), '123');
    await tester.pump();

    await tester.tap(find.byTypeOf<DropdownButton<PartitionFormat>>());
    await tester.pumpAndSettle();

    await tester.tap(find.byWidgetPredicate((widget) {
      if (widget is! DropdownMenuItem<PartitionFormat>) return false;
      return widget.value == PartitionFormat.btrfs;
    }).last);
    await tester.pumpAndSettle();

    await tester.enterText(find.byTypeOf<Autocomplete<String>>(), '/tst');
    await tester.pump();

    await tester
        .tap(find.widgetWithText(OutlinedButton, tester.lang.okButtonText));
    await result;

    verify(model.addPartition(
      testDisk,
      size: 123,
      format: PartitionFormat.btrfs,
      mount: '/tst',
    )).called(1);
  });

  testWidgets('edit partition', (tester) async {
    tester.binding.window.devicePixelRatioTestValue = 1;
    tester.binding.window.physicalSizeTestValue = Size(960, 680);

    final testDisk = Disk(freeForPartitions: 1000000, partitions: [
      Partition(
        number: 1,
        format: 'ext4',
        wipe: true,
        mount: '/tst',
        preserve: true,
      )
    ]);
    final model = buildModel(selectedDisk: testDisk);

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AllocateDiskSpaceModel>.value(value: model),
          Provider<UdevService>(create: (_) => MockUdevService()),
        ],
        child: MaterialApp(
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: localizationsDelegates,
          home: Wizard(
            routes: {'/': (_) => AllocateDiskSpacePage()},
          ),
        ),
      ),
    );

    final result = showEditPartitionDialog(
        tester.element(find.byType(AllocateDiskSpacePage)),
        testDisk,
        testDisk.partitions!.first);
    await tester.pumpAndSettle();

    await tester.tap(find.byTypeOf<DropdownButton<PartitionFormat>>());
    await tester.pumpAndSettle();

    await tester.tap(find.byWidgetPredicate((widget) {
      if (widget is! DropdownMenuItem<PartitionFormat>) return false;
      return widget.value == PartitionFormat.btrfs;
    }).last);
    await tester.pumpAndSettle();

    await tester.tap(find.byType(Checkbox));
    await tester.pump();

    await tester.enterText(find.byTypeOf<Autocomplete<String>>(), '/tst');
    await tester.pump();

    await tester
        .tap(find.widgetWithText(OutlinedButton, tester.lang.okButtonText));
    await result;

    verify(model.editPartition(
      testDisk,
      testDisk.partitions!.first,
      format: PartitionFormat.btrfs,
      wipe: false,
      mount: '/tst',
    )).called(1);
  });
}
