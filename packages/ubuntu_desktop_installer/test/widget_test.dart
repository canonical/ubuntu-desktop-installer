// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/app.dart';
import 'package:ubuntu_desktop_installer/app_theme.dart';
import 'package:ubuntu_desktop_installer/keyboard_model.dart';
import 'package:ubuntu_desktop_installer/l10n/app_localizations.dart';
import 'package:ubuntu_desktop_installer/pages/welcome/welcome_page.dart';

import 'gsettings.mocks.dart';

class SubiquityClientMock extends SubiquityClient {
  @override
  Future<KeyboardSetup> keyboard() async {
    return KeyboardSetup(layouts: []);
  }
}

void main() {
  testWidgets('Ubuntu Desktop installer smoke tests', (tester) async {
    // Build our app and trigger a frame.
    TestWidgetsFlutterBinding.ensureInitialized();
    await setupAppLocalizations();

    await tester.pumpWidget(MultiProvider(providers: [
      Provider(
        // ignore: unnecessary_cast
        create: (_) => SubiquityClientMock() as SubiquityClient,
      ),
      ChangeNotifierProvider(
        create: (context) => KeyboardModel(),
      ),
      ChangeNotifierProvider(create: (_) => AppTheme(MockGSettings())),
    ], child: UbuntuDesktopInstallerApp()));
    await tester.pumpAndSettle();
    expect(find.byType(WelcomePage), findsOneWidget);
  });
}
