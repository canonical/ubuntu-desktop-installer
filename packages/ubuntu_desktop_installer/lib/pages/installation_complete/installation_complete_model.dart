import 'package:subiquity_client/subiquity_client.dart';

import 'package:ubuntu_wizard/utils.dart';

/// View model for [InstallationCompletePage].
class InstallationCompleteModel {
  /// Creates an instance with the given client.
  InstallationCompleteModel(this._client);

  final SubiquityClient _client;

  /// Requests system reboot.
  Future<void> reboot() {
    return _client.reboot().then((_) => closeWindow());
  }
}
