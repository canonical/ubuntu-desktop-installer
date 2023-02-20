import 'dart:async';

import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:subiquity_client/subiquity_client.dart';

import '../../installing_state.dart';

/// Implements the business logic of the WSL Applying Changes Page.
///
/// See also:
///  * [ApplyingChangesPage]
class ApplyingChangesModel extends SafeChangeNotifier {
  /// Creates a model for the 'applying changes' page.
  ApplyingChangesModel(this._client, this._monitor);

  final SubiquityStatusMonitor _monitor;

  final SubiquityClient _client;
  StreamSubscription<ApplicationStatus?>? _sub;
  bool _previousState = true;

  Future<void> init() async {
    if (null != _monitor.status && !_monitor.status!.state.isInstalling) {
      _previousState = false;
      return _client.reboot(immediate: false);
    }
    final completer = Completer();
    _sub = _monitor.onStatusChanged.listen((status) {
      if (status?.state.isInstalling == false && _previousState == true) {
        _previousState = false;
        _client.reboot(immediate: false).then((_) => completer.complete());
      } else {
        notifyListeners();
      }
    });
    return completer.future;
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}
