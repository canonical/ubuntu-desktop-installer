// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/installer.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/mocks.dart';
import 'package:ubuntu_wizard/utils.dart';

import 'choose_your_look/choose_your_look_page_test.mocks.dart';
import 'installation_slides/installation_slides_model_test.mocks.dart';
import 'test_utils.dart';

void main() {
  setUpAll(setupAppLocalizations);

  testWidgets('interactive installation', (tester) async {
    await tester.pumpWidget(
      tester.buildInstaller(
        state: ApplicationState.WAITING,
        interactive: true,
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(WelcomePage), findsOneWidget);
  });

  testWidgets('automated installation with confirmation', (tester) async {
    await tester.pumpWidget(
      tester.buildInstaller(
        state: ApplicationState.NEEDS_CONFIRMATION,
        interactive: false,
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(WriteChangesToDiskPage), findsOneWidget);
  });

  testWidgets('fully automated installation', (tester) async {
    await tester.pumpWidget(
      tester.buildInstaller(
        state: ApplicationState.RUNNING,
        interactive: false,
      ),
    );
    await tester.pump();
    expect(find.byType(InstallationSlidesPage), findsOneWidget);
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
    final done = status.copyWith(state: ApplicationState.DONE);

    final client = MockSubiquityClient();
    when(client.status()).thenAnswer((_) async => status);
    when(client.status(current: ApplicationState.RUNNING))
        .thenAnswer((_) async => done);
    when(client.hasRst()).thenAnswer((_) async => false);
    when(client.hasBitLocker()).thenAnswer((_) async => false);
    when(client.keyboard()).thenAnswer((_) async =>
        const KeyboardSetup(layouts: [], setting: KeyboardSetting(layout: '')));
    when(client.getStorageV2()).thenAnswer((_) async => testStorageResponse());
    when(client.getOriginalStorageV2())
        .thenAnswer((_) async => testStorageResponse());
    registerMockService<SubiquityClient>(client);
    when(client.source()).thenAnswer((_) async =>
        const SourceSelectionAndSetting(
            sources: [], currentId: kNormalSourceId, searchDrivers: false));

    final monitor = MockSubiquityStatusMonitor();
    when(monitor.status).thenReturn(status);
    when(monitor.onStatusChanged).thenAnswer((_) => const Stream.empty());
    registerMockService<SubiquityStatusMonitor>(monitor);

    final journal = MockJournalService();
    when(journal.start(any, output: anyNamed('output')))
        .thenAnswer((_) => const Stream.empty());

    registerMockService<DesktopService>(MockDesktopService());
    registerMockService<DiskStorageService>(DiskStorageService(client));
    registerMockService<JournalService>(journal);
    registerMockService<ProductService>(ProductService());
    registerMockService<TelemetryService>(TelemetryService());

    return InheritedLocale(child: UbuntuDesktopInstallerApp());
  }
}
