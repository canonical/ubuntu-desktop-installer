import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:ubuntu_wsl_setup/app_model.dart';
import 'package:ubuntu_wsl_setup/l10n.dart';
import 'package:ubuntu_wsl_setup/pages/installation_slides/installation_slides_model.dart';
import 'package:ubuntu_wsl_setup/pages/installation_slides/installation_slides_page.dart';
import 'package:ubuntu_wsl_setup/pages/installation_slides/slides.dart';
import 'package:ubuntu_wsl_setup/services/journal.dart';
import 'package:yaru/yaru.dart';

import 'installation_slides_page_test.mocks.dart';
import 'test_utils.dart';

const theEnd = 'The end';
const title = 'A title';
const lorem = 'Lorem ipsum';

double getLogOffsetByText(WidgetTester tester, String text) {
  final finder = find.text(text);
  expect(finder, findsOneWidget);
  final eval = finder.evaluate();

  final slide = eval.first.findAncestorWidgetOfExactType<AnimatedSlide>();

  return slide!.offset.dy;
}

@GenerateMocks([InstallationSlidesModel, JournalService])
void main() {
  LangTester.type = InstallationSlidesPage;

  MockInstallationSlidesModel createModel({
    bool isServerUp = false,
    bool hasError = false,
    bool isLogVisible = false,
    bool isRegistering = false,
    Iterable<String> journalSource = const <String>[],
  }) {
    final model = MockInstallationSlidesModel();
    when(model.isServerUp).thenAnswer((_) => isServerUp);
    when(model.hasError).thenAnswer((_) => hasError);
    when(model.isLogVisible).thenAnswer((_) => isLogVisible);
    when(model.isRegistering).thenAnswer((_) => isRegistering);
    when(model.journal)
        .thenAnswer((_) => Stream<String>.fromIterable(journalSource));
    return model;
  }

  Widget buildPage(InstallationSlidesModel model, List<Widget> slides) {
    final provider = SlidesProvider(slides);
    return ChangeNotifierProvider<InstallationSlidesModel>.value(
      value: model,
      child: Provider.value(
          value: provider, child: const InstallationSlidesPage()),
    );
  }

  Widget buildApp(Widget Function(BuildContext) builder) {
    return Provider<AppModel>(
      create: (_) => const AppModel(),
      child: MaterialApp(
        localizationsDelegates: localizationsDelegates,
        theme: yaruLight,
        home: Wizard(routes: {
          '/': WizardRoute(
            builder: builder,
            onNext: (settings) => '/end',
          ),
          '/end': WizardRoute(
            builder: (_) => const Center(
              child: Text(theEnd),
            ),
            onNext: (settings) => '/end',
          ),
        }),
      ),
    );
  }

  testWidgets('skip slides if server is already up', (tester) async {
    final model = MockInstallationSlidesModel();
    when(model.isServerUp).thenAnswer((_) => true);
    await tester
        .pumpWidget(buildApp((_) => buildPage(model, [const Text(title)])));
    expect(find.byType(SlideShow), findsNothing);
  });

  testWidgets('display slides while server is not up', (tester) async {
    MockInstallationSlidesModel model = createModel(isRegistering: true);
    await tester
        .pumpWidget(buildApp((_) => buildPage(model, [const Text(title)])));
    expect(find.text(title), findsWidgets);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text(tester.lang.installationSlidesUnpacking), findsOneWidget);
  });

  testWidgets('display error status', (tester) async {
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    MockInstallationSlidesModel model = createModel(hasError: true);
    await tester
        .pumpWidget(buildApp((_) => buildPage(model, [const Text(title)])));
    expect(find.text(title), findsWidgets);
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.text(tester.lang.installationSlidesErrorTitle), findsOneWidget);
    expect(find.text(tester.lang.installationSlidesErrorMsg), findsOneWidget);
  });

  testWidgets('display log', (tester) async {
    const log = 'A log';
    MockInstallationSlidesModel model =
        createModel(isLogVisible: true, journalSource: [log]);
    await tester
        .pumpWidget(buildApp((_) => buildPage(model, [const Text(title)])));
    expect(find.text(title), findsWidgets);
    expect(find.text(log), findsWidgets);
  });

  testWidgets('toggle log visibility up', (tester) async {
    final model = createModel(isLogVisible: false);
    await tester
        .pumpWidget(buildApp((_) => buildPage(model, [const Text(title)])));
    await tester.pumpAndSettle();

    await tester.tap(find.iconButton(Icons.terminal));
    verify(model.toggleLogVisibility()).called(1);
  });

  testWidgets('toggle log visibility down', (tester) async {
    final model = createModel(isLogVisible: true);
    await tester
        .pumpWidget(buildApp((_) => buildPage(model, [const Text(title)])));
    await tester.pumpAndSettle();

    await tester.tap(find.iconButton(Icons.terminal));
    verify(model.toggleLogVisibility()).called(1);
  });

  testWidgets('creates a model', (tester) async {
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    final journal = MockJournalService();
    when(journal.stream)
        .thenAnswer((realInvocation) => const Stream<String>.empty());
    final monitor = MockSubiquityStatusMonitor();
    when(monitor.status).thenAnswer((realInvocation) => null);
    when(monitor.onStatusChanged).thenAnswer(
      (realInvocation) => const Stream.empty(),
    );
    registerMockService<JournalService>(journal);
    registerMockService<SubiquityStatusMonitor>(monitor);
    await tester.pumpWidget(buildApp(InstallationSlidesPage.create));
    final page = find.byType(InstallationSlidesPage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model = Provider.of<InstallationSlidesModel>(context, listen: false);
    expect(model, isNotNull);
  });

  group('page interaction', () {
    testWidgets('toggle log view', (tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      final journal = MockJournalService();
      when(journal.stream).thenAnswer(
        (_) => Stream<String>.fromIterable([lorem]).asBroadcastStream(),
      );
      final monitor = MockSubiquityStatusMonitor();
      when(monitor.status).thenAnswer((_) => null);
      when(monitor.onStatusChanged).thenAnswer((_) => const Stream.empty());
      registerMockService<JournalService>(journal);
      registerMockService<SubiquityStatusMonitor>(monitor);

      await tester.pumpWidget(buildApp(InstallationSlidesPage.create));
      await tester.pump();

      // hidden
      expect(getLogOffsetByText(tester, lorem), equals(1.0));
      await tester.tap(find.iconButton(Icons.terminal));
      await tester.pump();
      // visible
      expect(getLogOffsetByText(tester, lorem), equals(0.0));
      await tester.tap(find.iconButton(Icons.terminal));
      await tester.pump();
      // hidden again
      expect(getLogOffsetByText(tester, lorem), equals(1.0));
    });

    testWidgets('clicks slides', (tester) async {
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      final journal = MockJournalService();
      when(journal.stream).thenAnswer(
        (_) => Stream<String>.fromIterable([lorem]).asBroadcastStream(),
      );
      final monitor = MockSubiquityStatusMonitor();
      when(monitor.status).thenAnswer((_) => null);
      when(monitor.onStatusChanged).thenAnswer((_) => const Stream.empty());
      registerMockService<JournalService>(journal);
      registerMockService<SubiquityStatusMonitor>(monitor);
      await tester.pumpWidget(buildApp(InstallationSlidesPage.create));
      await tester.pump();

      final image1 = find.byType(SvgPicture);
      expect(image1, findsWidgets);
      await tester.tap(find.iconButton(Icons.chevron_right));
      await tester.pump();
      final image2 = find.byType(SvgPicture);
      expect(image1, findsWidgets);
      expect(image1.first, isNot(equals(image2.first)));
    });
  });
}
