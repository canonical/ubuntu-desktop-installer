import 'package:flutter/foundation.dart';

enum SecureBootMode { turnoff, dontinstall }

class TurnOffSecureBootModel extends ChangeNotifier {
  TurnOffSecureBootModel({
    required SecureBootMode secureBootMode,
  }) : _mode = secureBootMode;

  SecureBootMode _mode;
  SecureBootMode get secureBootMode => _mode;

  void setSecureBootMode(SecureBootMode? mode) {
    if (mode == null || mode == _mode) {
      return;
    }

    _mode = mode;
    notifyListeners();
  }
}
