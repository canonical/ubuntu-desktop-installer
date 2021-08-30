import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/utils.dart';

/// View model for [TurnOffRSTPage].
class TurnOffRSTModel {
  /// Creates an instance with the given client.
  TurnOffRSTModel(this._client);

  final SubiquityClient _client;

  /// Requests system reboot.
  Future<void> reboot() {
    return _client.reboot(immediate: true).then((_) => closeWindow());
  }
}
