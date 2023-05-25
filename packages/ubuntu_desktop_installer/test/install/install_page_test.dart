import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/install/install_model.dart';
import 'package:ubuntu_desktop_installer/pages/install/slide_view.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_test/yaru_test.dart';

import 'test_install.dart';

void main() {
  setUpAll(YaruTestWindow.ensureInitialized);

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

    expect(find.text(tester.lang.copyingFiles), findsOneWidget);
    expect(find.text(tester.lang.installingSystem), findsNothing);
    expect(find.text(tester.lang.configuringSystem), findsNothing);
    expect(find.text(tester.lang.installationFailed), findsNothing);

    when(model.event)
        .thenReturn(InstallationEvent.fromString('installing system'));
    await tester.pumpWidget(Container(
      key: const ValueKey('force rebuild for installing system'),
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
      key: const ValueKey('force rebuild for configuring system'),
      child: tester.buildApp((_) => buildPage(model)),
    ));
    await tester.pump();

    expect(find.text(tester.lang.configuringSystem), findsOneWidget);
    expect(find.text(tester.lang.copyingFiles), findsNothing);
    expect(find.text(tester.lang.installingSystem), findsNothing);
    expect(find.text(tester.lang.installationFailed), findsNothing);

    when(model.hasError).thenReturn(true);
    await tester.pumpWidget(Container(
      key: const ValueKey('force rebuild for hasError'),
      child: tester.buildApp((_) => buildPage(model)),
    ));
    await tester.pump();

    expect(find.text(tester.lang.installationFailed), findsOneWidget);
    expect(find.text(tester.lang.copyingFiles), findsNothing);
    expect(find.text(tester.lang.installingSystem), findsNothing);
    expect(find.text(tester.lang.configuringSystem), findsNothing);
  });

  testWidgets('restart', (tester) async {
    final model = buildModel(isDone: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final restartButton = find.textContaining(tester.lang.restartButtonText);
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

    final continueButton = find.button(tester.lang.continueTesting);
    expect(continueButton, findsOneWidget);

    final windowClosed = YaruTestWindow.waitForClosed();

    await tester.tap(continueButton);
    await tester.pump();
    verifyNever(model.reboot());

    await expectLater(windowClosed, completes);
  });
}
