import 'dart:async';

import 'package:flutter/material.dart';

const _kButtonColor = Colors.white;
const _kButtonSize = 80.0;

const _kIconColor = Colors.black87;
const _kIconSize = 48.0;

const _kSlideCurve = Curves.easeInOut;
const _kSlideDuration = Duration(milliseconds: 250);
const _kSlideInterval = Duration(seconds: 45);

/// Displays a set of slides, or any widgets, that animate in and out at a
/// specified interval. The slides can be manually navigated by pressing arrow
/// buttons on the sides, too.
class SlideShow extends StatefulWidget {
  /// Creates a slide show with the given slides and interval.
  SlideShow({
    Key? key,
    required this.slides,
    this.interval = _kSlideInterval,
    this.wrap,
  })  : assert(slides.isNotEmpty),
        super(key: key);

  /// The list of slides to show.
  final List<Widget> slides;

  /// The interval for automatic slide changes.
  final Duration interval;

  /// Whether to wrap around.
  final bool? wrap;

  @override
  State<SlideShow> createState() => _SlideShowState();
}

class _SlideShowState extends State<SlideShow> {
  final _controller = PageController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    restartTimer();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void restartTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(widget.interval, (_) => animateToNextSlide());
  }

  int get slideCount => widget.slides.length;
  int get currentSlide => currentPosition.round();

  double get currentPosition =>
      _controller.hasClients ? _controller.page ?? 0 : 0;

  double clampOpacity(double position) {
    if (widget.wrap == true) return 1.0;
    return position.clamp(0.0, 1.0);
  }

  void animateToSlide(int slide) {
    restartTimer();
    _controller.animateToPage(
      slide,
      curve: _kSlideCurve,
      duration: _kSlideDuration,
    );
  }

  void animateToNextSlide() {
    final nextSlide = currentSlide + 1;
    if (widget.wrap == true) {
      animateToSlide(nextSlide % slideCount);
    } else if (nextSlide < slideCount) {
      animateToSlide(nextSlide);
    }
  }

  void animateToPreviousSlide() {
    final previousSlide = currentSlide - 1;
    if (previousSlide >= 0 || widget.wrap == true) {
      animateToSlide(previousSlide >= 0 ? previousSlide : slideCount - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // PageView doesn't propagate its content's size. Use the first slide
        // to determine the size.
        Opacity(opacity: 0, child: widget.slides.first),
        Positioned.fill(
          child: PageView(
            children: widget.slides,
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          left: -_kButtonSize / 2,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return _SlideButton(
                alignment: Alignment.centerRight,
                icon: const Icon(Icons.chevron_left, size: _kIconSize),
                opacity: clampOpacity(currentPosition),
                onPressed: animateToPreviousSlide,
              );
            },
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          right: -_kButtonSize / 2,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return _SlideButton(
                alignment: Alignment.centerLeft,
                icon: const Icon(Icons.chevron_right, size: _kIconSize),
                opacity: clampOpacity((slideCount - 1 - currentPosition)),
                onPressed: animateToNextSlide,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _SlideButton extends StatelessWidget {
  const _SlideButton({
    Key? key,
    required this.icon,
    required this.alignment,
    required this.opacity,
    required this.onPressed,
  }) : super(key: key);

  final Widget icon;
  final Alignment alignment;
  final double opacity;
  final VoidCallback? onPressed;

  bool get enabled => opacity > 0.5;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Center(
        child: Material(
          elevation: 10,
          color: _kButtonColor,
          type: MaterialType.circle,
          clipBehavior: Clip.antiAlias,
          child: SizedBox(
            width: _kButtonSize,
            height: _kButtonSize,
            child: opacity > 0
                ? ElevatedButton(
                    child: icon,
                    style: ElevatedButton.styleFrom(
                      alignment: alignment,
                      padding: EdgeInsets.zero,
                      shape: const CircleBorder(),
                      primary: _kButtonColor,
                      onPrimary: _kIconColor,
                    ),
                    onPressed: onPressed,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
