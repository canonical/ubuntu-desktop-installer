import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:subiquity_client/subiquity_client.dart';

import '../../installing_state.dart';

/// Implements the business logic of the WSL Applying Changes Page.
///
/// See also:
///  * [ApplyingChangesPage]
class ApplyingChangesModel extends SafeChangeNotifier {
  /// Creates a model for the 'applying changes' page.
  ApplyingChangesModel(this._monitor);

  final SubiquityStatusMonitor _monitor;
  StreamSubscription<ApplicationStatus?>? _sub;
  bool _previousState = true;

  void init({required VoidCallback onDoneTransition}) {
    _sub = _monitor.onStatusChanged.listen((status) {
      if (status?.state?.isInstalling == false && _previousState == true) {
        _previousState = false;
        onDoneTransition();
      } else {
        notifyListeners();
      }
    });
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}
