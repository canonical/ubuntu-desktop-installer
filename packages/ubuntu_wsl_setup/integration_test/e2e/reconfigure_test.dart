@TestOn('windows')
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wsl_setup/main_win.dart' as app;
import 'package:yaru_test/yaru_test.dart';

import '../test_pages.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(YaruTestWindow.ensureInitialized);

  // enter all WSLConfigurationAdvanced values
  testWidgets('reconfiguration', (tester) async {
    await app.main(<String>['--reconfigure', '--no-dry-run']);
    await tester.pumpAndSettle();

    await testSplashPage(tester);
    await tester.pumpAndSettle();

    await testAdvancedSetupPage(tester);
    await tester.pumpAndSettle();

    // NOTE: opposites of the default values to force writing the config
    await testConfigurationUIPage(
      tester,
      config: const WSLConfigurationAdvanced(
        interopEnabled: false,
        interopAppendwindowspath: false,
        automountEnabled: false,
        automountMountfstab: false,
      ),
    );

    await testApplyingChangesPage(tester, expectClose: true);
  });
}
