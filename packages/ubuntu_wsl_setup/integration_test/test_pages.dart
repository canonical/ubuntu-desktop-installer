import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:ubuntu_wsl_setup/l10n.dart';
import 'package:ubuntu_wsl_setup/pages.dart';
import 'package:ubuntu_wsl_setup/splash_screen.dart';
import 'package:ubuntu_wsl_setup/wizard.dart';
import 'package:yaru_window_test/yaru_window_test.dart';

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
    final tile = find.listTile(language, skipOffstage: false);
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

  await tester.tapNext();
}

Future<void> testProfileSetupPage(
  WidgetTester tester, {
  IdentityData? profile,
  String? password,
  String? confirmedPassword,
  bool? showAdvancedOptions,
}) async {
  expectPage(tester, ProfileSetupPage, (lang) => lang.profileSetupTitle);

  if (profile?.realname != null) {
    await tester.enterText(
      find.textField(tester.lang.profileSetupRealnameLabel),
      profile!.realname,
    );
  }
  if (profile?.username != null) {
    await tester.enterText(
      find.textField(tester.lang.profileSetupUsernameHint),
      profile!.username,
    );
  }
  if (password != null) {
    await tester.enterText(
      find.textField(tester.lang.profileSetupPasswordHint),
      password,
    );
  }
  if (confirmedPassword != null) {
    await tester.enterText(
      find.textField(tester.lang.profileSetupConfirmPasswordHint),
      confirmedPassword,
    );
  }
  await tester.toggleCheckbox(
    label: tester.lang.profileSetupShowAdvancedOptions,
    value: showAdvancedOptions,
  );
  await tester.pumpAndSettle();

  await tester.tapNext();
}

Future<void> testAdvancedSetupPage(
  WidgetTester tester, {
  WSLConfigurationBase? config,
}) async {
  expectPage(tester, AdvancedSetupPage, (lang) => lang.advancedSetupTitle);

  if (config?.automountRoot != null) {
    await tester.enterText(
      find.textField(tester.lang.advancedSetupMountLocationHint),
      config!.automountRoot,
    );
  }
  if (config?.automountOptions != null) {
    await tester.enterText(
      find.textField(tester.lang.advancedSetupMountOptionHint),
      config!.automountOptions,
    );
  }
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
  final windowClosed = expectClose ? YaruTestWindow.waitForClosed() : null;

  await tester.pumpUntil(find.byType(ApplyingChangesPage));
  expectPage(tester, ApplyingChangesPage, (lang) => lang.setupCompleteTitle);

  if (windowClosed != null) {
    await expectLater(windowClosed, completes);
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
  // Prevent `Guarded function conflict` on tests.
  expectSync(find.byType(page), findsOneWidget);
  expectSync(find.widgetWithText(AppBar, title(tester.lang)), findsWidgets);
}

extension on WidgetTester {
  Future<void> tapNext() => tap(find.button(ulang.nextLabel));
}
