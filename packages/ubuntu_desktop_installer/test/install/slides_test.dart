import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_desktop_installer/slides/default_slides.dart';
import 'package:ubuntu_desktop_installer/slides/slide_widgets.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:ubuntu_wizard/utils.dart';

import '../test_utils.dart';
import 'slides_test.mocks.dart';

@GenerateMocks([UrlLauncher])
void main() {
  setUpAll(() => UbuntuTester.context = Scaffold);

  testWidgets('inherited slides', (tester) async {
    slide1(_) => const Text('slide1');
    slide2(_) => const Text('slide2');

    final widget =
        SlidesContext(slides: [slide1, slide2], child: const Text('page'));
    await tester.pumpWidget(MaterialApp(home: widget));

    final context = tester.element(find.text('page'));

    final slides = SlidesContext.of(context);
    expect(slides, hasLength(2));
    expect((slides.first(context) as Text).data, equals('slide1'));
    expect((slides.last(context) as Text).data, equals('slide2'));

    expect(
      widget.updateShouldNotify(
        SlidesContext(slides: [slide1, slide2], child: const Text('page')),
      ),
      isFalse,
    );
    expect(
      widget.updateShouldNotify(
        SlidesContext(slides: [slide2, slide1], child: const Text('page')),
      ),
      isTrue,
    );
  });

  testWidgets('links', (tester) async {
    final urlLauncher = MockUrlLauncher();
    registerMockService<UrlLauncher>(urlLauncher);

    await tester.pumpWidget(
      tester.buildApp(
        (context) => Scaffold(
          body: Builder(builder: defaultSlides.last),
        ),
      ),
    );

    Future<void> expectLaunchUrl(String label, String url) async {
      when(urlLauncher.launchUrl(url)).thenAnswer((_) async => true);
      await tester.tapLink(label);
      verify(urlLauncher.launchUrl(url)).called(1);
    }

    expectLaunchUrl(
      tester.lang.installationSlidesSupportDocumentation,
      'https://help.ubuntu.com',
    );
    expectLaunchUrl('Ask Ubuntu', 'https://askubuntu.com');
    expectLaunchUrl('Ubuntu Discourse', 'https://discourse.ubuntu.com');
    expectLaunchUrl(
      tester.lang.installationSlidesSupportUbuntuPro,
      'https://ubuntu.com/pro',
    );
  });
}
