import 'package:flutter/material.dart';

const double _kDefaultBorderWidth = 1.0;
const double _kDefaultBorderRadius = 5.0;

/// A scrollable list view with a rounded border.
class RoundedListView extends StatelessWidget {
  /// Creates a scrollable list of widgets that are created on demand.
  const RoundedListView.builder({
    Key? key,
    required ScrollController controller,
    required int itemCount,
    required IndexedWidgetBuilder itemBuilder,
    Color? borderColor,
    double? borderWidth,
    double? borderRadius,
  })  : _controller = controller,
        _itemCount = itemCount,
        _itemBuilder = itemBuilder,
        _borderColor = borderColor,
        _borderWidth = borderWidth,
        _borderRadius = borderRadius,
        super(key: key);

  final ScrollController _controller;
  final int _itemCount;
  final IndexedWidgetBuilder _itemBuilder;
  final Color? _borderColor;
  final double? _borderWidth;
  final double? _borderRadius;

  @override
  Widget build(BuildContext context) {
    final borderWidth = _borderWidth ?? _kDefaultBorderWidth;
    final borderRadius = _borderRadius ?? _kDefaultBorderRadius;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: _borderColor ?? Theme.of(context).dividerColor,
          width: borderWidth,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Scrollbar(
        controller: _controller,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius - borderWidth / 2),
          child: Material(
            child: ListView.builder(
              controller: _controller,
              itemCount: _itemCount,
              itemBuilder: _itemBuilder,
            ),
          ),
        ),
      ),
    );
  }
}
