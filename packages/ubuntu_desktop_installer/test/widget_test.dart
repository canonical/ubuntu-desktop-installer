// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/installer.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages/welcome/welcome_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/mocks.dart';
import 'package:ubuntu_wizard/settings.dart';

void main() {
  testWidgets('Ubuntu Desktop installer smoke tests', (tester) async {
    // Build our app and trigger a frame.
    TestWidgetsFlutterBinding.ensureInitialized();
    await setupAppLocalizations();

    final client = MockSubiquityClient();
    when(client.hasRst()).thenAnswer((_) async => false);
    when(client.hasBitLocker()).thenAnswer((_) async => false);
    when(client.keyboard()).thenAnswer((_) async => KeyboardSetup(layouts: []));
    when(client.getGuidedStorage(true))
        .thenAnswer((_) async => GuidedStorageResponse());
    when(client.isOpen).thenAnswer((_) async => true);

    await tester.pumpWidget(MultiProvider(providers: [
      Provider<SubiquityClient>.value(value: client),
      Provider(create: (context) => DiskStorageService(client)),
      Provider(create: (context) => KeyboardService()),
      ChangeNotifierProvider(create: (_) => Settings(MockGSettings())),
    ], child: UbuntuDesktopInstallerApp()));
    await tester.pumpAndSettle();
    expect(find.byType(WelcomePage), findsOneWidget);
  });
}
