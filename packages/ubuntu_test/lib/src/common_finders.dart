import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension UbuntuCommonFinders on CommonFinders {
  /// Finds [TextField] by [text] (or hint/label).
  Finder textField(String text, {bool skipOffstage = true}) {
    return widgetWithText(TextField, text, skipOffstage: skipOffstage);
  }
}
