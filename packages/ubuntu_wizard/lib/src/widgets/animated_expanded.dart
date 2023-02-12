import 'package:flutter/material.dart';

const _kDefaultCurve = Curves.easeIn;
const _kDefaultDuration = Duration(milliseconds: 200);

/// Animated version of [Expanded] that transitions its size and opacity.
class AnimatedExpanded extends StatefulWidget {
  /// Control whether the given [child] is [expanded].
  const AnimatedExpanded({
    super.key,
    required this.child,
    required this.expanded,
    this.curve = _kDefaultCurve,
    this.duration = _kDefaultDuration,
  });

  /// The child that expands or collapses.
  final Widget child;

  /// Switches between expanding the child or collapsing it.
  final bool expanded;

  /// Animation curve.
  final Curve curve;

  /// Animation duration.
  final Duration duration;

  @override
  State<AnimatedExpanded> createState() => _AnimatedExpandedState();
}

class _AnimatedExpandedState extends State<AnimatedExpanded>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      flex: widget.expanded ? 1 : 0,
      child: AnimatedSize(
        curve: widget.curve,
        duration: widget.duration,
        child: AnimatedOpacity(
          curve: widget.curve,
          duration: widget.duration,
          opacity: widget.expanded ? 1 : 0,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: widget.expanded ? double.infinity : 0,
              maxHeight: widget.expanded ? double.infinity : 0,
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
