@TestOn('windows')
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ubuntu_wsl_setup/main_win.dart' as app;

import '../test_pages.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('basic setup with prefill info', (tester) async {
    const prefill = String.fromEnvironment('PREFILL', defaultValue: '');
    app.main(<String>['--no-dry-run', '--prefill=$prefill']);

    await testInstallationSlidesPage(tester);
    await tester.pumpAndSettle();

    await testSelectYourLanguagePage(tester, language: 'Français');
    await tester.pumpAndSettle();

    await testProfileSetupPage(
      tester,
      password: 'password123',
      confirmedPassword: 'password123',
    );
    await tester.pumpAndSettle();

    await testAdvancedSetupPage(tester);
    await testApplyingChangesPage(tester);
    await tester.pumpAndSettle();

    await testSetupCompletePage(tester);
    await tester.pumpAndSettle();
  });
}
