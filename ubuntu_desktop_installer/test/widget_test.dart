// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

@Skip('https://github.com/canonical/ubuntu-desktop-installer/issues/4')

import 'package:flutter_test/flutter_test.dart';
import 'package:subiquity_client/subiquity_client.dart';

import 'package:ubuntu_desktop_installer/main.dart';
import 'package:ubuntu_desktop_installer/welcomepage.dart';

void main() {
  testWidgets('Ubuntu Desktop installer smoke tests',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    TestWidgetsFlutterBinding.ensureInitialized();
    final client = SubiquityClient();
    await client.fetchLanguageList('assets/languagelist');
    await tester.pumpWidget(UbuntuDesktopInstallerApp(client: client));
    await tester.pumpAndSettle();
    expect(find.byType(WelcomePage), findsOneWidget);
  });
}
