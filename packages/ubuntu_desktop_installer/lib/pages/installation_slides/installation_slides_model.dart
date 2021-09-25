import 'package:flutter/foundation.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/utils.dart';

export 'package:subiquity_client/subiquity_client.dart' show ApplicationState;

/// View model for [InstallationSlidesPage].
class InstallationSlidesModel extends ChangeNotifier with SystemShutdown {
  /// Creates an instance with the given client.
  InstallationSlidesModel(this.client);

  @override
  final SubiquityClient client;

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

  void _updateStatus(ApplicationStatus? status) {
    if (state == status?.state) return;
    _status = status;
    notifyListeners();
  }

  /// Initializes and starts monitoring the status of the installation.
  Future<void> init() {
    return client.status().then((status) {
      _updateStatus(status);
      _monitorStatus();
    });
  }

  Future<void> _monitorStatus() async {
    while (!isDone && !hasError) {
      await client.status(current: state).then(_updateStatus);
    }
  }

  /// Requests an immediate system reboot.
  Future<void> reboot({bool immediate = true}) {
    return super.reboot(immediate: immediate);
  }
}
