import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:ubuntu_wsl_setup/l10n.dart';
import 'package:ubuntu_wsl_setup/main.dart' as app;
import 'package:ubuntu_wsl_setup/pages.dart';
import 'package:ubuntu_wsl_setup/routes.dart';

import '../test/test_utils.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async => await cleanUpSubiquity());
  tearDown(() async => await resetAllServices());

  // Select language and setup profile
  testWidgets('basic setup', (tester) async {
    await app.main(<String>[]);
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
    await testApplyingChangesPage(tester);
    await tester.pumpAndSettle();

    await testSetupCompletePage(tester, username: 'wsl-user');
    await tester.pumpAndSettle();

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
    await tester.pumpAndSettle();

    await testSetupCompletePage(tester, username: 'wsl-user');
    await tester.pumpAndSettle();

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

Future<void> testSelectYourLanguagePage(
  WidgetTester tester, {
  String? language,
}) async {
  expectPage(tester, SelectLanguagePage, (lang) => lang.selectLanguageTitle);

  if (language != null) {
    final tile = find.widgetWithText(ListTile, language, skipOffstage: false);
    expect(tile, findsOneWidget);
    final viewRect = tester.getRect(find.byType(ListView));
    await tester.scrollUntilVisible(tile, viewRect.height / 2);
    await tester.pump();
    await tester.tap(tile);
    await tester.pump();
  }
  await tester.pumpAndSettle();

  await tester.tapContinue();
}

Future<void> testProfileSetupPage(
  WidgetTester tester, {
  IdentityData? profile,
  String? password,
  String? confirmedPassword,
  bool? showAdvancedOptions,
}) async {
  expectPage(tester, ProfileSetupPage, (lang) => lang.profileSetupTitle);

  await tester.enterTextValue(
    label: tester.lang.profileSetupRealnameLabel,
    value: profile?.realname,
  );
  await tester.enterTextValue(
    label: tester.lang.profileSetupUsernameHint,
    value: profile?.username,
  );
  await tester.enterTextValue(
    label: tester.lang.profileSetupPasswordHint,
    value: password,
  );
  await tester.enterTextValue(
    label: tester.lang.profileSetupConfirmPasswordHint,
    value: confirmedPassword,
  );
  await tester.toggleCheckbox(
    label: tester.lang.profileSetupShowAdvancedOptions,
    value: showAdvancedOptions,
  );
  await tester.pumpAndSettle();

  await tester.tapContinue();
}

Future<void> testAdvancedSetupPage(
  WidgetTester tester, {
  WSLConfigurationBase? config,
}) async {
  expectPage(tester, AdvancedSetupPage, (lang) => lang.advancedSetupTitle);

  await tester.enterTextValue(
    label: tester.lang.advancedSetupMountLocationHint,
    value: config?.automountRoot,
  );
  await tester.enterTextValue(
    label: tester.lang.advancedSetupMountOptionHint,
    value: config?.automountOptions,
  );
  await tester.toggleCheckbox(
    label: tester.lang.advancedSetupHostGenerationTitle,
    value: config?.networkGeneratehosts,
  );
  await tester.toggleCheckbox(
    label: tester.lang.advancedSetupResolvConfGenerationTitle,
    value: config?.networkGenerateresolvconf,
  );
  await tester.pumpAndSettle();

  await tester.tapButton(label: tester.lang.setupButton, highlighted: true);
}

Future<void> testApplyingChangesPage(
  WidgetTester tester, {
  bool expectClose = false,
}) async {
  await tester.pumpUntil(find.byType(ApplyingChangesPage));
  expectPage(tester, ApplyingChangesPage, (lang) => lang.setupCompleteTitle);

  if (expectClose) {
    expect(await waitForWindowClosed(), isTrue);
  }
}

Future<void> testConfigurationUIPage(
  WidgetTester tester, {
  WSLConfigurationAdvanced? config,
}) async {
  expectPage(tester, ConfigurationUIPage, (lang) => lang.configurationUITitle);

  await tester.toggleCheckbox(
    label: tester.lang.configurationUIAutoMountSubtitle,
    value: config?.automountEnabled,
  );
  await tester.toggleCheckbox(
    label: tester.lang.configurationUIMountFstabSubtitle,
    value: config?.automountMountfstab,
  );
  await tester.toggleCheckbox(
    label: tester.lang.configurationUIInteroperabilitySubtitle,
    value: config?.interopEnabled,
  );
  await tester.toggleCheckbox(
    label: tester.lang.configurationUIInteropAppendWindowsPathSubtitle,
    value: config?.interopAppendwindowspath,
  );
  await tester.pumpAndSettle();

  await tester.tapButton(label: tester.lang.saveButton, highlighted: true);
}

Future<void> testSetupCompletePage(
  WidgetTester tester, {
  String? username,
}) async {
  expectPage(tester, SetupCompletePage, (lang) => lang.setupCompleteTitle);

  if (username != null) {
    expect(
      find.text(tester.lang.setupCompleteHeader(username)),
      findsOneWidget,
    );
  }

  final windowClosed = waitForWindowClosed();
  await tester.tapButton(label: tester.lang.finishButton);
  await expectLater(windowClosed, completion(isTrue));
}

void expectPage(
  WidgetTester tester,
  Type page,
  String Function(AppLocalizations lang) title,
) {
  LangTester.type = page;
  expect(find.byType(page), findsOneWidget);
  expect(find.widgetWithText(AppBar, title(tester.lang)), findsOneWidget);
}
