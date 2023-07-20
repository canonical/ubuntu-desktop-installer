import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ubuntu_bootstrap/ubuntu_bootstrap.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() => registerService(ProductService.new));

  Widget buildSlide(WidgetBuilder slide, {Locale? locale}) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: yaruLight,
        locale: locale,
        supportedLocales: supportedLocales,
        localizationsDelegates: localizationsDelegates,
        home: Scaffold(
          appBar: const YaruWindowTitleBar(
            title: Text('Welcome to Ubuntu'),
            backgroundColor: Colors.transparent,
          ),
          body: Builder(builder: slide),
        ),
      ),
    );
  }

  Future<void> dumpSlide(String name, Locale locale) async {
    final fileName =
        'goldens/failures/installation-slide-$name-${locale.toLanguageTag()}.png';
    debugPrint('Dumping ${Directory.current.path}/$fileName');
    autoUpdateGoldenFiles = true;
    await expectLater(find.byType(MaterialApp), matchesGoldenFile(fileName))
        .then((_) => autoUpdateGoldenFiles = false);
    fail(name);
  }

  test('slides', () {
    expect(defaultSlides.length, equals(9),
        reason:
            'Update `installation_slides_test.dart` to match the number of slides');
  });

  testWidgets('welcome', (tester) async {
    final locale = localeVariant.currentValue!;
    final slide = buildSlide(defaultSlides[0], locale: locale);
    if (!await tester.pumpSlide(slide)) {
      await dumpSlide('welcome', locale);
    }

    final l10n = await UbuntuBootstrapLocalizations.delegate.load(locale);
    expect(find.text(l10n.installationSlidesWelcomeTitle), findsOneWidget);
  }, variant: localeVariant);

  testWidgets('software', (tester) async {
    final locale = localeVariant.currentValue!;
    final slide = buildSlide(defaultSlides[1], locale: locale);
    if (!await tester.pumpSlide(slide)) {
      await dumpSlide('software', locale);
    }

    final l10n = await UbuntuBootstrapLocalizations.delegate.load(locale);
    expect(find.text(l10n.installationSlidesSoftwareTitle), findsOneWidget);
  }, variant: localeVariant);

  testWidgets('development', (tester) async {
    final locale = localeVariant.currentValue!;
    final slide = buildSlide(defaultSlides[2], locale: locale);
    if (!await tester.pumpSlide(slide)) {
      await dumpSlide('development', locale);
    }

    final l10n = await UbuntuBootstrapLocalizations.delegate.load(locale);
    expect(find.text(l10n.installationSlidesDevelopmentTitle), findsOneWidget);
  }, variant: localeVariant);

  testWidgets('creativity', (tester) async {
    final locale = localeVariant.currentValue!;
    final slide = buildSlide(defaultSlides[3], locale: locale);
    if (!await tester.pumpSlide(slide)) {
      await dumpSlide('creativity', locale);
    }

    final l10n = await UbuntuBootstrapLocalizations.delegate.load(locale);
    expect(find.text(l10n.installationSlidesCreativityTitle), findsOneWidget);
  }, variant: localeVariant);

  testWidgets('gaming', (tester) async {
    final locale = localeVariant.currentValue!;
    final slide = buildSlide(defaultSlides[4], locale: locale);
    if (!await tester.pumpSlide(slide)) {
      await dumpSlide('gaming', locale);
    }

    final l10n = await UbuntuBootstrapLocalizations.delegate.load(locale);
    expect(find.text(l10n.installationSlidesGamingTitle), findsOneWidget);
  }, variant: localeVariant);

  testWidgets('security', (tester) async {
    final locale = localeVariant.currentValue!;
    final slide = buildSlide(defaultSlides[5], locale: locale);
    if (!await tester.pumpSlide(slide)) {
      await dumpSlide('security', locale);
    }

    final l10n = await UbuntuBootstrapLocalizations.delegate.load(locale);
    expect(find.text(l10n.installationSlidesSecurityTitle), findsOneWidget);
  }, variant: localeVariant);

  testWidgets('productivity', (tester) async {
    final locale = localeVariant.currentValue!;
    final slide = buildSlide(defaultSlides[6], locale: locale);
    if (!await tester.pumpSlide(slide)) {
      await dumpSlide('productivity', locale);
    }

    final l10n = await UbuntuBootstrapLocalizations.delegate.load(locale);
    expect(find.text(l10n.installationSlidesProductivityTitle), findsOneWidget);
  }, variant: localeVariant);

  testWidgets('accessibility', (tester) async {
    final locale = localeVariant.currentValue!;
    final slide = buildSlide(defaultSlides[7], locale: locale);
    if (!await tester.pumpSlide(slide)) {
      await dumpSlide('accessibility', locale);
    }

    final l10n = await UbuntuBootstrapLocalizations.delegate.load(locale);
    expect(
        find.text(l10n.installationSlidesAccessibilityTitle), findsOneWidget);
  }, variant: localeVariant);

  testWidgets('support', (tester) async {
    final locale = localeVariant.currentValue!;
    final slide = buildSlide(defaultSlides[8], locale: locale);
    if (!await tester.pumpSlide(slide)) {
      await dumpSlide('support', locale);
    }

    final l10n = await UbuntuBootstrapLocalizations.delegate.load(locale);
    expect(find.text(l10n.installationSlidesSupportTitle), findsOneWidget);
  }, variant: localeVariant);
}

extension SlideTester on WidgetTester {
  Future<bool> pumpSlide(Widget slide) async {
    view.devicePixelRatio = 1;
    view.physicalSize = const Size(960, 680);
    return runZoned(() async {
      FlutterErrorDetails? error;
      FlutterError.onError = (e) => FlutterError.dumpErrorToConsole(error = e);
      await pumpWidget(slide);
      await pumpAndSettle();
      return error == null;
    });
  }
}

final localeVariant = ValueVariant(supportedLocales.toSet());
