import 'package:flutter/material.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../l10n.dart';
import 'slide_widgets.dart';

const _kHeaderWidth = 480.0;
const _kCardWidth = 348.0;
const _kInsets = EdgeInsets.fromLTRB(72, 56, 48, 24);
const _kSmallSpacing = 8.0;
const _kLargeSpacing = 16.0;

/// The list of default installation slides.
final defaultSlides = <Slide>[
  _welcomeSlide,
  _softwareSlide,
  _musicSlide,
  _photoSlide,
  _webSlide,
  _officeSlide,
  _accessSlide,
  _supportSlide,
];

final _welcomeSlide = Slide(
  title: (context) => Text(context.lang.welcomeSlideTitle(context.flavor.name)),
  body: (context) {
    return SlideLayout(
      padding: _kInsets,
      contentAlignment: Alignment.topLeft,
      background: SlideImage.asset('welcome.png'),
      content: SlideLabel.large(
        context.lang.welcomeSlideDescription(context.flavor.name),
        width: _kHeaderWidth,
      ),
    );
  },
);

final _softwareSlide = Slide(
  title: (context) => Text(context.lang.softwareSlideTitle),
  body: (context) {
    return SlideLayout(
      padding: _kInsets,
      contentAlignment: Alignment.topLeft,
      imageAlignment: Alignment.bottomRight,
      background: SlideImage.asset('background.png'),
      content: SlideCard(
        width: _kCardWidth,
        child: SlideLabel(
          context.lang.softwareSlideDescription(context.flavor.name),
        ),
      ),
      image: SlideImage.screenshot('software.png'),
    );
  },
);

