import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/slides/default_slides.dart';
import 'package:ubuntu_desktop_installer/slides/slide_widgets.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../test/test_utils.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.window.devicePixelRatioTestValue = 1;
  binding.window.physicalSizeTestValue = const Size(960, 680);

  Widget buildSlide(Slide slide, {Locale? locale}) {
    return Flavor(
      data: const FlavorData(name: 'Ubuntu'),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: yaruLight,
        locale: locale,
        supportedLocales: supportedLocales,
        localizationsDelegates: localizationsDelegates,
        home: Scaffold(
          appBar: YaruWindowTitleBar(
            title: Builder(builder: slide.title),
          ),
          body: Builder(builder: slide.body),
        ),
      ),
    );
  }

  void expectSlide({
    String? title,
    String? text,
    String? description,
    String? background,
    String? screenshot,
  }) {
    if (title != null) expect(find.text(title), findsOneWidget);
    if (text != null) expect(find.text(text), findsOneWidget);
    if (description != null) expect(find.html(description), findsOneWidget);
    if (background != null) expect(find.asset(background), findsOneWidget);
    if (screenshot != null) expect(find.asset(screenshot), findsOneWidget);
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
    expect(defaultSlides.length, equals(8),
        reason:
            'Update `installation_slides_test.dart` to match the number of slides');
  });

  testWidgets('welcome', (tester) async {
    final locale = localeVariant.currentValue!;
    final slide = buildSlide(defaultSlides[0], locale: locale);
    if (!await tester.pumpSlide(slide)) {
      await dumpSlide('photos', locale);
    }

    final l10n = await AppLocalizations.delegate.load(locale);
    expectSlide(
      title: l10n.welcomeSlideTitle('Ubuntu'),
      text: l10n.welcomeSlideDescription('Ubuntu'),
      background: 'welcome.png',
    );
  }, variant: localeVariant);

  testWidgets('software', (tester) async {
    final locale = localeVariant.currentValue!;
    final slide = buildSlide(defaultSlides[1], locale: locale);
    if (!await tester.pumpSlide(slide)) {
      await dumpSlide('software', locale);
    }

    final l10n = await AppLocalizations.delegate.load(locale);
    expectSlide(
      title: l10n.softwareSlideTitle,
      description: l10n.softwareSlideDescription('Ubuntu'),
      screenshot: 'software.png',
      background: 'background.png',
    );
  }, variant: localeVariant);

  testWidgets('music', (tester) async {
    final locale = localeVariant.currentValue!;
    final slide = buildSlide(defaultSlides[2], locale: locale);
    if (!await tester.pumpSlide(slide)) {
      await dumpSlide('music', locale);
    }

    final l10n = await AppLocalizations.delegate.load(locale);
    expectSlide(
      title: l10n.musicSlideTitle,
      description: l10n.musicSlideDescription('Ubuntu'),
      screenshot: 'music.png',
      background: 'background.png',
    );
  }, variant: localeVariant);

  testWidgets('photos', (tester) async {
    final locale = localeVariant.currentValue!;
    final slide = buildSlide(defaultSlides[3], locale: locale);
    if (!await tester.pumpSlide(slide)) {
      await dumpSlide('photos', locale);
    }

    final l10n = await AppLocalizations.delegate.load(locale);
    expectSlide(
      title: l10n.photoSlideTitle,
      description: l10n.photoSlideDescription,
      screenshot: 'photos.png',
      background: 'background.png',
    );
  }, variant: localeVariant);

  testWidgets('web', (tester) async {
    final locale = localeVariant.currentValue!;
    final slide = buildSlide(defaultSlides[4], locale: locale);
    if (!await tester.pumpSlide(slide)) {
      await dumpSlide('photos', locale);
    }

    final l10n = await AppLocalizations.delegate.load(locale);
    expectSlide(
      title: l10n.webSlideTitle,
      description: l10n.webSlideDescription('Ubuntu'),
      screenshot: 'web.png',
      background: 'background.png',
    );
  }, variant: localeVariant);

  testWidgets('office', (tester) async {
    final locale = localeVariant.currentValue!;
    final slide = buildSlide(defaultSlides[5], locale: locale);
    if (!await tester.pumpSlide(slide)) {
      await dumpSlide('photos', locale);
    }

    final l10n = await AppLocalizations.delegate.load(locale);
    expectSlide(
      title: l10n.officeSlideTitle,
      description: l10n.officeSlideDescription,
      screenshot: 'office.png',
      background: 'background.png',
    );
  }, variant: localeVariant);

  testWidgets('access', (tester) async {
    final locale = localeVariant.currentValue!;
    final slide = buildSlide(defaultSlides[6], locale: locale);
    if (!await tester.pumpSlide(slide)) {
      await dumpSlide('access', locale);
    }

    final l10n = await AppLocalizations.delegate.load(locale);
    expectSlide(
      title: l10n.accessSlideTitle,
      description: l10n.accessSlideDescription('Ubuntu'),
      screenshot: 'settings.png',
      background: 'background.png',
    );
  }, variant: localeVariant);

  testWidgets('support', (tester) async {
    final locale = localeVariant.currentValue!;
    final slide = buildSlide(defaultSlides[7], locale: locale);
    if (!await tester.pumpSlide(slide)) {
      await dumpSlide('photos', locale);
    }

    final l10n = await AppLocalizations.delegate.load(locale);
    expectSlide(
      title: l10n.supportSlideTitle,
      description: l10n.supportSlideResources,
      background: 'welcome.png',
    );
  }, variant: localeVariant);
}

extension SlideTester on WidgetTester {
  Future<bool> pumpSlide(Widget slide) async {
    return runZoned(() async {
      FlutterErrorDetails? error;
      FlutterError.onError = (e) => FlutterError.dumpErrorToConsole(error = e);
      await pumpWidget(slide);
      await pumpAndSettle();
      return error == null;
    });
  }
}

final localeVariant = ValueVariant(supportedLocales.toSet()
  ..removeWhere(unsupportedCupertinoLocalizations.contains));

// TODO: https://github.com/canonical/ubuntu-flutter-plugins/issues/140
final unsupportedCupertinoLocalizations = {
  const Locale('bo'),
  const Locale('cy'),
  const Locale('dz'),
  const Locale('eo'),
  const Locale('ga'),
  const Locale('ku'),
  const Locale('nn'),
  const Locale('oc'),
  const Locale('se'),
  const Locale('tg'),
  const Locale('ug'),
};
