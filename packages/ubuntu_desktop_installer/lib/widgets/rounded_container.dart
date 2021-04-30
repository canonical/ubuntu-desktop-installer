import 'package:flutter/material.dart';

const double _kDefaultBorderWidth = 1.0;
const double _kDefaultBorderRadius = 5.0;

/// A container with a rounded border.
class RoundedContainer extends StatelessWidget {
  /// Creates a container with a rounded border.
  const RoundedContainer({
    Key? key,
    this.child,
    this.width,
    this.height,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.constraints,
  }) : super(key: key);

  /// See [Container.child]
  final Widget? child;

  /// See [Container.width]
  final double? width;

  /// See [Container.height]
  final double? height;

  /// See [BoxDecoration.border]
  final Color? borderColor;

  /// See [BoxDecoration.border]
  final double? borderWidth;

  /// See [BoxDecoration.borderRadius]
  final double? borderRadius;

  /// See [Container.constraints]
  final BoxConstraints? constraints;

  double get _borderWidth => borderWidth ?? _kDefaultBorderWidth;
  double get _borderRadius => borderRadius ?? _kDefaultBorderRadius;

  Color _borderColor(BuildContext context) {
    return borderColor ?? Theme.of(context).dividerColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      constraints: constraints,
      decoration: BoxDecoration(
        border: Border.all(color: _borderColor(context), width: _borderWidth),
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      child: ClipRRect(
        child: Material(child: child),
        borderRadius: BorderRadius.circular(_borderRadius - _borderWidth / 2),
      ),
    );
  }
}
