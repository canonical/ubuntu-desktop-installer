import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/installer.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages.dart';
import 'package:ubuntu_desktop_installer/pages/active_directory/active_directory_model.dart';
import 'package:ubuntu_desktop_installer/pages/confirm/confirm_model.dart';
import 'package:ubuntu_desktop_installer/pages/identity/identity_model.dart';
import 'package:ubuntu_desktop_installer/pages/install/install_model.dart';
import 'package:ubuntu_desktop_installer/pages/keyboard/keyboard_model.dart';
import 'package:ubuntu_desktop_installer/pages/loading/loading_model.dart';
import 'package:ubuntu_desktop_installer/pages/locale/locale_model.dart';
import 'package:ubuntu_desktop_installer/pages/network/ethernet_model.dart';
import 'package:ubuntu_desktop_installer/pages/network/hidden_wifi_model.dart';
import 'package:ubuntu_desktop_installer/pages/network/network_model.dart';
import 'package:ubuntu_desktop_installer/pages/network/wifi_model.dart';
import 'package:ubuntu_desktop_installer/pages/rst/rst_model.dart';
import 'package:ubuntu_desktop_installer/pages/secure_boot/secure_boot_model.dart';
import 'package:ubuntu_desktop_installer/pages/source/source_model.dart';
import 'package:ubuntu_desktop_installer/pages/storage/installation_type/installation_type_model.dart';
import 'package:ubuntu_desktop_installer/pages/timezone/timezone_model.dart';
import 'package:ubuntu_desktop_installer/pages/welcome/welcome_model.dart';
import 'package:ubuntu_desktop_installer/routes.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/ubuntu_test.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_test/yaru_test.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'active_directory/test_active_directory.dart';
import 'confirm/test_confirm.dart';
import 'identity/test_identity.dart';
import 'install/test_install.dart';
import 'keyboard/test_keyboard.dart';
import 'loading/test_loading.dart';
import 'locale/test_locale.dart';
import 'network/test_network.dart';
import 'rst/test_rst.dart';
import 'secure_boot/test_secure_boot.dart';
import 'source/test_source.dart';
import 'storage/test_storage.dart';
import 'timezone/test_timezone.dart';
import 'welcome/test_welcome.dart';

