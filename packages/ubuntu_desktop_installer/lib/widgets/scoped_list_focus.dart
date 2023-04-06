import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScopedListFocus extends StatelessWidget {
  const ScopedListFocus({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      onKey: (node, event) {
        if (event is! RawKeyDownEvent) {
          return KeyEventResult.ignored;
        }
        if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
          node.focusInDirection(TraversalDirection.down);
        } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
          node.focusInDirection(TraversalDirection.up);
        } else if (event.logicalKey == LogicalKeyboardKey.tab) {
          final siblings = node.parent!.children
              .where((e) =>
                  (e.nearestScope != node && e.canRequestFocus) || e == node)
              .toList();
          for (var i = 0; i < siblings.length; i++) {
            if (siblings[i] == node) {
              siblings[(i + (event.isShiftPressed ? -1 : 1)) % siblings.length]
                  .requestFocus();
              break;
            }
          }
        } else {
          return KeyEventResult.ignored;
        }
        return KeyEventResult.handled;
      },
      child: FocusTraversalGroup(
        policy: WidgetOrderTraversalPolicy(),
        child: child,
      ),
    );
  }
}
