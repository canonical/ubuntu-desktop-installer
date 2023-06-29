import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'slide_transitions.dart';

/// The default interval for automatic slide changes.
const kDefaultSlideInterval = Duration(seconds: 25);

/// Displays a set of slides, or any widgets, that animate in and out at a
/// specified interval. The slides can be manually navigated by pressing arrow
/// buttons on the sides, too.
class SlideView extends StatefulWidget {
  /// Creates a slide show with the given slides and interval.
  SlideView({
    super.key,
    required this.controller,
    required this.slides,
    this.interval = kDefaultSlideInterval,
    this.wrap = false,
    this.autofocus = false,
    this.focusNode,
    this.onSlide,
  }) : assert(slides.isNotEmpty);

  /// Controls the current slide.
  final ValueNotifier<int> controller;

  /// The list of slides to show.
  final List<WidgetBuilder> slides;

  /// The interval for automatic slide changes. Defaults to [kDefaultSlideInterval].
  final Duration interval;

  /// Whether to wrap around. The default value is false.
  final bool wrap;

  /// Whether to automatically request keyboard focus.
  final bool autofocus;

  /// Defines the keyboard focus for the slide show.
  final FocusNode? focusNode;

  /// Called when the current slide changes.
  final ValueChanged<int>? onSlide;

  @override
  State<SlideView> createState() => _SlideViewState();
}

class _SlideViewState extends State<SlideView> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(restartTimer);
    restartTimer();
  }

  @override
  void didUpdateWidget(SlideView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.interval != widget.interval) {
      restartTimer();
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(restartTimer);
    _timer?.cancel();
    super.dispose();
  }

  void restartTimer() {
    _timer?.cancel();
    if (widget.interval > Duration.zero) {
      _timer = Timer.periodic(widget.interval, (_) => nextSlide());
    }
  }

  int get slideCount => widget.slides.length;
  int get currentSlide => widget.controller.value;

  void setSlide(int slide) {
    widget.controller.value = slide;
    widget.onSlide?.call(slide);
  }

  void nextSlide() {
    final nextSlide = currentSlide + 1;
    if (widget.wrap) {
      setSlide(nextSlide % slideCount);
    } else if (nextSlide < slideCount) {
      setSlide(nextSlide);
    }
  }

  void previousSlide() {
    final previousSlide = currentSlide - 1;
    if (previousSlide >= 0 || widget.wrap) {
      setSlide(previousSlide >= 0 ? previousSlide : slideCount - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.arrowLeft): previousSlide,
        const SingleActivator(LogicalKeyboardKey.arrowRight): nextSlide,
      },
      child: Focus(
        autofocus: widget.autofocus,
        focusNode: widget.focusNode,
        child: Theme(
          data: Theme.of(context).copyWith(
            pageTransitionsTheme: const SlideTransitionsTheme(),
          ),
          child: ValueListenableBuilder<int>(
              valueListenable: widget.controller,
              builder: (context, value, child) {
                return Navigator(
                  pages: [
                    for (var i = 0; i <= value; ++i)
                      SlidePage(
                        key: ValueKey(i),
                        child: widget.slides[i](context),
                      ),
                  ],
                  onPopPage: (route, result) => route.didPop(result),
                );
              }),
        ),
      ),
    );
  }
}
