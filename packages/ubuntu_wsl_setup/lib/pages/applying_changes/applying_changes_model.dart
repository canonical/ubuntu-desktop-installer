import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/utils.dart';

extension InstallingState on ApplicationState {
  bool get isInstalling =>
      index > ApplicationState.STARTING_UP.index &&
      index < ApplicationState.DONE.index;
}

/// Implements the business logic of the WSL Applying Changes Page.
///
/// See also:
///  * [ApplyingChangesPage]
class ApplyingChangesModel {
  /// Creates a model for the 'applying changes' page.
  ApplyingChangesModel(this._monitor) {
    _isInstalling = _monitor.onStatusChanged
        .map((event) => event?.state?.isInstalling == true); // could be null
  }

  final SubiquityStatusMonitor _monitor;
  late final Stream<bool> _isInstalling;
  Stream<bool> isInstalling() => _isInstalling;
}
