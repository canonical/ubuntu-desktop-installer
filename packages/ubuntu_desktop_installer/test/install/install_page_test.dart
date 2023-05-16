import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages/install/install_model.dart';
import 'package:ubuntu_desktop_installer/pages/install/install_page.dart';
import 'package:ubuntu_desktop_installer/pages/install/slide_view.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_desktop_installer/slides.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_test/yaru_test.dart';

import '../test_utils.dart';
import 'install_page_test.mocks.dart';

@GenerateMocks([InstallModel])
void main() {
  setUpAll(YaruTestWindow.ensureInitialized);

  InstallModel buildModel({
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
    final model = MockInstallModel();
    when(model.state).thenReturn(state);
    when(model.isDone).thenReturn(isDone ?? false);
    when(model.hasError).thenReturn(hasError ?? false);
    when(model.isInstalling).thenReturn(isInstalling ?? false);
    when(model.log).thenAnswer((_) => log ?? const Stream<String>.empty());
    when(model.event).thenReturn(event ?? InstallationEvent.fromString(''));
    when(model.isLogVisible).thenReturn(isLogVisible ?? false);
    when(model.isPlaying).thenReturn(isPlaying ?? false);
    when(model.productInfo)
        .thenReturn(productInfo ?? ProductInfo(name: 'Ubuntu'));
    return model;
  }

  Widget buildPage(InstallModel model) {
    return ProviderScope(
      overrides: [installModelProvider.overrideWith((_) => model)],
      child: SlidesContext(slides: [
        (context) => const SizedBox.expand(child: Text('slide1')),
        (context) => const SizedBox.expand(child: Text('slide2')),
      ], child: const InstallPage()),
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

    final backButton = find.iconButton(YaruIcons.pan_start);
    expect(backButton, findsOneWidget);

    final nextButton = find.iconButton(YaruIcons.pan_end);
    expect(nextButton, findsOneWidget);

    // initially at first slide
    expect(findsSlide('slide1'), findsOneWidget);
    expect(findsSlide('slide2'), findsNothing);
    expect(backButton, isDisabled);
    expect(nextButton, isEnabled);

    // go to second slide
    await tester.tap(nextButton);
    await tester.pumpAndSettle();
    expect(findsSlide('slide1'), findsNothing);
    expect(findsSlide('slide2'), findsOneWidget);
    expect(backButton, isEnabled);
    expect(nextButton, isDisabled);

    // back to first slide
    await tester.tap(backButton);
    await tester.pumpAndSettle();
    expect(findsSlide('slide1'), findsOneWidget);
    expect(findsSlide('slide2'), findsNothing);
    expect(backButton, isDisabled);
    expect(nextButton, isEnabled);
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

    expect(find.al10n((l10n) => l10n.copyingFiles), findsOneWidget);
    expect(find.al10n((l10n) => l10n.installingSystem), findsNothing);
    expect(find.al10n((l10n) => l10n.configuringSystem), findsNothing);
    expect(find.al10n((l10n) => l10n.installationFailed), findsNothing);

    when(model.event)
        .thenReturn(InstallationEvent.fromString('installing system'));
    await tester.pumpWidget(Container(
      key: const ValueKey('force rebuild for installing system'),
      child: tester.buildApp((_) => buildPage(model)),
    ));
    await tester.pump();

    expect(find.al10n((l10n) => l10n.installingSystem), findsOneWidget);
    expect(find.al10n((l10n) => l10n.copyingFiles), findsNothing);
    expect(find.al10n((l10n) => l10n.configuringSystem), findsNothing);
    expect(find.al10n((l10n) => l10n.installationFailed), findsNothing);

    when(model.event)
        .thenReturn(InstallationEvent.fromString('final system configuration'));
    await tester.pumpWidget(Container(
      key: const ValueKey('force rebuild for configuring system'),
      child: tester.buildApp((_) => buildPage(model)),
    ));
    await tester.pump();

    expect(find.al10n((l10n) => l10n.configuringSystem), findsOneWidget);
    expect(find.al10n((l10n) => l10n.copyingFiles), findsNothing);
    expect(find.al10n((l10n) => l10n.installingSystem), findsNothing);
    expect(find.al10n((l10n) => l10n.installationFailed), findsNothing);

    when(model.hasError).thenReturn(true);
    await tester.pumpWidget(Container(
      key: const ValueKey('force rebuild for hasError'),
      child: tester.buildApp((_) => buildPage(model)),
    ));
    await tester.pump();

    expect(find.al10n((l10n) => l10n.installationFailed), findsOneWidget);
    expect(find.al10n((l10n) => l10n.copyingFiles), findsNothing);
    expect(find.al10n((l10n) => l10n.installingSystem), findsNothing);
    expect(find.al10n((l10n) => l10n.configuringSystem), findsNothing);
  });

  testWidgets('restart', (tester) async {
    final model = buildModel(isDone: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final l10n = AppLocalizations.of(tester.element(find.byType(InstallPage)));
    final restartButton = find.textContaining(l10n.restartButtonText);
    expect(restartButton, findsOneWidget);

    final windowClosed = YaruTestWindow.waitForClosed();

    await tester.tap(restartButton);
    await tester.pump();
    verify(model.reboot()).called(1);

    await expectLater(windowClosed, completes);
  });

  testWidgets('continue testing', (tester) async {
    final model = buildModel(isDone: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final continueButton =
        find.button(find.al10n((l10n) => l10n.continueTesting));
    expect(continueButton, findsOneWidget);

    final windowClosed = YaruTestWindow.waitForClosed();

    await tester.tap(continueButton);
    await tester.pump();
    verifyNever(model.reboot());

    await expectLater(windowClosed, completes);
  });
}
