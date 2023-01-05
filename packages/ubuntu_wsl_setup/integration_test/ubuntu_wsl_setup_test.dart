import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:ubuntu_wsl_setup/main.dart' as app;
import 'package:ubuntu_wsl_setup/routes.dart';

import 'test_pages.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async => await cleanUpSubiquity());
  tearDown(() async => await resetAllServices());

  // Select language and setup profile
  testWidgets('basic setup', (tester) async {
    await app.main(<String>['--initial-route', Routes.selectLanguage]);
    await tester.pumpAndSettle();

    await testSelectYourLanguagePage(tester, language: 'Français');
    await tester.pumpAndSettle();

    await testProfileSetupPage(
      tester,
      profile: const IdentityData(realname: 'WSL User', username: 'wsl-user'),
      password: 'password123',
      confirmedPassword: 'password123',
    );
    await tester.pumpAndSettle();

    await testAdvancedSetupPage(tester);
    await testApplyingChangesPage(tester, expectClose: true);

    await verifyStateFile('basic-setup/WSLLocale');
  });

  // enter all WSLConfigurationBase values
  testWidgets('advanced setup', (tester) async {
    await app.main(<String>['--initial-route', Routes.profileSetup]);
    await tester.pumpAndSettle();

    await testProfileSetupPage(
      tester,
      profile: const IdentityData(realname: 'WSL User', username: 'wsl-user'),
      password: 'password123',
      confirmedPassword: 'password123',
    );
    await tester.pumpAndSettle();

    // NOTE: opposites of the default values to force writing the config
    await testAdvancedSetupPage(
      tester,
      config: const WSLConfigurationBase(
        automountRoot: '/tst/wsl',
        automountOptions: '--test-wsl',
        networkGeneratehosts: false,
        networkGenerateresolvconf: false,
      ),
    );
    await testApplyingChangesPage(tester, expectClose: true);

    await verifyConfigFile('advanced-setup/wsl.conf');
  });

  // enter all WSLConfigurationAdvanced values
  testWidgets('reconfiguration', (tester) async {
    await app.main(<String>['--reconfigure']);
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

    await verifyConfigFile('reconfiguration/wsl.conf');
  });
}
