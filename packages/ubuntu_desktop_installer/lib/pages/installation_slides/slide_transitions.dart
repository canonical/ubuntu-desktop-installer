import 'package:flutter/material.dart';

class SlidePage<T> extends MaterialPage<T> {
  const SlidePage({
    super.key,
    super.name,
    super.arguments,
    required super.child,
  });

  @override
  Route<T> createRoute(BuildContext context) => _SlideRoute(page: this);
}

class _SlideRoute<T> extends PageRoute<T> with MaterialRouteTransitionMixin<T> {
  _SlideRoute({required SlidePage<T> page}) : super(settings: page);

  @override
  bool get maintainState => false;

  @override
  bool get fullscreenDialog => false;

  @override
  Duration get transitionDuration => const Duration(seconds: 1);

  @override
  Widget buildContent(BuildContext context) => (settings as SlidePage).child;
}

class SlideTransitionsTheme extends PageTransitionsTheme {
  const SlideTransitionsTheme()
      : super(builders: const {
          TargetPlatform.linux: _SlideTransitionsBuilder(),
          TargetPlatform.windows: _SlideTransitionsBuilder(),
        });
}

class _SlideTransitionsBuilder extends PageTransitionsBuilder {
  const _SlideTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T>? route,
    BuildContext? context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return _SlideTransitions(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      child: child,
    );
  }
}

class _SlideTransitions extends StatelessWidget {
  _SlideTransitions({
    required Animation<double> animation,
    required Animation<double> secondaryAnimation,
    required this.child,
  })  : _position =
            animation.secondHalf.drive(_tween.chain(_fastOutSlowInTween)),
        _secondaryPosition = secondaryAnimation.firstHalf
            .drive(_secondaryTween.chain(_fastOutSlowInTween)),
        _opacity = animation.secondHalf.drive(_easeInTween),
        _secondaryOpacity = secondaryAnimation.firstHalf.drive(_easeOutTween);

  static final _tween = Tween(begin: const Offset(0.0, 0.05), end: Offset.zero);
  static final _secondaryTween =
      Tween(begin: Offset.zero, end: const Offset(0.0, -0.05));
  static final _fastOutSlowInTween = CurveTween(curve: Curves.fastOutSlowIn);
  static final _easeInTween = CurveTween(curve: Curves.easeIn);
  static final _easeOutTween = CurveTween(curve: Curves.easeOutExpo);

  final Animation<Offset> _position, _secondaryPosition;
  final Animation<double> _opacity, _secondaryOpacity;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final textDirection = Directionality.of(context);
    return SlideTransition(
      position: _secondaryPosition,
      textDirection: textDirection,
      child: FadeTransition(
        opacity: ReverseAnimation(_secondaryOpacity),
        child: SlideTransition(
          position: _position,
          textDirection: textDirection,
          child: FadeTransition(opacity: _opacity, child: child),
        ),
      ),
    );
  }
}

extension on Animation<double> {
  Animation get firstHalf =>
      CurvedAnimation(parent: this, curve: const Interval(0, 0.5));
  Animation get secondHalf =>
      CurvedAnimation(parent: this, curve: const Interval(0.5, 1));
}
