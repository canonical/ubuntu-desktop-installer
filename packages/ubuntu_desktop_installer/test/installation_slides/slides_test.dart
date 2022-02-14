import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/slides/default_slides.dart';
import 'package:ubuntu_desktop_installer/slides/slide_widgets.dart';

import '../widget_tester_extensions.dart';

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

  group('default slide', () {
    setUp(() => UbuntuTester.context = Scaffold);

    Finder findAsset(String assetName) {
      return find.byWidgetPredicate((widget) {
        return widget is Image &&
            widget.image is AssetImage &&
            (widget.image as AssetImage).assetName.endsWith(assetName);
      });
    }

    Finder findHtml(String html) {
      return find.byWidgetPredicate((widget) {
        return widget is Html && widget.data == html;
      });
    }

    Future<void> pumpSlide(WidgetTester tester, int index) {
      return tester.pumpWidget(
        tester.buildApp(
          (context) => MediaQuery(
            // shrink the text for testing purposes to avoid overflows when
            // loading slides outside the constrained slideshow environment
            data: MediaQuery.of(context).copyWith(textScaleFactor: 0.5),
            child: Scaffold(
              appBar: AppBar(
                title: Builder(builder: defaultSlides[index].title),
              ),
              body: Builder(builder: defaultSlides[index].body),
            ),
          ),
        ),
      );
    }

    Future<void> expectSlide({
      String? title,
      String? text,
      String? description,
      String? background,
      String? screenshot,
    }) async {
      if (title != null) expect(find.text(title), findsOneWidget);
      if (text != null) expect(find.text(text), findsOneWidget);
      if (description != null) expect(findHtml(description), findsOneWidget);
      if (background != null) expect(findAsset(background), findsOneWidget);
      if (screenshot != null) expect(findAsset(screenshot), findsOneWidget);
    }

    testWidgets('welcome', (tester) async {
      await pumpSlide(tester, 0);
      expectSlide(
        title: tester.lang.welcomeSlideTitle('Ubuntu'),
        text: tester.lang.welcomeSlideDescription('Ubuntu'),
        background: 'welcome.png',
      );
    });

    testWidgets('software', (tester) async {
      await pumpSlide(tester, 1);
      expectSlide(
        title: tester.lang.softwareSlideTitle,
        description: tester.lang.softwareSlideDescription('Ubuntu'),
        screenshot: 'software.png',
        background: 'background.png',
      );
    });

    testWidgets('music', (tester) async {
      await pumpSlide(tester, 2);
      expectSlide(
        title: tester.lang.musicSlideTitle,
        description: tester.lang.musicSlideDescription('Ubuntu'),
        screenshot: 'music.png',
        background: 'background.png',
      );
    });

    testWidgets('photos', (tester) async {
      await pumpSlide(tester, 3);
      expectSlide(
        title: tester.lang.photoSlideTitle,
        description: tester.lang.photoSlideDescription,
        screenshot: 'photos.png',
        background: 'background.png',
      );
    });

    testWidgets('web', (tester) async {
      await pumpSlide(tester, 4);
      expectSlide(
        title: tester.lang.webSlideTitle,
        description: tester.lang.webSlideDescription('Ubuntu'),
        screenshot: 'web.png',
        background: 'background.png',
      );
    });

    testWidgets('office', (tester) async {
      await pumpSlide(tester, 5);
      expectSlide(
        title: tester.lang.officeSlideTitle,
        description: tester.lang.officeSlideDescription,
        screenshot: 'office.png',
        background: 'background.png',
      );
    });

    testWidgets('access', (tester) async {
      await pumpSlide(tester, 6);
      expectSlide(
        title: tester.lang.accessSlideTitle,
        description: tester.lang.accessSlideDescription('Ubuntu'),
        screenshot: 'settings.png',
        background: 'background.png',
      );
    });

    testWidgets('support', (tester) async {
      final launches = <MethodCall>[];
      var channel =
          const MethodChannel('plugins.flutter.io/url_launcher_linux');
      channel.setMockMethodCallHandler((methodCall) async {
        launches.add(methodCall);
      });
      addTearDown((() => channel.setMockMethodCallHandler(null)));

      await pumpSlide(tester, 7);
      expectSlide(
        title: tester.lang.supportSlideTitle,
        description: tester.lang.supportSlideResources,
        background: 'welcome.png',
      );

      void expectLaunchUrl(String label, String url) {
        var found = false;
        expect(find.byWidgetPredicate((widget) {
          if (widget is RichText) {
            if (!widget.text.visitChildren((visitor) {
              if (visitor is TextSpan && visitor.text == label) {
                if (!found) {
                  found = true;
                  (visitor.recognizer as TapGestureRecognizer).onTap!();
                }
                return false;
              }
              return true;
            })) {
              return true;
            }
          }
          return false;
        }), findsOneWidget);

        expect(launches.length, equals(1));
        expect(launches.single.method, equals('launch'));
        expect(launches.single.arguments, contains('url'));
        expect(launches.single.arguments['url'], equals(url));
        launches.clear();
      }

      expectLaunchUrl('Ask Ubuntu', 'https://askubuntu.com');
      expectLaunchUrl('Local Community Team', 'https://loco.ubuntu.com/teams');
      expectLaunchUrl('Community support',
          'https://www.ubuntu.com/support/community-support');
      expectLaunchUrl('Commercial support', 'https://www.ubuntu.com/support');
    });
  });
}
