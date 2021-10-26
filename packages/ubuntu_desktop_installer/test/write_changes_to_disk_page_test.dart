import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages/write_changes_to_disk/write_changes_to_disk_model.dart';
import 'package:ubuntu_desktop_installer/pages/write_changes_to_disk/write_changes_to_disk_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/mocks.dart';
import 'package:ubuntu_wizard/widgets.dart';

import 'widget_tester_extensions.dart';
import 'write_changes_to_disk_model_test.mocks.dart';
import 'write_changes_to_disk_page_test.mocks.dart';

const testDisks = <Disk>[
  Disk(
    path: '/dev/sda',
    size: 12,
    preserve: false,
    partitions: [
      Partition(
        number: 1,
        size: 11,
        mount: '/mnt/1',
        format: 'ext',
        preserve: false,
      ),
      Partition(
        number: 2,
        size: 22,
        mount: '/mnt/2',
        format: 'ext2',
        preserve: false,
      )
    ],
  ),
  Disk(
    path: '/dev/sdb',
    size: 23,
    preserve: false,
    partitions: [
      Partition(
        number: 3,
        size: 33,
        mount: '/mnt/3',
        format: 'ext3',
        preserve: false,
      ),
      Partition(
        number: 4,
        size: 44,
        format: 'ext4',
        preserve: false,
      )
    ],
  ),
];

WriteChangesToDiskModel buildModel({List<Disk>? disks}) {
  final model = MockWriteChangesToDiskModel();
  when(model.disks).thenReturn(disks ?? <Disk>[]);
  when(model.partitions(testDisks.first))
      .thenReturn(testDisks.first.partitions ?? []);
  when(model.partitions(testDisks.last))
      .thenReturn(testDisks.last.partitions ?? []);
  return model;
}

@GenerateMocks([UdevService, WriteChangesToDiskModel])
void main() {
  Widget buildPage(WriteChangesToDiskModel model) {
    final udev = MockUdevService();
    when(udev.modelName('sda')).thenReturn('SDA');
    when(udev.modelName('sdb')).thenReturn('SDB');
    when(udev.vendorName('sda')).thenReturn('ATA');
    when(udev.vendorName('sdb')).thenReturn('ATA');

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WriteChangesToDiskModel>.value(value: model),
        Provider<UdevService>.value(value: udev),
      ],
      child: const WriteChangesToDiskPage(),
    );
  }

  Widget buildApp(WidgetTester tester, WriteChangesToDiskModel model) {
    tester.binding.window.devicePixelRatioTestValue = 1;
    tester.binding.window.physicalSizeTestValue = Size(960, 680);
    return MaterialApp(
      localizationsDelegates: localizationsDelegates,
      home: Wizard(
        routes: {'/': (_) => buildPage(model)},
        onNext: (settings) => '/',
      ),
    );
  }

  testWidgets('list of disks and partitions', (tester) async {
    final model = buildModel(disks: testDisks);
    await tester.pumpWidget(buildApp(tester, model));

    for (final disk in testDisks) {
      expect(find.byKey(ValueKey(disk)), findsOneWidget);

      for (final partition in disk.partitions!) {
        expect(find.byKey(ValueKey(partition)), findsOneWidget);
      }
    }
  });

  testWidgets('starts installation', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(buildApp(tester, model));

    final continueButton = find.widgetWithText(
      ElevatedButton,
      tester.lang.startInstallingButtonText,
    );
    expect(continueButton, findsOneWidget);

    await tester.tap(continueButton);
    verify(model.startInstallation()).called(1);
  });

  testWidgets('creates a model', (tester) async {
    final client = MockSubiquityClient();
    final service = MockDiskStorageService();
    when(service.getStorage()).thenAnswer((_) async => testDisks);

    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: localizationsDelegates,
      home: MultiProvider(
        providers: [
          Provider<SubiquityClient>.value(value: client),
          Provider<DiskStorageService>.value(
            value: service,
          ),
        ],
        child: Wizard(
          routes: {'/': WriteChangesToDiskPage.create},
          onNext: (settings) => '/',
        ),
      ),
    ));

    final page = find.byType(WriteChangesToDiskPage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model = Provider.of<WriteChangesToDiskModel>(context, listen: false);
    expect(model, isNotNull);
  });
}
