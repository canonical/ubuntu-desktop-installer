import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension UbuntuCommonFinders on CommonFinders {
  /// Finds a [TextField] specified by its [label] (or hint).
  Finder textField(String label) => find.widgetWithText(TextField, label);
}
