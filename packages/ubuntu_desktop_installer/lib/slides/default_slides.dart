import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../l10n.dart';
import 'slide_widgets.dart';

const _kHeaderWidth = 420.0;
const _kIconSpacing = 8.0;
const _kCardWidth = 348.0;
const _kInsets = EdgeInsets.fromLTRB(72, 56, 48, 24);
const _kSmallSpacing = 8.0;
const _kLargeSpacing = 16.0;

String _slideAsset(String name) => 'assets/installation_slides/$name.png';
String _slideIcon(String name) => 'assets/installation_slides/icons/$name.png';
String _slideScreenshot(String name) =>
    'assets/installation_slides/screenshots/$name.png';

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
      background: Image.asset(_slideAsset('welcome')),
      content: _SlideLabel.large(
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
      background: Image.asset(_slideAsset('background')),
      content: SlideCard(
        width: _kCardWidth,
        child: _SlideLabel(
          context.lang.softwareSlideDescription(context.flavor.name),
        ),
      ),
      image: Image.asset(_slideScreenshot('software')),
    );
  },
);

final _musicSlide = Slide(
  title: (context) => Text(context.lang.musicSlideTitle),
  body: (context) {
    return SlideLayout(
      background: Image.asset(_slideAsset('background')),
      content: _SlideColumn(
        spacing: _kSmallSpacing,
        children: [
          SlideCard(
            width: _kCardWidth,
            child: _SlideLabel(
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
                    _SlideLabel(context.lang.includedSoftware),
                    _SlideLabel.icon(
                      icon: 'rhythmbox',
                      text: context.lang.musicSlideRhythmbox,
                    ),
                  ],
                ),
                _SlideColumn(
                  spacing: _kSmallSpacing,
                  children: <Widget>[
                    _SlideLabel(context.lang.availableSoftware),
                    _SlideLabel.icon(
                      icon: 'spotify',
                      text: context.lang.musicSlideSpotify,
                    ),
                    _SlideLabel.icon(
                      icon: 'vlc',
                      text: context.lang.musicSlideVLC,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      image: Image.asset(_slideScreenshot('music')),
    );
  },
);

final _photoSlide = Slide(
  title: (context) => Text(context.lang.photoSlideTitle),
  body: (context) {
    return SlideLayout(
      background: Image.asset(_slideAsset('background')),
      content: _SlideColumn(
        spacing: _kSmallSpacing,
        children: [
          SlideCard(
            width: _kCardWidth,
            child: _SlideLabel(context.lang.photoSlideDescription),
          ),
          SlideCard(
            width: _kCardWidth,
            child: _SlideColumn(
              spacing: _kLargeSpacing,
              children: <Widget>[
                _SlideColumn(
                  spacing: _kSmallSpacing,
                  children: <Widget>[
                    _SlideLabel(context.lang.includedSoftware),
                    _SlideLabel.icon(
                      icon: 'shotwell',
                      text: context.lang.photoSlideShotwell,
                    ),
                  ],
                ),
                _SlideColumn(
                  spacing: _kSmallSpacing,
                  children: <Widget>[
                    _SlideLabel(context.lang.supportedSoftware),
                    _SlideLabel.icon(
                      icon: 'gimp',
                      text: context.lang.photoSlideGimp,
                    ),
                    _SlideLabel.icon(
                      icon: 'shotcut',
                      text: context.lang.photoSlideShotcut,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      image: Image.asset(_slideScreenshot('photos')),
    );
  },
);

final _webSlide = Slide(
  title: (context) => Text(context.lang.webSlideTitle),
  body: (context) {
    return SlideLayout(
      background: Image.asset(_slideAsset('background')),
      content: _SlideColumn(
        spacing: _kSmallSpacing,
        children: [
          SlideCard(
            width: _kCardWidth,
            child: _SlideLabel(
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
                    _SlideLabel(context.lang.includedSoftware),
                    _SlideLabel.icon(
                      icon: 'firefox',
                      text: context.lang.webSlideFirefox,
                    ),
                    _SlideLabel.icon(
                      icon: 'thunderbird',
                      text: context.lang.webSlideThunderbird,
                    ),
                  ],
                ),
                _SlideColumn(
                  spacing: _kSmallSpacing,
                  children: [
                    _SlideLabel(context.lang.supportedSoftware),
                    _SlideLabel.icon(
                      icon: 'chromium',
                      text: context.lang.webSlideChromium,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      image: Image.asset(_slideScreenshot('web')),
    );
  },
);

final _officeSlide = Slide(
  title: (context) => Text(context.lang.officeSlideTitle),
  body: (context) {
    return SlideLayout(
      background: Image.asset(_slideAsset('background')),
      content: _SlideColumn(
        spacing: _kSmallSpacing,
        children: [
          SlideCard(
            width: _kCardWidth,
            child: _SlideLabel(context.lang.officeSlideDescription),
          ),
          SlideCard(
            width: _kCardWidth,
            child: _SlideColumn(
              spacing: _kSmallSpacing,
              children: <Widget>[
                _SlideLabel(context.lang.includedSoftware),
                _SlideLabel.icon(
                  icon: 'libreoffice-writer',
                  text: context.lang.officeSlideWriter,
                ),
                _SlideLabel.icon(
                  icon: 'libreoffice-calc',
                  text: context.lang.officeSlideCalc,
                ),
                _SlideLabel.icon(
                  icon: 'libreoffice-impress',
                  text: context.lang.officeSlideImpress,
                ),
              ],
            ),
          ),
        ],
      ),
      image: Image.asset(_slideScreenshot('office')),
    );
  },
);

final _accessSlide = Slide(
  title: (context) => Text(context.lang.accessSlideTitle),
  body: (context) {
    return SlideLayout(
      background: Image.asset(_slideAsset('background')),
      content: _SlideColumn(
        spacing: _kSmallSpacing,
        children: [
          SlideCard(
            width: _kCardWidth,
            child: _SlideLabel(
              context.lang.accessSlideDescription(context.flavor.name),
            ),
          ),
          SlideCard(
            width: _kCardWidth,
            child: _SlideColumn(
              spacing: _kSmallSpacing,
              children: <Widget>[
                _SlideLabel(context.lang.accessSlideCustomizationOptions),
                _SlideLabel.icon(
                  icon: 'themes',
                  text: context.lang.officeSlideWriter,
                ),
                _SlideLabel.icon(
                  icon: 'access',
                  text: context.lang.accessSlideAssistiveTechnologies,
                ),
                _SlideLabel.icon(
                  icon: 'languages',
                  text: context.lang.accessSlideLanguageSupport,
                ),
              ],
            ),
          ),
        ],
      ),
      image: Image.asset(_slideScreenshot('settings')),
    );
  },
);

final _supportSlide = Slide(
  title: (context) => Text(context.lang.supportSlideTitle),
  body: (context) {
    return SlideLayout(
      background: Image.asset(_slideAsset('welcome')),
      content: _SlideColumn(
        spacing: _kLargeSpacing,
        children: [
          _SlideLabel.large(
            context.lang.supportSlideDocumentation(context.flavor.name),
            width: _kHeaderWidth,
          ),
          _SlideLabel.large(
            context.lang.supportSlideQuestions,
            width: _kHeaderWidth,
          ),
          _SlideLabel.large(
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

class _SlideLabel extends StatelessWidget {
  // A text-only label.
  const _SlideLabel(
    this.text, {
    Key? key,
    double? width,
  })  : icon = null,
        _fontSize = FontSize.medium,
        _width = width,
        super(key: key);

  // A rich text label with a large font suitable for headers.
  const _SlideLabel.large(
    this.text, {
    Key? key,
    double? width,
  })  : icon = null,
        _fontSize = FontSize.xLarge,
        _width = width,
        super(key: key);

  // A plain text label prefixed with an icon.
  const _SlideLabel.icon({
    Key? key,
    required this.text,
    this.icon,
    double? width,
  })  : _fontSize = FontSize.medium,
        _width = width,
        super(key: key);

  final String? icon;
  final String text;
  final FontSize? _fontSize;
  final double? _width;

  Widget _buildLabel(BuildContext context) {
    if (icon == null) {
      return Html(
        data: text,
        style: {
          'body': Style(
            color: Colors.white,
            fontSize: _fontSize,
            margin: EdgeInsets.zero,
          ),
          'a': Style(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            textDecoration: TextDecoration.none,
          ),
        },
        onLinkTap: (url, _, __, ___) {
          if (url != null) {
            launchUrl(url);
          }
        },
      );
    }

    return Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Image.asset(_slideIcon(icon!)),
      const SizedBox(width: _kIconSpacing),
      Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final label = _buildLabel(context);
    return _width == null ? label : SizedBox(width: _width, child: label);
  }
}

// A rounded card with a 50% translucent background for labels and lists.
class SlideCard extends StatelessWidget {
  const SlideCard({
    Key? key,
    this.width,
    required this.child,
  }) : super(key: key);

  final double? width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        color: Theme.of(context).shadowColor.withAlpha(64),
      ),
      child: child,
    );
  }
}

// A common slide layout with background, content, and image. The background
// fills the entire slide, and the alignment of the content and the image can
// be specified.
class SlideLayout extends StatelessWidget {
  const SlideLayout({
    Key? key,
    this.background,
    this.content,
    this.contentAlignment = Alignment.topLeft,
    this.image,
    this.imageAlignment = Alignment.bottomRight,
    this.padding = _kInsets,
  }) : super(key: key);

  final Widget? background;
  final Widget? content;
  final AlignmentGeometry? contentAlignment;
  final Widget? image;
  final AlignmentGeometry? imageAlignment;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        if (background != null) background!,
        if (content != null)
          _buildLayout(
            context,
            alignment: contentAlignment ?? Alignment.center,
            child: content!,
          ),
        if (image != null)
          _buildLayout(
            context,
            alignment: imageAlignment ?? Alignment.center,
            child: image!,
          ),
      ],
    );
  }

  Positioned _buildLayout(
    BuildContext context, {
    required Widget child,
    required AlignmentGeometry alignment,
  }) {
    final direction = Directionality.of(context);
    final insets = padding?.resolve(direction) ?? EdgeInsets.zero;
    return Positioned(
      top: insets.top,
      left: insets.left,
      right: insets.right,
      bottom: insets.bottom,
      child: Align(
        alignment: alignment.resolve(direction),
        child: child,
      ),
    );
  }
}

extension _SlideContext on BuildContext {
  FlavorData get flavor => Flavor.of(this);
  AppLocalizations get lang => AppLocalizations.of(this);
}
