@TestOn('windows')
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ubuntu_test/ubuntu_test.dart';
import 'package:ubuntu_wsl_setup/main_win.dart' as app;
import 'package:yaru_test/yaru_test.dart';

import '../test_pages.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(YaruTestWindow.ensureInitialized);

  testWidgets('basic setup with prefill info', (tester) async {
    const prefill = String.fromEnvironment('PREFILL', defaultValue: '');
    await tester.runApp(() => app.main(<String>[
          '--no-dry-run',
          '--prefill=$prefill',
        ]));

    await testInstallationSlidesPage(tester);
    await tester.pumpAndSettle();

    await testProfileSetupPage(
      tester,
      password: 'password123',
      confirmedPassword: 'password123',
    );
    await testApplyingChangesPage(tester, expectClose: true);
  });
}
