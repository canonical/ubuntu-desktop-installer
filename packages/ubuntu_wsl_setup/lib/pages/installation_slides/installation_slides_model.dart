import 'dart:async';

import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:subiquity_client/subiquity_client.dart';

enum InstallationState {
  /// WSL is registering the distro.
  registering,

  /// Something went wrong before setup started.
  preSetupError,

  /// Server startup failed.
  serverStartupError,

  /// Server is up and running.
  serverUp,

  /// Slide show is done.
  proceedToSetup,
}

/// A view-model for the WSL installation slides wizard page, fed by the
/// launcher console output and the [SubiquityStatusMonitor] status.
/// The slide show is meant to be displayed as long as we wait for the WSL
/// registration up until the Subiquity server is up and running.
/// Severe error messages output from the WSL distro launcher causes the bottom
/// status area to change to let the user know something went wrong.
class InstallationSlidesModel extends SafeChangeNotifier {
  InstallationSlidesModel({
    required Stream<String> journal,
    required this.monitor,
  })  : _journal = journal,
        super();

  InstallationState _state = InstallationState.registering;
  InstallationState get state => _state;

  final Stream<String> _journal;
  Stream<String> get journal => _journal;

  final SubiquityStatusMonitor monitor;
  StreamSubscription? _monitorSubs;

  StreamSubscription? _journalSubs;

  late void Function() _onServerUp;

  var _logVisible = false;

  /// Initializes the model interconnections. [onServerUp] callback is a special
  /// listener that will be triggered once (and only once) the model
  /// [notifyListeners] due the server up state transition.
  void init({required void Function() onServerUp}) {
    _onServerUp = onServerUp;
    // We may be requested after the server is ready.
    if (isServerUp) {
      _setState(InstallationState.serverUp);
    } else {
      // Otherwise let's monitor its readiness.
      _monitorSubs = monitor.onStatusChanged.listen((status) {
        if (status?.state == ApplicationState.ERROR) {
          _setState(InstallationState.serverStartupError);
        }
        if (status != null && status.state != ApplicationState.ERROR) {
          _setState(InstallationState.serverUp);
        }
      });
      _journalSubs = _journal.listen((event) {
        if (event.startsWith('Error:') || event.startsWith('ERROR:')) {
          _setState(InstallationState.preSetupError);
        }
      });
    }
  }

  void _setState(InstallationState value) {
    if (_state == InstallationState.proceedToSetup || _state == value) {
      return;
    }
    _state = value;
    if (_state == InstallationState.serverUp) {
      _state = InstallationState.proceedToSetup;
      _journalSubs?.cancel();
      _journalSubs = null;
      _onServerUp();
    }

    notifyListeners();
  }

  bool get hasError =>
      _state == InstallationState.preSetupError ||
      _state == InstallationState.serverStartupError;

  bool get isRegistering => _state == InstallationState.registering;

  bool get isLogVisible => _logVisible;

  void toggleLogVisibility() {
    _logVisible = !_logVisible;
    notifyListeners();
  }

  bool get isServerUp =>
      monitor.status != null && monitor.status!.state != ApplicationState.ERROR;

  @override
  void dispose() {
    _monitorSubs?.cancel();
    _journalSubs?.cancel();
    super.dispose();
  }
}