void main() {
  LiveTestWidgetsFlutterBinding.ensureInitialized();

  setUp(() => YaruTestWindow.ensureInitialized(state: const YaruWindowState()));

  testWidgets('try ubuntu', (tester) async {
    final loadingModel = buildLoadingModel(delay: const Duration(seconds: 1));
    final localeModel = buildLocaleModel();
    final welcomeModel = buildWelcomeModel(option: Option.tryUbuntu);

    registerMockService<AppService>(MockAppService());
    registerMockService<TelemetryService>(MockTelemetryService());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          loadingModelProvider.overrideWith((_) => loadingModel),
          localeModelProvider.overrideWith((_) => localeModel),
          welcomeModelProvider.overrideWith((_) => welcomeModel),
        ],
        child: tester.buildTestWizard(welcome: true),
      ),
    );

    expect(find.byType(LoadingPage), findsOneWidget);
    await tester.pump(const Duration(seconds: 1));

    await tester.pumpAndSettle();
    expect(find.byType(LocalePage), findsOneWidget);

    await tester.tapNext();
    await tester.pumpAndSettle();
    expect(find.byType(WelcomePage), findsOneWidget);
    verify(welcomeModel.init()).called(1);

    final windowClosed = YaruTestWindow.waitForClosed();

    await tester.tapNext();
    await tester.pumpAndSettle();

    await expectLater(windowClosed, completes);
  });

  testWidgets('erase disk', (tester) async {
    final loadingModel = buildLoadingModel();
    final localeModel = buildLocaleModel();
    final welcomeModel = buildWelcomeModel(option: Option.installUbuntu);
    final rstModel = buildRstModel();
    final keyboardModel = buildKeyboardModel();
    final networkModel = buildNetworkModel();
    final ethernetModel = buildEthernetModel();
    final wifiModel = buildWifiModel();
    final hiddenWifiModel = buildHiddenWifiModel();
    final sourceModel = buildSourceModel();
    final secureBootModel = buildSecureBootModel();
    final installationTypeModel = buildInstallationTypeModel(
        isDone: true, installationType: InstallationType.erase);
    final confirmModel = buildConfirmModel();
    final timezoneModel = buildTimezoneModel();
    final identityModel = buildIdentityModel(isValid: true);
    final activeDirectoryModel = buildActiveDirectoryModel();
    final installModel = buildInstallModel(isDone: true);

    registerMockService<AppService>(MockAppService());
    registerMockService<DesktopService>(MockDesktopService());
    registerMockService<TelemetryService>(MockTelemetryService());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          loadingModelProvider.overrideWith((_) => loadingModel),
          localeModelProvider.overrideWith((_) => localeModel),
          welcomeModelProvider.overrideWith((_) => welcomeModel),
          rstModelProvider.overrideWith((_) => rstModel),
          keyboardModelProvider.overrideWith((_) => keyboardModel),
          networkModelProvider.overrideWith((_) => networkModel),
          ethernetModelProvider.overrideWith((_) => ethernetModel),
          wifiModelProvider.overrideWith((_) => wifiModel),
          hiddenWifiModelProvider.overrideWith((_) => hiddenWifiModel),
          sourceModelProvider.overrideWith((_) => sourceModel),
          secureBootModelProvider.overrideWith((_) => secureBootModel),
          installationTypeModelProvider
              .overrideWith((_) => installationTypeModel),
          confirmModelProvider.overrideWith((_) => confirmModel),
          timezoneModelProvider.overrideWith((_) => timezoneModel),
          identityModelProvider.overrideWith((_) => identityModel),
          activeDirectoryModelProvider
              .overrideWith((_) => activeDirectoryModel),
          installModelProvider.overrideWith((_) => installModel),
        ],
        child: tester.buildTestWizard(welcome: true),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.byType(LocalePage), findsOneWidget);
    // localeModel is not a mock
    // verify(localeModel.init()).called(1);

    await tester.tapNext();
    await tester.pumpAndSettle();
    expect(find.byType(WelcomePage), findsOneWidget);
    verify(welcomeModel.init()).called(1);

    await tester.tapNext();
    await tester.pumpAndSettle();
    expect(find.byType(KeyboardPage), findsOneWidget);
    verify(keyboardModel.init()).called(1);

    await tester.tapNext();
    await tester.pumpAndSettle();
    expect(find.byType(NetworkPage), findsOneWidget);
    verify(networkModel.init()).called(1);

    await tester.tapNext();
    await tester.pumpAndSettle();
    expect(find.byType(SourcePage), findsOneWidget);
    verify(sourceModel.init()).called(1);

    await tester.tapNext();
    await tester.pumpAndSettle();
    expect(find.byType(InstallationTypePage), findsOneWidget);
    verify(installationTypeModel.init()).called(1);

    await tester.tapNext();
    await tester.pumpAndSettle();
    expect(find.byType(ConfirmPage), findsOneWidget);
    verify(confirmModel.init()).called(1);

    await tester.tapButton(tester.lang.startInstallingButtonText);
    await tester.pumpAndSettle();
    expect(find.byType(TimezonePage), findsOneWidget);
    verify(timezoneModel.init()).called(1);

    await tester.tapNext();
    await tester.pumpAndSettle();
    expect(find.byType(IdentityPage), findsOneWidget);
    verify(identityModel.init()).called(1);

    await tester.tapNext();
    await tester.pumpAndSettle();
    expect(find.byType(ThemePage), findsOneWidget);
    // ThemePage has no view model
    // verify(themeModel.init()).called(1);

    await tester.tapNext();
    await tester.pumpAndSettle();
    expect(find.byType(InstallPage), findsOneWidget);
    verify(installModel.init()).called(1);
  });

  testWidgets('rst', (tester) async {
    final localeModel = buildLocaleModel();
    final rstModel = buildRstModel(hasRst: true);

    registerMockService<AppService>(MockAppService());
    registerMockService<TelemetryService>(MockTelemetryService());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          localeModelProvider.overrideWith((_) => localeModel),
          rstModelProvider.overrideWith((_) => rstModel),
        ],
        child: tester.buildTestWizard(),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tapNext();
    await tester.pumpAndSettle();
    expect(find.byType(RstPage), findsOneWidget);
    verify(rstModel.hasRst()).called(1);
  });

  testWidgets('secure boot', (tester) async {
    final localeModel = buildLocaleModel();
    final sourceModel = buildSourceModel();
    final secureBootModel = buildSecureBootModel(hasSecureBoot: true);

    registerMockService<AppService>(MockAppService());
    registerMockService<TelemetryService>(MockTelemetryService());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          localeModelProvider.overrideWith((_) => localeModel),
          sourceModelProvider.overrideWith((_) => sourceModel),
          secureBootModelProvider.overrideWith((_) => secureBootModel),
        ],
        child: tester.buildTestWizard(),
      ),
    );
    await tester.pumpAndSettle();
    await tester.jumpToWizardRoute(Routes.source);

    await tester.tapNext();
    await tester.pumpAndSettle();
    expect(find.byType(SecureBootPage), findsOneWidget);
    verify(secureBootModel.hasSecureBoot()).called(1);
  });

  testWidgets('bitlocker', (tester) async {
    final localeModel = buildLocaleModel();
    final installationTypeModel = buildInstallationTypeModel(
      hasBitLocker: true,
      installationType: InstallationType.bitlocker,
      isDone: false,
    );

    final storage = MockStorageService();
    when(storage.guidedTarget).thenReturn(null);

    registerMockService<AppService>(MockAppService());
    registerMockService<StorageService>(storage);
    registerMockService<TelemetryService>(MockTelemetryService());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          localeModelProvider.overrideWith((_) => localeModel),
          installationTypeModelProvider
              .overrideWith((_) => installationTypeModel),
        ],
        child: tester.buildTestWizard(),
      ),
    );
    await tester.pumpAndSettle();
    await tester.jumpToWizardRoute(Routes.storage);

    await tester.tapNext();
    await tester.pumpAndSettle();
    expect(find.byType(BitLockerPage), findsOneWidget);
  });

  testWidgets('active directory', (tester) async {
    final localeModel = buildLocaleModel();
    final identityModel =
        buildIdentityModel(useActiveDirectory: true, isValid: true);
    final activeDirectoryModel = buildActiveDirectoryModel(isUsed: true);

    registerMockService<AppService>(MockAppService());
    registerMockService<TelemetryService>(MockTelemetryService());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          localeModelProvider.overrideWith((_) => localeModel),
          identityModelProvider.overrideWith((_) => identityModel),
          activeDirectoryModelProvider
              .overrideWith((_) => activeDirectoryModel),
        ],
        child: tester.buildTestWizard(),
      ),
    );
    await tester.pumpAndSettle();
    await tester.jumpToWizardRoute(Routes.identity);

    await tester.tapNext();
    await tester.pumpAndSettle();
    expect(find.byType(ActiveDirectoryPage), findsOneWidget);
    verify(activeDirectoryModel.init()).called(1);
  });
}

extension on WidgetTester {
  Widget buildTestWizard({bool? welcome}) {
    final client = MockSubiquityClient();
    when(client.monitorStatus()).thenAnswer((_) => const Stream.empty());
    registerMockService<SubiquityClient>(client);

    return InheritedLocale(
      child: Flavor(
        data: const FlavorData(name: 'Ubuntu'),
        child: MaterialApp(
          localizationsDelegates: localizationsDelegates,
          supportedLocales: supportedLocales,
          theme: yaruLight,
          home: InstallerWizard(welcome: welcome),
        ),
      ),
    );
  }

  Future<void> jumpToWizardRoute(String route) {
    final context = element(find.byType(WizardPage));
    Wizard.of(context).jump(route);
    return pumpAndSettle();
  }
}
