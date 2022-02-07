import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

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
class SlidesContext extends InheritedWidget {
  /// Creates an inherited slide widget with the specified slides.
  SlidesContext({
    Key? key,
    required this.slides,
    required Widget child,
  }) : super(key: key, child: child);

  /// The installation slides.
  final List<Slide> slides;

  /// Returns the flavor data for the given context.
  static List<Slide> of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SlidesContext>()!.slides;
  }

  @override
  bool updateShouldNotify(SlidesContext oldWidget) {
    final listEquals = const ListEquality().equals;
    return !listEquals(slides, oldWidget.slides);
  }
}
