import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:ubuntu_wsl_setup/l10n.dart';
import 'package:ubuntu_wsl_setup/pages.dart';
import 'package:ubuntu_wsl_setup/splash_screen.dart';
import 'package:ubuntu_wsl_setup/wizard.dart';

import '../test/test_utils.dart';

Future<void> testSplashPage(
  WidgetTester tester, {
  bool expectClose = false,
}) async {
  await tester.pumpUntil(find.byType(SplashScreen));
  expect(find.byType(AnimatedSwitcher), findsOneWidget);
  await tester.pumpUntil(find.byType(UbuntuWslSetupWizard));
}

Future<void> testInstallationSlidesPage(WidgetTester tester) async {
  await tester.pumpUntil(find.byType(InstallationSlidesPage));
  await tester.pump();
  expectPage(
    tester,
    InstallationSlidesPage,
    (lang) => lang.installationSlidesWelcome,
  );
  final rightIcon = find.byIcon(Icons.chevron_right);
  expect(rightIcon, findsOneWidget);
  await tester.tap(rightIcon);
  await tester.pump();
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

  // For now toggling this check box won't cause any noticeable behavior change in dry-run.
  await tester.toggleCheckbox(
    label: tester.lang.installLangPacksTitle(language ?? ''),
    value: false,
  );

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

  await tester.tapButton(tester.lang.setupButton);
}

Future<void> testApplyingChangesPage(
  WidgetTester tester, {
  bool expectClose = false,
}) async {
  final windowClosed = expectClose ? waitForWindowClosed() : null;

  await tester.pumpUntil(find.byType(ApplyingChangesPage));
  expectPage(tester, ApplyingChangesPage, (lang) => lang.setupCompleteTitle);

  if (windowClosed != null) {
    expect(await windowClosed, isTrue);
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

  await tester.tapButton(tester.lang.saveButton);
}

void expectPage(
  WidgetTester tester,
  Type page,
  String Function(AppLocalizations lang) title,
) {
  LangTester.type = page;
  expect(find.byType(page), findsOneWidget);
  expect(find.widgetWithText(AppBar, title(tester.lang)), findsWidgets);
}
