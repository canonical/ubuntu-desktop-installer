import 'package:flutter/foundation.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/utils.dart';

export 'package:subiquity_client/subiquity_client.dart' show ApplicationState;

/// View model for [InstallationSlidesPage].
class InstallationSlidesModel extends ChangeNotifier {
  /// Creates an instance with the given client.
  InstallationSlidesModel(this._client);

  final SubiquityClient _client;
  ApplicationStatus? _status;

  /// The current installation state.
  ApplicationState get state => _status?.state ?? ApplicationState.UNKNOWN;

  /// Whether the installation state is DONE.
  bool get isDone => state == ApplicationState.DONE;

  /// Whether the installation state is ERROR.
  bool get hasError => state == ApplicationState.ERROR;

  /// Whether the installation process is being prepared [STARTING_UP,RUNNING).
  bool get isPreparing =>
      state.index >= ApplicationState.STARTING_UP.index &&
      state.index < ApplicationState.RUNNING.index;

  /// Whether the installation process is active [RUNNING,DONE).
  bool get isInstalling =>
      state.index >= ApplicationState.RUNNING.index &&
      state.index < ApplicationState.DONE.index;

  /// The current installation step between [RUNNING,DONE], or -1 if the
  /// installation process is not active.
  int get installationStep =>
      isInstalling ? state.index - ApplicationState.RUNNING.index : -1;

  /// The total number of installation steps between [RUNNING,DONE].
  int get installationStepCount =>
      ApplicationState.DONE.index - ApplicationState.RUNNING.index;

  String _formatState(ApplicationState? state) =>
      state?.toString().split('.').last ?? 'null';

  void _updateStatus(ApplicationStatus? status) {
    if (state == status?.state) return;
    print(
        'Subiquity state: ${_formatState(state)} => ${_formatState(status?.state)}');
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
    while (!isDone && !hasError) {
      await _client.status(current: state).then(_updateStatus);
    }
  }

  /// Requests system reboot.
  Future<void> reboot() {
    return _client.reboot(immediate: true).then((_) => closeWindow());
  }
}
