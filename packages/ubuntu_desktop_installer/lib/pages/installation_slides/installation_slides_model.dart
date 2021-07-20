import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:subiquity_client/subiquity_client.dart';

export 'package:subiquity_client/subiquity_client.dart' show ApplicationState;

class InstallationSlidesModel extends ChangeNotifier {
  InstallationSlidesModel(this._client) {}

  final SubiquityClient _client;

  Timer? _timer;
  var _status = ApplicationStatus();

  bool get isDone => _state == ApplicationState.DONE;
  bool get hasError => _state == ApplicationState.ERROR;
  bool get isInstalling => !isDone && !hasError;

  int get currentStep => _state.index;
  int get totalSteps => ApplicationState.values.length - 2; // unknown & error

  ApplicationState get _state => _status.state ?? ApplicationState.UNKNOWN;

  void _updateStatus(ApplicationStatus status) {
    if (_status == status) return;
    _status = status;
    notifyListeners();
  }

  Future<void> init() async {
    await _client.status().then((status) {
      _updateStatus(status);
      _watchStatus();
    });
  }

  void _watchStatus() {
    // Note: The status check blocks until the status changes.
    // (This is not polling the status at 100ms interval.)
    _timer = Timer.periodic(const Duration(milliseconds: 100), (_) async {
      await _client.status(current: _state).then(_updateStatus);
      if (isDone || hasError) {
        _unwatchStatus();
      }
    });
  }

  void _unwatchStatus() {
    _timer?.cancel();
    _timer = null;
  }

  Future<void> reboot() {
    _unwatchStatus();
    return _client.reboot();
  }

  @override
  void dispose() {
    _unwatchStatus();
    super.dispose();
  }
}
