import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

/// Provides access to the slides in the current context.
class SlidesContext extends InheritedWidget {
  /// Creates an inherited slide widget with the specified slides.
  const SlidesContext({
    super.key,
    required this.slides,
    required super.child,
  });

  /// The installation slides.
  final List<WidgetBuilder> slides;

  /// Returns the flavor data for the given context.
  static List<WidgetBuilder> of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SlidesContext>()!.slides;
  }

  @override
  bool updateShouldNotify(SlidesContext oldWidget) {
    final listEquals = const ListEquality().equals;
    return !listEquals(slides, oldWidget.slides);
  }
}
