import 'package:subiquity_client/subiquity_client.dart';

import '../../utils.dart';

/// View model for [TurnOffBitLockerPage].
class TurnOffBitLockerModel {
  /// Creates an instance with the given client.
  TurnOffBitLockerModel(this._client);

  final SubiquityClient _client;

  /// Requests system reboot.
  Future<void> reboot() {
    return _client.reboot().then((_) => closeWindow());
  }
}