final _musicSlide = Slide(
  title: (context) => Text(context.lang.musicSlideTitle),
  body: (context) {
    return SlideLayout(
      padding: _kInsets,
      contentAlignment: Alignment.topLeft,
      imageAlignment: Alignment.bottomRight,
      background: SlideImage.asset('background.png'),
      content: _SlideColumn(
        spacing: _kSmallSpacing,
        children: [
          SlideCard(
            width: _kCardWidth,
            child: SlideLabel(
              context.lang.musicSlideDescription(context.flavor.name),
            ),
          ),
          SlideCard(
            width: _kCardWidth,
            child: _SlideColumn(
              spacing: _kLargeSpacing,
              children: <Widget>[
                _SlideColumn(
                  spacing: _kSmallSpacing,
                  children: <Widget>[
                    SlideLabel(context.lang.includedSoftware),
                    SlideLabel.icon(
                      icon: 'rhythmbox.png',
                      text: context.lang.musicSlideRhythmbox,
                    ),
                  ],
                ),
                _SlideColumn(
                  spacing: _kSmallSpacing,
                  children: <Widget>[
                    SlideLabel(context.lang.availableSoftware),
                    SlideLabel.icon(
                      icon: 'spotify.png',
                      text: context.lang.musicSlideSpotify,
                    ),
                    SlideLabel.icon(
                      icon: 'vlc.png',
                      text: context.lang.musicSlideVLC,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      image: SlideImage.screenshot('music.png'),
    );
  },
);

final _photoSlide = Slide(
  title: (context) => Text(context.lang.photoSlideTitle),
  body: (context) {
    return SlideLayout(
      padding: _kInsets,
      contentAlignment: Alignment.topLeft,
      imageAlignment: Alignment.bottomRight,
      background: SlideImage.asset('background.png'),
      content: _SlideColumn(
        spacing: _kSmallSpacing,
        children: [
          SlideCard(
            width: _kCardWidth,
            child: SlideLabel(context.lang.photoSlideDescription),
          ),
          SlideCard(
            width: _kCardWidth,
            child: _SlideColumn(
              spacing: _kLargeSpacing,
              children: <Widget>[
                _SlideColumn(
                  spacing: _kSmallSpacing,
                  children: <Widget>[
                    SlideLabel(context.lang.includedSoftware),
                    SlideLabel.icon(
                      icon: 'shotwell.png',
                      text: context.lang.photoSlideShotwell,
                    ),
                  ],
                ),
                _SlideColumn(
                  spacing: _kSmallSpacing,
                  children: <Widget>[
                    SlideLabel(context.lang.supportedSoftware),
                    SlideLabel.icon(
                      icon: 'gimp.png',
                      text: context.lang.photoSlideGimp,
                    ),
                    SlideLabel.icon(
                      icon: 'shotcut.png',
                      text: context.lang.photoSlideShotcut,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      image: SlideImage.screenshot('photos.png'),
    );
  },
);

final _webSlide = Slide(
  title: (context) => Text(context.lang.webSlideTitle),
  body: (context) {
    return SlideLayout(
      padding: _kInsets,
      contentAlignment: Alignment.topLeft,
      imageAlignment: Alignment.bottomRight,
      background: SlideImage.asset('background.png'),
      content: _SlideColumn(
        spacing: _kSmallSpacing,
        children: [
          SlideCard(
            width: _kCardWidth,
            child: SlideLabel(
              context.lang.webSlideDescription(context.flavor.name),
            ),
          ),
          SlideCard(
            width: _kCardWidth,
            child: _SlideColumn(
              spacing: _kLargeSpacing,
              children: <Widget>[
                _SlideColumn(
                  spacing: _kSmallSpacing,
                  children: [
                    SlideLabel(context.lang.includedSoftware),
                    SlideLabel.icon(
                      icon: 'firefox.png',
                      text: context.lang.webSlideFirefox,
                    ),
                    SlideLabel.icon(
                      icon: 'thunderbird.png',
                      text: context.lang.webSlideThunderbird,
                    ),
                  ],
                ),
                _SlideColumn(
                  spacing: _kSmallSpacing,
                  children: [
                    SlideLabel(context.lang.supportedSoftware),
                    SlideLabel.icon(
                      icon: 'chromium.png',
                      text: context.lang.webSlideChromium,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      image: SlideImage.screenshot('web.png'),
    );
  },
);

final _officeSlide = Slide(
  title: (context) => Text(context.lang.officeSlideTitle),
  body: (context) {
    return SlideLayout(
      padding: _kInsets,
      contentAlignment: Alignment.topLeft,
      imageAlignment: Alignment.bottomRight,
      background: SlideImage.asset('background.png'),
      content: _SlideColumn(
        spacing: _kSmallSpacing,
        children: [
          SlideCard(
            width: _kCardWidth,
            child: SlideLabel(context.lang.officeSlideDescription),
          ),
          SlideCard(
            width: _kCardWidth,
            child: _SlideColumn(
              spacing: _kSmallSpacing,
              children: <Widget>[
                SlideLabel(context.lang.includedSoftware),
                SlideLabel.icon(
                  icon: 'libreoffice-writer.png',
                  text: context.lang.officeSlideWriter,
                ),
                SlideLabel.icon(
                  icon: 'libreoffice-calc.png',
                  text: context.lang.officeSlideCalc,
                ),
                SlideLabel.icon(
                  icon: 'libreoffice-impress.png',
                  text: context.lang.officeSlideImpress,
                ),
              ],
            ),
          ),
        ],
      ),
      image: SlideImage.screenshot('office.png'),
    );
  },
);

final _accessSlide = Slide(
  title: (context) => Text(context.lang.accessSlideTitle),
  body: (context) {
    return SlideLayout(
      padding: _kInsets,
      contentAlignment: Alignment.topLeft,
      imageAlignment: Alignment.bottomRight,
      background: SlideImage.asset('background.png'),
      content: _SlideColumn(
        spacing: _kSmallSpacing,
        children: [
          SlideCard(
            width: _kCardWidth,
            child: SlideLabel(
              context.lang.accessSlideDescription(context.flavor.name),
            ),
          ),
          SlideCard(
            width: _kCardWidth,
            child: _SlideColumn(
              spacing: _kSmallSpacing,
              children: <Widget>[
                SlideLabel(context.lang.accessSlideCustomizationOptions),
                SlideLabel.icon(
                  icon: 'themes.png',
                  text: context.lang.officeSlideWriter,
                ),
                SlideLabel.icon(
                  icon: 'access.png',
                  text: context.lang.accessSlideAssistiveTechnologies,
                ),
                SlideLabel.icon(
                  icon: 'languages.png',
                  text: context.lang.accessSlideLanguageSupport,
                ),
              ],
            ),
          ),
        ],
      ),
      image: SlideImage.screenshot('settings.png'),
    );
  },
);

final _supportSlide = Slide(
  title: (context) => Text(context.lang.supportSlideTitle),
  body: (context) {
    return SlideLayout(
      padding: _kInsets,
      contentAlignment: Alignment.topLeft,
      background: SlideImage.asset('welcome.png'),
      content: _SlideColumn(
        spacing: _kLargeSpacing,
        children: [
          SlideLabel.large(
            context.lang.supportSlideDocumentation(context.flavor.name),
            width: _kHeaderWidth,
          ),
          SlideLabel.large(
            context.lang.supportSlideQuestions,
            width: _kHeaderWidth,
          ),
          SlideLabel.large(
            context.lang.supportSlideResources,
            width: _kHeaderWidth,
          ),
        ],
      ),
    );
  },
);

class _SlideColumn extends StatelessWidget {
  const _SlideColumn({Key? key, required this.children, required this.spacing})
      : super(key: key);

  final List<Widget> children;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _withSpacing(children, spacing ?? 0),
    );
  }

  static List<Widget> _withSpacing(List<Widget> children, double spacing) {
    return children
        .expand((item) sync* {
          yield SizedBox(height: spacing);
          yield item;
        })
        .skip(1)
        .toList();
  }
}

extension _SlideContext on BuildContext {
  FlavorData get flavor => Flavor.of(this);
  AppLocalizations get lang => AppLocalizations.of(this);
}
