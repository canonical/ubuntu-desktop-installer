import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Matches an enabled (editable or tappable) widget.
final isEnabled = _IsEnabledMatcher(true);

/// Matches a disabled (editable or tappable) widget.
final isDisabled = _IsEnabledMatcher(false);

/// Matches a focusable widget that has focus.
final hasFocus = _HasFocusMatcher(true);

/// Matches a focusable widget that doesn't have focus.
final hasNoFocus = _HasFocusMatcher(false);

class _IsEnabledMatcher extends CustomMatcher {
  _IsEnabledMatcher(bool value)
      : super('Widget is enabled', 'enabled', equals(value));

  @override
  Object featureValueOf(covariant Finder finder) {
    final editables = find
        .descendant(
            of: finder, matching: find.byType(TextField), matchRoot: true)
        .evaluate()
        .map((e) => e.widget as TextField);
    final tappables = find
        .descendant(of: finder, matching: find.byType(InkWell), matchRoot: true)
        .evaluate()
        .map((e) => e.widget as InkWell);
    return !editables.any((e) => e.enabled == false) &&
        !tappables.any((e) => e.onTap == null);
  }
}

class _HasFocusMatcher extends CustomMatcher {
  _HasFocusMatcher(bool value)
      : super('Widget has focus', 'focus', equals(value));

  @override
  Object featureValueOf(covariant Finder finder) {
    final focusables = find
        .descendant(of: finder, matching: find.byType(Focus), matchRoot: true)
        .evaluate()
        .map((e) => (e.widget as Focus));
    return focusables.any((f) => f.focusNode?.hasFocus == true);
  }
}
