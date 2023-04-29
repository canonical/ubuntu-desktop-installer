import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension UbuntuCommonFinders on CommonFinders {
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

  /// Finds a [TextField] specified by its [label] (or hint).
  Finder textField(String label) => find.widgetWithText(TextField, label);
}
