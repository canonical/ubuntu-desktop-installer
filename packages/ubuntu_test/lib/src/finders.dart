import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

extension UbuntuCommonFinders on CommonFinders {
  /// Finds elements that match any given [matchers].
  Finder any(List<Finder> matchers) => _AnyFinder(matchers);

  /// Finds a button specified by its [label].
  ///
  /// The button can be any [ButtonStyleButton] subclass,
  /// such as [FilledButton], [OutlinedButton], or [ElevatedButton].
  Finder button(String label) {
    return ancestor(
      of: find.text(label),
      matching: find.bySubtype<ButtonStyleButton>(),
    );
  }

  /// Finds [YaruCheckButton] by [text].
  Finder checkButton(String text) {
    return widgetWithText(YaruCheckButton, text);
  }

  /// Finds any [IconButton] or [ButtonStyleButton] by [icon].
  Finder iconButton(IconData icon) {
    return ancestor(
      of: byIcon(icon),
      matching: any([
        bySubtype<ButtonStyleButton>(),
        bySubtype<IconButton>(),
        bySubtype<YaruIconButton>(),
      ]),
    );
  }

  /// Finds [MenuItemButton] by [text].
  Finder menuItem(String text) {
    return widgetWithText(MenuItemButton, text);
  }

  /// Finds [ListTile] by [text].
  Finder listTile(String text, {bool skipOffstage = true}) {
    return widgetWithText(ListTile, text, skipOffstage: skipOffstage);
  }

  /// Finds [Radio] or [YaruRadio] by [value].
  Finder radio<T>(T value) {
    return byWidgetPredicate(
      (w) =>
          (w is Radio<T> && w.value == value) ||
          (w is YaruRadio<T> && w.value == value),
    );
  }

  /// Finds [YaruRadioButton] by [text].
  Finder radioButton<T>(String text) {
    return widgetWithText(YaruRadioButton<T>, text);
  }

  /// Finds [YaruSwitchButton] by [text].
  Finder switchButton(String text) {
    return widgetWithText(YaruSwitchButton, text);
  }

  /// Finds a [TextField] specified by its [label] (or hint).
  Finder textField(String label) => find.widgetWithText(TextField, label);
}

class _AnyFinder extends Finder {
  _AnyFinder(List<Finder> matchers) : matchers = matchers.cast();

  final List<MatchFinder> matchers;

  @override
  String get description => 'matches any $matchers';

  @override
  Iterable<Element> apply(Iterable<Element> candidates) {
    return candidates.where((c) => matchers.any((f) => f.matches(c)));
  }
}
