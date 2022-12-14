import 'dart:async';

import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/utils.dart';

import '../../installing_state.dart';

/// Implements the business logic of the WSL Applying Changes Page.
///
/// See also:
///  * [ApplyingChangesPage]
class ApplyingChangesModel extends SafeChangeNotifier with SystemShutdown {
  /// Creates a model for the 'applying changes' page.
  ApplyingChangesModel(this.client, this._monitor);

  final SubiquityStatusMonitor _monitor;

  @override
  final SubiquityClient client;
  StreamSubscription<ApplicationStatus?>? _sub;
  bool _previousState = true;

  void init() {
    if (null != _monitor.status && !_monitor.status!.state.isInstalling) {
      _previousState = false;
      reboot(immediate: false);
      return;
    }
    _sub = _monitor.onStatusChanged.listen((status) {
      if (status?.state.isInstalling == false && _previousState == true) {
        _previousState = false;
        reboot(immediate: false);
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
