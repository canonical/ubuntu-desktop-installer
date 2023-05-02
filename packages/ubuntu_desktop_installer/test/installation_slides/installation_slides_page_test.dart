import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/pages/installation_slides/installation_slides_model.dart';
import 'package:ubuntu_desktop_installer/pages/installation_slides/installation_slides_page.dart';
import 'package:ubuntu_desktop_installer/pages/installation_slides/slide_view.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_desktop_installer/slides.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:yaru_icons/yaru_icons.dart';

import '../test_utils.dart';
import 'installation_slides_model_test.mocks.dart';
import 'installation_slides_page_test.mocks.dart';

// ignore_for_file: type=lint

@GenerateMocks([InstallationSlidesModel])
void main() {
  UbuntuTester.context = InstallationSlidesPage;

  InstallationSlidesModel buildModel({
    ApplicationState? state,
    bool? isDone,
    bool? hasError,
    bool? isInstalling,
    Stream<String>? log,
    InstallationEvent? event,
    bool? isLogVisible,
    bool? isPlaying,
    ProductInfo? productInfo,
  }) {
    final model = MockInstallationSlidesModel();
    when(model.state).thenReturn(state);
    when(model.isDone).thenReturn(isDone ?? false);
    when(model.hasError).thenReturn(hasError ?? false);
    when(model.isInstalling).thenReturn(isInstalling ?? false);
    when(model.log).thenAnswer((_) => log ?? Stream<String>.empty());
    when(model.event).thenReturn(event ?? InstallationEvent.fromString(''));
    when(model.isLogVisible).thenReturn(isLogVisible ?? false);
    when(model.isPlaying).thenReturn(isPlaying ?? false);
    when(model.productInfo)
        .thenReturn(productInfo ?? ProductInfo(name: 'Ubuntu'));
    return model;
  }

  Widget buildPage(InstallationSlidesModel model) {
    return ChangeNotifierProvider<InstallationSlidesModel>.value(
      value: model,
      child: SlidesContext(slides: [
        (context) => SizedBox.expand(child: Text('slide1')),
        (context) => SizedBox.expand(child: Text('slide2')),
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
      of: find.byType(SlideView),
      matching: find.text(text),
    );
  }

  testWidgets('show slides', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));
    await tester.pumpAndSettle();

    expect(find.byType(SlideView), findsOneWidget);

    expect(findsSlide('slide1'), findsOneWidget);
  });

  testWidgets('navigate slides', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));
    await tester.pumpAndSettle();

    final backButton = find.widgetWithIcon(IconButton, YaruIcons.pan_start);
    expect(backButton, findsOneWidget);

    final nextButton = find.widgetWithIcon(IconButton, YaruIcons.pan_end);
    expect(nextButton, findsOneWidget);

    // initially at first slide
    expect(findsSlide('slide1'), findsOneWidget);
    expect(findsSlide('slide2'), findsNothing);
    expect(tester.widget<IconButton>(backButton).onPressed, isNull);
    expect(tester.widget<IconButton>(nextButton).onPressed, isNotNull);

    // go to second slide
    await tester.tap(find.iconButton(YaruIcons.pan_end));
    await tester.pumpAndSettle();
    expect(findsSlide('slide1'), findsNothing);
    expect(findsSlide('slide2'), findsOneWidget);
    expect(tester.widget<IconButton>(backButton).onPressed, isNotNull);
    expect(tester.widget<IconButton>(nextButton).onPressed, isNull);

    // back to first slide
    await tester.tap(find.iconButton(YaruIcons.pan_start));
    await tester.pumpAndSettle();
    expect(findsSlide('slide1'), findsOneWidget);
    expect(findsSlide('slide2'), findsNothing);
    expect(tester.widget<IconButton>(backButton).onPressed, isNull);
    expect(tester.widget<IconButton>(nextButton).onPressed, isNotNull);
  });

  double getLogOffset(WidgetTester tester) {
    final slide = find.byType(AnimatedSlide);
    expect(slide, findsOneWidget);
    return tester.widget<AnimatedSlide>(slide).offset.dy;
  }

  testWidgets('show log', (tester) async {
    final model = buildModel(isLogVisible: false);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));
    await tester.pumpAndSettle();

    expect(getLogOffset(tester), equals(1.0));

    await tester.tap(find.iconButton(YaruIcons.terminal));
    verify(model.toggleLogVisibility()).called(1);
  });

  testWidgets('hide log', (tester) async {
    final model = buildModel(isLogVisible: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));
    await tester.pumpAndSettle();

    expect(getLogOffset(tester), equals(0.0));

    await tester.tap(find.iconButton(YaruIcons.terminal));
    verify(model.toggleLogVisibility()).called(1);
  });

  testWidgets('installation state', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));
    await tester.pumpAndSettle();

    expect(find.text(tester.lang.copyingFiles), findsOneWidget);
    expect(find.text(tester.lang.installingSystem), findsNothing);
    expect(find.text(tester.lang.configuringSystem), findsNothing);
    expect(find.text(tester.lang.installationFailed), findsNothing);

    when(model.event)
        .thenReturn(InstallationEvent.fromString('installing system'));
    await tester.pumpWidget(Container(
      key: ValueKey('force rebuild for installing system'),
      child: tester.buildApp((_) => buildPage(model)),
    ));
    await tester.pump();

    expect(find.text(tester.lang.installingSystem), findsOneWidget);
    expect(find.text(tester.lang.copyingFiles), findsNothing);
    expect(find.text(tester.lang.configuringSystem), findsNothing);
    expect(find.text(tester.lang.installationFailed), findsNothing);

    when(model.event)
        .thenReturn(InstallationEvent.fromString('final system configuration'));
    await tester.pumpWidget(Container(
      key: ValueKey('force rebuild for configuring system'),
      child: tester.buildApp((_) => buildPage(model)),
    ));
    await tester.pump();

    expect(find.text(tester.lang.configuringSystem), findsOneWidget);
    expect(find.text(tester.lang.copyingFiles), findsNothing);
    expect(find.text(tester.lang.installingSystem), findsNothing);
    expect(find.text(tester.lang.installationFailed), findsNothing);

    when(model.hasError).thenReturn(true);
    await tester.pumpWidget(Container(
      key: ValueKey('force rebuild for hasError'),
      child: tester.buildApp((_) => buildPage(model)),
    ));
    await tester.pump();

    expect(find.text(tester.lang.installationFailed), findsOneWidget);
    expect(find.text(tester.lang.copyingFiles), findsNothing);
    expect(find.text(tester.lang.installingSystem), findsNothing);
    expect(find.text(tester.lang.configuringSystem), findsNothing);
  });

  testWidgets('creates a model', (tester) async {
    final never = Completer<ApplicationStatus>();
    final client = MockSubiquityClient();
    when(client.getStatus(current: anyNamed('current')))
        .thenAnswer((_) => never.future);
    registerMockService<SubiquityClient>(client);

    registerMockService<JournalService>(MockJournalService());

    final product = MockProductService();
    when(product.getProductInfo()).thenReturn(ProductInfo(name: 'Ubuntu'));
    registerMockService<ProductService>(product);

    await tester.pumpWidget(
      SlidesContext(
        slides: [
          (_) => SizedBox.shrink(),
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
