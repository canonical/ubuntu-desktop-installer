import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/pages/storage/guided_resize/storage_icon.dart';
import 'package:ubuntu_test/ubuntu_test.dart';

void main() {
  testWidgets('Windows 10', (tester) async {
    await tester.pumpWidget(const StorageIcon(name: 'Windows 10'));
    expect(find.svg('windows.svg'), findsOneWidget);
  });

  testWidgets('Windows 11', (tester) async {
    await tester.pumpWidget(const StorageIcon(name: 'Windows 11'));
    expect(find.svg('windows.svg'), findsOneWidget);
  });

  testWidgets('Windows Boot Manager', (tester) async {
    await tester.pumpWidget(const StorageIcon(name: 'Windows Boot Manager'));
    expect(find.svg('windows.svg'), findsOneWidget);
  });

  testWidgets('Ubuntu 22.04 LTS', (tester) async {
    await tester.pumpWidget(const StorageIcon(name: 'Ubuntu 22.04 LTS'));
    expect(find.svg('ubuntu.svg'), findsOneWidget);
  });

  testWidgets('Unknown', (tester) async {
    await tester.pumpWidget(const StorageIcon(name: 'Unknown'));
    expect(find.svg('block-device.svg'), findsOneWidget);
  });

  testWidgets('None', (tester) async {
    await tester.pumpWidget(const StorageIcon(name: null));
    expect(find.svg('folder.svg'), findsOneWidget);
  });
}
