import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/installer.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_provision/ubuntu_provision.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';
import 'package:yaru_test/yaru_test.dart';

import 'install/test_install.dart';
import 'loading/test_loading.dart';
import 'test_utils.dart';

void main() {
  setUpAll(YaruTestWindow.ensureInitialized);
  tearDown(resetAllServices);

  testWidgets('interactive installation', (tester) async {
    await tester.pumpWidget(
      tester.buildInstaller(
        state: ApplicationState.WAITING,
        interactive: true,
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(LocalePage), findsOneWidget);
  });

  testWidgets('automated installation with confirmation', (tester) async {
    await tester.pumpWidget(
      tester.buildInstaller(
        state: ApplicationState.NEEDS_CONFIRMATION,
        interactive: false,
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(ConfirmPage), findsOneWidget);
  });

  testWidgets('fully automated installation', (tester) async {
    registerMockService<SessionService>(MockSessionService());
    await tester.pumpWidget(
      tester.buildInstaller(
        state: ApplicationState.RUNNING,
        interactive: false,
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(InstallPage), findsOneWidget);
  });

  testWidgets('initializes subiquity', (tester) async {
    final endpoint = Endpoint.unix('/path/to/socket');

    final client = MockSubiquityClient();
    when(client.getLocale()).thenAnswer((_) async => 'en_US.UTF-8');
    when(client.monitorStatus()).thenAnswer(
        (_) => Stream.value(fakeApplicationStatus(ApplicationState.RUNNING)));
    when(client.getInteractiveSections()).thenAnswer((_) async => null);
    registerMockService<SubiquityClient>(client);

    final server = MockSubiquityServer();
    when(server.start(
            args: anyNamed('args'), environment: anyNamed('environment')))
        .thenAnswer((_) async => endpoint);
    registerMockService<SubiquityServer>(server);

    registerMockService<DesktopService>(MockDesktopService());
    registerMockService<TelemetryService>(MockTelemetryService());

    await tester
        .runAsync(() => runInstallerApp(['--dry-run', '--', '--foo', 'bar']));
    verify(server.start(args: [
      '--machine-config=examples/simple.json',
      '--source-catalog=examples/desktop-sources.yaml',
      '--storage-version=2',
      '--foo',
      'bar',
    ])).called(1);
    verify(client.open(endpoint)).called(1);
  });
}

extension on WidgetTester {
  Widget buildInstaller({required ApplicationState state, bool? interactive}) {
    final status = ApplicationStatus(
      state: state,
      confirmingTty: '',
      error: null,
      cloudInitOk: null,
      interactive: interactive,
      echoSyslogId: '',
      logSyslogId: '',
      eventSyslogId: '',
    );

    final installer = MockInstallerService();
    when(installer.hasRoute(any)).thenReturn(true);
    when(installer.monitorStatus()).thenAnswer((_) => Stream.value(status));

    final journal = MockJournalService();
    when(journal.start(any, output: anyNamed('output')))
        .thenAnswer((_) => const Stream.empty());

    final locale = MockLocaleService();
    when(locale.getLocale()).thenAnswer((_) async => 'en_US.UTF-8');

    registerMockService<DesktopService>(MockDesktopService());
    registerMockService<InstallerService>(installer);
    registerMockService<JournalService>(journal);
    registerMockService<LocaleService>(locale);
    registerMockService<ProductService>(ProductService());
    registerMockService<StorageService>(StorageService(MockSubiquityClient()));
    registerMockService<SubiquityClient>(MockSubiquityClient());
    registerMockService<TelemetryService>(MockTelemetryService());

    return ProviderScope(
      child: SlidesContext(
        slides: [(_) => const SizedBox.shrink()],
        child: WizardApp(
          localizationsDelegates: localizationsDelegates,
          supportedLocales: supportedLocales,
          home: const InstallerWizard(),
        ),
      ),
    );
  }
}
