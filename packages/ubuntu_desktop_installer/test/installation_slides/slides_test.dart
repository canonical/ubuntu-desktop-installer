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

// ignore_for_file: type=lint
@GenerateMocks([UrlLauncher])
void main() {
  testWidgets('inherited slides', (tester) async {
    final slide1 = Slide(
      title: (_) => Text('title1'),
      body: (_) => Text('body1'),
    );

    final slide2 = Slide(
      title: (_) => Text('title2'),
      body: (_) => Text('body2'),
    );

    final widget = SlidesContext(slides: [slide1, slide2], child: Text('page'));
    await tester.pumpWidget(MaterialApp(home: widget));

    final context = tester.element(find.text('page'));

    final slides = SlidesContext.of(context);
    expect(slides, hasLength(2));
    expect((slides.first.title(context) as Text).data, equals('title1'));
    expect((slides.first.body(context) as Text).data, equals('body1'));
    expect((slides.last.title(context) as Text).data, equals('title2'));
    expect((slides.last.body(context) as Text).data, equals('body2'));

    expect(
      widget.updateShouldNotify(
        SlidesContext(slides: [slide1, slide2], child: Text('page')),
      ),
      isFalse,
    );
    expect(
      widget.updateShouldNotify(
        SlidesContext(slides: [slide2, slide1], child: Text('page')),
      ),
      isTrue,
    );
  });

  testWidgets('slide layout', (tester) async {
    Future<void> pumpLayout(
      WidgetTester tester, {
      AlignmentGeometry? contentAlignment,
      AlignmentGeometry? imageAlignment,
      EdgeInsetsGeometry? padding,
    }) {
      return tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: SlideLayout(
              content: Text('content'),
              contentAlignment: contentAlignment,
              image: Text('image'),
              imageAlignment: imageAlignment,
              background: SizedBox(width: 200, height: 200),
              padding: padding,
            ),
          ),
        ),
      );
    }

    await pumpLayout(
      tester,
      contentAlignment: Alignment.center,
      imageAlignment: Alignment.center,
    );

    final layout = find.byType(SlideLayout);
    final content = find.text('content');
    final image = find.text('image');
    final background = find.byType(SizedBox);

    expect(
      tester.getRect(content).intersect(tester.getRect(layout)),
      equals(tester.getRect(content)),
    );
    expect(
      tester.getRect(image).intersect(tester.getRect(layout)),
      equals(tester.getRect(image)),
    );
    expect(tester.getRect(background), equals(tester.getRect(layout)));

    await pumpLayout(
      tester,
      contentAlignment: Alignment.topLeft,
      imageAlignment: Alignment.bottomRight,
      padding: EdgeInsets.fromLTRB(1, 2, 3, 4),
    );

    expect(tester.getTopLeft(content),
        equals(tester.getTopLeft(layout) + Offset(1, 2)));
    expect(tester.getBottomRight(image),
        equals(tester.getBottomRight(layout) - Offset(3, 4)));
    expect(tester.getRect(background), equals(tester.getRect(layout)));
  });

  testWidgets('slide card', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Center(
          child: SlideCard(
            width: 123.4,
            child: Text('card'),
          ),
        ),
      ),
    );

    final container = find.byType(Container);
    expect(container, findsOneWidget);
    expect(tester.getSize(container).width, moreOrLessEquals(123.4));

    final widget = tester.widget<Container>(container);
    expect(widget.padding, isNot(equals(EdgeInsets.zero)));

    final decoration = widget.decoration as BoxDecoration?;
    expect(decoration, isNotNull);

    final color = decoration!.color as Color;
    expect(color.alpha, lessThan(255));

    final radius = decoration.borderRadius as BorderRadius;
    expect(radius.topLeft, isNot(Radius.zero));
    expect(radius.bottomRight, isNot(Radius.zero));
  });

  testWidgets('links', (tester) async {
    final urlLauncher = MockUrlLauncher();
    registerMockService<UrlLauncher>(urlLauncher);

    await tester.pumpWidget(
      tester.buildApp(
        (context) => Scaffold(
          appBar: AppBar(title: Builder(builder: defaultSlides.last.title)),
          body: Builder(builder: defaultSlides.last.body),
        ),
      ),
    );

    Future<void> expectLaunchUrl(String label, String url) async {
      when(urlLauncher.launchUrl(url)).thenAnswer((_) async => true);
      await tester.tapLink(label);
      verify(urlLauncher.launchUrl(url)).called(1);
    }

    expectLaunchUrl('Ask Ubuntu', 'https://askubuntu.com');
    expectLaunchUrl('Local Community Team', 'https://loco.ubuntu.com/teams');
    expectLaunchUrl('Community support',
        'https://www.ubuntu.com/support/community-support');
    expectLaunchUrl('Commercial support', 'https://www.ubuntu.com/support');
  });
}
