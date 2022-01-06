import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ubuntu_wizard/widgets.dart';

const _kCardWidth = 348.0;
const _kIconSpacing = 8.0;

/// Defines an installation slide.
class Slide {
  /// Creates a slide with the specified builders.
  const Slide({required this.title, required this.body});

  /// The title of the slide.
  final WidgetBuilder title;

  /// The body of the slide.
  final WidgetBuilder body;
}

/// Provides access to the slides in the current context.
class Slides extends InheritedWidget {
  /// Creates an inherited slide widget with the specified slides.
  Slides({
    Key? key,
    required this.slides,
    required Widget child,
  }) : super(key: key, child: child);

  /// The installation slides.
  final List<Slide> slides;

  /// Returns the flavor data for the given context.
  static List<Slide> of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Slides>()!.slides;
  }

  @override
  bool updateShouldNotify(Slides oldWidget) => slides != oldWidget.slides;
}

/// A common slide layout with background, content, and image. The background
/// fills the entire slide, and the alignment of the content and the image can
/// be specified.
class SlideLayout extends StatelessWidget {
  const SlideLayout({
    Key? key,
    this.background,
    this.content,
    this.contentAlignment,
    this.image,
    this.imageAlignment,
    this.padding,
  }) : super(key: key);

  /// The background of the slide, usually an image.
  final Widget? background;

  /// The content of the slide. See also [contentAlignment].
  final Widget? content;

  /// The alignment of the content. Defaults to `Alignment.center`.
  final AlignmentGeometry? contentAlignment;

  /// The image of the slide. See also [imageAlignment].
  final Widget? image;

  /// The alignment of the image. Defaults to `Alignment.center`.
  final AlignmentGeometry? imageAlignment;

  /// The padding around the content and image.
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

/// A rich text label with an optional icon.
class SlideLabel extends StatelessWidget {
  /// Creates a text-only label.
  const SlideLabel(
    this.text, {
    Key? key,
    double? width,
  })  : icon = null,
        _fontSize = FontSize.medium,
        _width = width,
        super(key: key);

  /// Creates a rich text label with a large font suitable for headers.
  const SlideLabel.large(
    this.text, {
    Key? key,
    double? width,
  })  : icon = null,
        _fontSize = FontSize.xLarge,
        _width = width,
        super(key: key);

  /// Creates a plain text label prefixed with an icon.
  const SlideLabel.icon({
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
        style: {'body': Style(fontSize: _fontSize, margin: EdgeInsets.zero)},
      );
    }

    return Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
      SlideImage.icon(icon!),
      const SizedBox(width: _kIconSpacing),
      Text(text),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final label = _buildLabel(context);
    return _width == null ? label : SizedBox(width: _width, child: label);
  }
}

/// A rounded card background for labels and lists. By default, the background
/// color is 50% translucent theme background color.
class SlideCard extends StatelessWidget {
  const SlideCard({
    Key? key,
    this.border,
    this.borderRadius,
    this.backgroundColor,
    this.padding,
    this.width = _kCardWidth,
    required this.child,
  }) : super(key: key);

  /// The background color of the card. Defaults to 50% translucent theme
  /// background color.
  final Color? backgroundColor;

  /// The border of the card. No border by default.
  final Border? border;

  /// The border radius of the card. Defaults to 4.
  final BorderRadiusGeometry? borderRadius;

  /// The padding between the card and its child. Defaults to 16.
  final EdgeInsetsGeometry? padding;

  /// The total width of the card.
  final double? width;

  /// The content of the card.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: padding ?? const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: border,
        borderRadius:
            borderRadius ?? const BorderRadius.all(Radius.circular(4)),
        color:
            backgroundColor ?? Theme.of(context).backgroundColor.withAlpha(128),
      ),
      child: child,
    );
  }
}

/// Loads images from the standard locations for slide image assets.
extension SlideImage on Image {
  /// Loads an asset image from `assets/slides`.
  static Widget asset(String name) {
    return FlavorImage.asset('assets/slides/$name');
  }

  /// Loads an asset image from `assets/slides/icons`.
  static Widget icon(String name) {
    return FlavorImage.asset('assets/slides/icons/$name');
  }

  /// Loads an asset image from `assets/slides/screenshots`.
  static Widget screenshot(String name) {
    return FlavorImage.asset('assets/slides/screenshots/$name');
  }
}
