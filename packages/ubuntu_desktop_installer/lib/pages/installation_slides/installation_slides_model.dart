import 'package:flutter/foundation.dart';
import 'package:subiquity_client/subiquity_client.dart';

export 'package:subiquity_client/subiquity_client.dart' show ApplicationState;

/// View model for [InstallationSlidesPage].
class InstallationSlidesModel extends ChangeNotifier {
  /// Creates an instance with the given client.
  InstallationSlidesModel(this._client);

  final SubiquityClient _client;
  var _status = ApplicationStatus();

  /// Whether the installation is complete.
  bool get isDone => _state == ApplicationState.DONE;

  /// Whether the installation state is unknown.
  bool get isUnknown => _state == ApplicationState.UNKNOWN;

  /// Whether an error has occurred.
  bool get hasError => _state == ApplicationState.ERROR;

  /// Whether the installation process is active.
  bool get isInstalling => !isDone && !hasError;

  /// The current installation step.
  int get currentStep => _state.index;

  /// The total number of installation steps (excludes unknown & error states).
  int get totalSteps => ApplicationState.values.length - 2;

  ApplicationState get _state => _status.state ?? ApplicationState.UNKNOWN;

  void _updateStatus(ApplicationStatus status) {
    if (_status == status) return;
    _status = status;
    notifyListeners();
  }

  /// Initializes and starts monitoring the status of the installation.
  Future<void> init() {
    return _client.status().then((status) {
      _updateStatus(status);
      _monitorStatus();
    });
  }

  Future<void> _monitorStatus() async {
    while (!isUnknown && !isDone && !hasError) {
      await _client.status(current: _state).then(_updateStatus);
    }
  }

  /// Requests system reboot.
  Future<void> reboot() => _client.reboot();
}
