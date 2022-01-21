import 'package:flutter/material.dart';

import 'rounded_container.dart';

/// A scrollable list view with a rounded border.
class RoundedListView extends StatelessWidget {
  /// Creates a scrollable list of widgets that are created on demand.
  const RoundedListView.builder({
    Key? key,
    this.controller,
    required this.itemCount,
    required this.itemBuilder,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
  }) : super(key: key);

  /// See [ListView.controller]
  final ScrollController? controller;

  /// See [ListView.builder]
  final int itemCount;

  /// See [ListView.builder]
  final IndexedWidgetBuilder itemBuilder;

  /// See [BoxDecoration.border]
  final Color? borderColor;

  /// See [BoxDecoration.border]
  final double? borderWidth;

  /// See [BoxDecoration.borderRadius]
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      borderColor: borderColor,
      borderWidth: borderWidth,
      borderRadius: borderRadius,
      child: ListView.builder(
        controller: controller,
        itemCount: itemCount,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
