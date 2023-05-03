import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// TODO: expose YaruTogglable for testing
// ignore: implementation_imports
import 'package:yaru_widgets/src/widgets/yaru_togglable.dart';

/// Matches an enabled (editable or tappable) widget.
final isEnabled = _IsEnabledMatcher(true);

/// Matches a disabled (editable or tappable) widget.
final isDisabled = _IsEnabledMatcher(false);

/// Matches a focusable widget that has focus.
final hasFocus = _HasFocusMatcher(true);

/// Matches a focusable widget that doesn't have focus.
final hasNoFocus = _HasFocusMatcher(false);

/// Matches a checked (togglable) widget.
final isChecked = _IsCheckedMatcher(true);

/// Matches an unchecked (togglable) widget.
final isNotChecked = _IsCheckedMatcher(false);

class _IsCheckedMatcher extends CustomMatcher {
  _IsCheckedMatcher(bool? value)
      : super('Togglable widget is checked', 'checked', equals(value));

  @override
  Object? featureValueOf(covariant Finder finder) {
    final togglables = find
        .descendant(
            of: finder,
            matching: find.bySubtype<YaruTogglable>(),
            matchRoot: true)
        .evaluate()
        .map((e) => e.widget as YaruTogglable);
    return togglables.single.checked;
  }
}

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
    final togglables = find
        .descendant(
            of: finder,
            matching: find.bySubtype<YaruTogglable>(),
            matchRoot: true)
        .evaluate()
        .map((e) => e.widget as YaruTogglable);
    final tappables = find
        .descendant(
            of: finder,
            matching: find.bySubtype<InkResponse>(),
            matchRoot: true)
        .evaluate()
        .map((e) => e.widget as InkResponse);
    return !editables.any((e) => e.enabled == false) &&
        !togglables.any((e) => e.interactive == false) &&
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
        .map((e) => e.widget as Focus);
    return focusables.any((f) => f.focusNode?.hasFocus == true);
  }
}
