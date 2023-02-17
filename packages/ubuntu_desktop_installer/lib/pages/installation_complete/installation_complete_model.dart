import 'package:subiquity_client/subiquity_client.dart';

/// View model for [InstallationCompletePage].
class InstallationCompleteModel {
  /// Creates an instance with the given client.
  InstallationCompleteModel(this._client);

  final SubiquityClient _client;

  Future<void> reboot() => _client.reboot(immediate: false);
}
