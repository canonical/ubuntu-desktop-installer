import 'package:flutter/foundation.dart';
import 'package:subiquity_client/subiquity_client.dart';

extension BusyState on ApplicationState {
  bool get isInstalling =>
      index > ApplicationState.STARTING_UP.index &&
      index < ApplicationState.DONE.index;
}

/// Implements the business logic of the WSL Applying Changes Page.
///
/// See also:
///  * [ApplyingChangesPage ]
class ApplyingChangesModel extends ChangeNotifier {
  /// Creates a advanced setup model.
  ApplyingChangesModel(this._monitor) {
    _isInstalling = _monitor.onStatusChanged
        .map((event) => event?.state?.isInstalling == true); // could be null
  }

  final SubiquityStatusMonitor _monitor;
  late final Stream<bool> _isInstalling;
  Stream<bool> isInstalling() => _isInstalling;
}
