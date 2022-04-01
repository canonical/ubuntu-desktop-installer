import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages/installation_slides/installation_slides_model.dart';
import 'package:ubuntu_desktop_installer/pages/installation_slides/installation_slides_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_desktop_installer/slides.dart';
import 'package:ubuntu_test/mocks.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';

import '../widget_tester_extensions.dart';
import 'installation_slides_page_test.mocks.dart';

@GenerateMocks([InstallationSlidesModel, JournalService])
void main() {
  InstallationSlidesModel buildModel({
    ApplicationState? state,
    bool? isDone,
    bool? hasError,
    bool? isPreparing,
    bool? isInstalling,
    int? installationStep,
    int? installationStepCount,
    bool? isWindowExpanded,
    Stream<String>? journal,
  }) {
    final model = MockInstallationSlidesModel();
    when(model.state).thenReturn(state ?? ApplicationState.UNKNOWN);
    when(model.isDone).thenReturn(isDone ?? false);
    when(model.hasError).thenReturn(hasError ?? false);
    when(model.isPreparing).thenReturn(isPreparing ?? false);
    when(model.isInstalling).thenReturn(isInstalling ?? false);
    when(model.installationStep).thenReturn(installationStep ?? 1);
    when(model.installationStepCount).thenReturn(installationStepCount ?? 1);
    when(model.isWindowExpanded).thenReturn(isWindowExpanded ?? false);
    when(model.journal).thenAnswer((_) => journal ?? Stream<String>.empty());
    return model;
  }

  Widget buildPage(InstallationSlidesModel model) {
    return ChangeNotifierProvider<InstallationSlidesModel>.value(
      value: model,
      child: SlidesContext(slides: [
        Slide(
          title: (context) => Text('title1'),
          body: (context) => Text('body1'),
        ),
        Slide(
          title: (context) => Text('title2'),
          body: (context) => Text('body2'),
        ),
      ], child: InstallationSlidesPage()),
    );
  }

  testWidgets('initializes the model', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));
    verify(model.init()).called(1);
    await tester.pumpAndSettle();
  });

  Finder findsSlide(String text) {
    return find.descendant(
      of: find.byType(PageView),
      matching: find.text(text),
    );
  }

  testWidgets('show slides', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));
    await tester.pumpAndSettle();

    expect(find.byType(SlideShow), findsOneWidget);

    expect(findsSlide('title1'), findsOneWidget);
    expect(findsSlide('body1'), findsOneWidget);
  });

  testWidgets('navigate slides', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));
    await tester.pumpAndSettle();

    // initially at first slide
    expect(findsSlide('title1'), findsOneWidget);
    expect(findsSlide('body1'), findsOneWidget);
    expect(findsSlide('title2'), findsNothing);
    expect(findsSlide('body2'), findsNothing);
    expect(find.byIcon(Icons.chevron_left), findsNothing);
    expect(find.byIcon(Icons.chevron_right), findsOneWidget);

    // go to second slide
    await tester.tap(find.byIcon(Icons.chevron_right));
    await tester.pumpAndSettle();
    expect(findsSlide('title1'), findsNothing);
    expect(findsSlide('body1'), findsNothing);
    expect(findsSlide('title2'), findsOneWidget);
    expect(findsSlide('body2'), findsOneWidget);
    expect(find.byIcon(Icons.chevron_left), findsOneWidget);
    expect(find.byIcon(Icons.chevron_right), findsNothing);

    // back to first slide
    await tester.tap(find.byIcon(Icons.chevron_left));
    await tester.pumpAndSettle();
    expect(findsSlide('title1'), findsOneWidget);
    expect(findsSlide('body1'), findsOneWidget);
    expect(findsSlide('title2'), findsNothing);
    expect(findsSlide('body2'), findsNothing);
    expect(find.byIcon(Icons.chevron_left), findsNothing);
    expect(find.byIcon(Icons.chevron_right), findsOneWidget);
  });

  testWidgets('expand log view', (tester) async {
    final model = buildModel(isWindowExpanded: false);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.arrow_right), findsOneWidget);

    final context = tester.element(find.byType(InstallationSlidesPage));
    final height =
        InstallationSlidesPageState.getTextHeight(context, lines: kLogLines);
    expect(height, isPositive);

    await tester.tap(find.byIcon(Icons.arrow_right));
    verify(model.expandWindow(height)).called(1);

    await tester.tap(find.ancestor(
      of: find.byIcon(Icons.arrow_right),
      matching: find.byType(GestureDetector),
    ));
    verify(model.expandWindow(height)).called(1);
  });

  testWidgets('collapse log view', (tester) async {
    final model = buildModel(isWindowExpanded: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.arrow_right), findsOneWidget);
    await tester.tap(find.byIcon(Icons.arrow_right));
    verify(model.collapseWindow()).called(1);

    await tester.tap(find.ancestor(
      of: find.byIcon(Icons.arrow_right),
      matching: find.byType(GestureDetector),
    ));
    verify(model.collapseWindow()).called(1);
  });

  testWidgets('creates a model', (tester) async {
    final never = Completer<ApplicationStatus>();
    final client = MockSubiquityClient();
    when(client.status(current: anyNamed('current')))
        .thenAnswer((_) => never.future);
    registerMockService<SubiquityClient>(client);

    final service = MockJournalService();
    when(service.stream).thenAnswer((_) => Stream<String>.empty());
    registerMockService<JournalService>(service);

    await tester.pumpWidget(
      SlidesContext(
        slides: [
          Slide(
            title: (_) => SizedBox.shrink(),
            body: (_) => SizedBox.shrink(),
          )
        ],
        child: tester.buildApp(InstallationSlidesPage.create),
      ),
    );

    final page = find.byType(InstallationSlidesPage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model = Provider.of<InstallationSlidesModel>(context, listen: false);
    expect(model, isNotNull);
  });
}
