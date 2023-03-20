import 'package:flutter/widgets.dart';

// Overrides the mouse cursor for a subtree of widgets by stacking a mouse
// region on top of the child.
//
// Note: This is intended as a workaround for widgets that do not support
// themeable mouse cursors. Prefer using FooThemeData.mouseCursor instead
// whenever possible.
class OverrideMouseCursor extends StatelessWidget {
  const OverrideMouseCursor({
    super.key,
    required this.child,
    required this.cursor,
  });

  final Widget child;
  final MouseCursor cursor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned.fill(
          child: MouseRegion(cursor: cursor, opaque: false),
        )
      ],
    );
  }
}
