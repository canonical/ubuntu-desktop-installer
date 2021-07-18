import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/disk_storage_model.dart';
import 'package:ubuntu_desktop_installer/l10n/app_localizations.dart';
import 'package:ubuntu_desktop_installer/pages/write_changes_to_disk_page.dart';
import 'package:ubuntu_desktop_installer/routes.dart';

import 'write_changes_to_disk_page_test.mocks.dart';

class HomePage extends StatelessWidget {
  static const targetRouteName = 'writeChangesToDisk';

  final List<Map<String, dynamic>> storageConfig;

  const HomePage({Key? key, this.storageConfig = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(targetRouteName),
      onPressed: () => Navigator.pushNamed(context, targetRouteName),
    );
  }
}

@GenerateMocks([DiskStorageModel, SubiquityClient])
void main() {
  late MaterialApp app;
  late MockSubiquityClient client;
  late MockDiskStorageModel model;

  final storageConfig1 = [
    {
      "ptable": "gpt",
      "serial": "QEMU_HARDDISK_QM00001",
      "path": "/dev/sda",
      "wipe": "superblock-recursive",
      "preserve": false,
      "name": "",
      "grub_device": false,
      "type": "disk",
      "id": "disk-sda"
    },
    {
      "device": "disk-sda",
      "size": 536870912,
      "wipe": "superblock",
      "flag": "boot",
      "number": 1,
      "preserve": false,
      "grub_device": true,
      "type": "partition",
      "id": "partition-0"
    },
    {
      "fstype": "fat32",
      "volume": "partition-0",
      "preserve": false,
      "type": "format",
      "id": "format-0"
    },
    {
      "device": "disk-sda",
      "size": 10198450176,
      "wipe": "superblock",
      "flag": "",
      "number": 2,
      "preserve": false,
      "type": "partition",
      "id": "partition-1"
    },
    {
      "fstype": "ext4",
      "volume": "partition-1",
      "preserve": false,
      "type": "format",
      "id": "format-1"
    },
    {"path": "/", "device": "format-1", "type": "mount", "id": "mount-1"},
    {
      "path": "/boot/efi",
      "device": "format-0",
      "type": "mount",
      "id": "mount-0"
    }
  ];

  setUpAll(() async {
    await setupAppLocalizations();
  });

  Future<void> setUpApp(
      WidgetTester tester, List<Map<String, dynamic>> storageConfig) async {
    app = MaterialApp(
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: Locale('en'),
      home: HomePage(),
      routes: {
        HomePage.targetRouteName: (context) => WriteChangesToDiskPage(),
        Routes.chooseYourLook: (context) => Container(),
      },
    );
    client = MockSubiquityClient();
    model = MockDiskStorageModel();
    when(model.storageConfig).thenReturn(storageConfig1);
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          Provider<SubiquityClient>.value(value: client),
          ChangeNotifierProvider<DiskStorageModel>.value(value: model),
        ],
        child: app,
      ),
    );
    await tester.tap(find.widgetWithText(TextButton, HomePage.targetRouteName));
    await tester.pumpAndSettle();
    expect(find.byType(WriteChangesToDiskPage), findsOneWidget);
  }

  testWidgets('load page with storage config', (tester) async {
    await setUpApp(tester, storageConfig1);
    expect(find.text('QEMU_HARDDISK_QM00001 (/dev/sda)'), findsOneWidget);
    expect(
        find.text(
            'partition #1 of QEMU_HARDDISK_QM00001 (/dev/sda) as fat32 used for /boot/efi'),
        findsOneWidget);
    expect(
        find.text(
            'partition #2 of QEMU_HARDDISK_QM00001 (/dev/sda) as ext4 used for /'),
        findsOneWidget);
  });

  testWidgets('continue sets storage and confirms', (tester) async {
    await setUpApp(tester, storageConfig1);
    await tester.tap(find.widgetWithText(OutlinedButton, 'Continue'));
    verify(client.setStorage(storageConfig1));
    verify(client.confirm('/dev/tty1'));
  });
}
