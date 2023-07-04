import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/pages/storage/guided_resize/storage_button.dart';
import 'package:ubuntu_desktop_installer/pages/storage/guided_resize/storage_icon.dart';
import 'package:ubuntu_localizations/ubuntu_localizations.dart';
import 'package:ubuntu_utils/ubuntu_utils.dart';

String assetPath(String assetName) => 'assets/install_alongside/$assetName';

void main() {
  testWidgets('Ubuntu without path', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: GlobalUbuntuLocalizations.delegates,
        home: Scaffold(
          body: StorageButton(
            name: 'Ubuntu 22.04 LTS',
            format: 'ext4',
            size: toBytes(12, DataUnit.gigabytes),
          ),
        ),
      ),
    );

    expect(find.text('Ubuntu 22.04 LTS'), findsOneWidget);
    expect(find.text('ext4'), findsOneWidget);
    expect(find.text('12 GB'), findsOneWidget);

    final icon = find.byType(StorageIcon);
    expect(icon, findsOneWidget);
    expect(tester.widget<StorageIcon>(icon).name, 'Ubuntu 22.04 LTS');
  });

  testWidgets('Windows with path and format', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: GlobalUbuntuLocalizations.delegates,
        home: Scaffold(
          body: StorageButton(
            name: 'Windows 10',
            sysname: 'sda1',
            format: 'ntfs',
            size: toBytes(34, DataUnit.gigabytes),
          ),
        ),
      ),
    );

    expect(find.text('Windows 10'), findsOneWidget);
    expect(find.text('sda1 (ntfs)'), findsOneWidget);
    expect(find.text('34 GB'), findsOneWidget);

    final icon = find.byType(StorageIcon);
    expect(icon, findsOneWidget);
    expect(tester.widget<StorageIcon>(icon).name, 'Windows 10');
  });

  testWidgets('Unknown without path and format', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: GlobalUbuntuLocalizations.delegates,
        home: Scaffold(
          body: StorageButton(
            name: 'Unknown',
            size: toBytes(56, DataUnit.gigabytes),
          ),
        ),
      ),
    );

    expect(find.text('Unknown'), findsOneWidget);
    expect(find.text(''), findsOneWidget);
    expect(find.text('56 GB'), findsOneWidget);

    final icon = find.byType(StorageIcon);
    expect(icon, findsOneWidget);
    expect(tester.widget<StorageIcon>(icon).name, 'Unknown');
  });
}
