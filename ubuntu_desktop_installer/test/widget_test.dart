// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/l10n/app_localizations.dart';

import 'package:ubuntu_desktop_installer/main.dart';
import 'package:ubuntu_desktop_installer/welcomepage.dart';

void main() {
  testWidgets('Ubuntu Desktop installer smoke tests', (tester) async {
    // Build our app and trigger a frame.
    TestWidgetsFlutterBinding.ensureInitialized();
    await setupAppLocalizations();

    final client = SubiquityClient();
    await tester.pumpWidget(UbuntuDesktopInstallerApp(client: client));
    await tester.pumpAndSettle();
    expect(find.byType(WelcomePage), findsOneWidget);
  });
}
