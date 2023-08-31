import 'package:flutter/material.dart';

/// A widget that smoothly transitions from the [animation] widget to the result
/// of the [builder]'s invocation, but not before [animationDuration] (or as
/// long as [builder] returns null).

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
    this.animationDuration = DefaultSplashWidget.duration,
    this.transitionDuration = const Duration(seconds: 1),
    this.animation = const DefaultSplashWidget(),
    this.background = DefaultSplashWidget.mainColor,
    required this.builder,
  });

  /// The animation to be presented as the splash screen.
  final Widget animation;

  /// The [animation] duration.
  final Duration animationDuration;

  /// The [background] behind the animation.
  final Color background;

  /// Builder invoked when it's allowed to replace the splash animation.
  final Widget? Function(BuildContext) builder;

  /// The duration of the transition between the splash animation and its replacement contents.
  final Duration transitionDuration;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool canTransition = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.animationDuration, () {
      if (mounted) {
        setState(() => canTransition = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: widget.background,
      child: AnimatedSwitcher(
        duration: widget.transitionDuration,
        child: selectChild(context),
      ),
    );
  }

  Widget selectChild(BuildContext context) {
    if (canTransition == false) {
      return widget.animation;
    }

    final newChild = widget.builder(context);
    if (newChild == null) {
      return widget.animation;
    }

    return newChild;
  }
}

// The widget presented as the default animation.
class DefaultSplashWidget extends StatefulWidget {
  const DefaultSplashWidget({super.key});

  static const duration = Duration(milliseconds: 5300);
  static const asset = AssetImage('assets/splash_animation.gif');
  // Average color computed from the GIF's first frame.
  static const mainColor = Color(0xfffcfcfc);

  @override
  State<DefaultSplashWidget> createState() => _DefaultSplashWidgetState();
}

class _DefaultSplashWidgetState extends State<DefaultSplashWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      precacheImage(DefaultSplashWidget.asset, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Image(
      image: DefaultSplashWidget.asset,
      fit: BoxFit.cover,
      width: MediaQuery.of(context).size.width,
    );
  }
}
