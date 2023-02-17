import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';

/// @internal
final log = Logger('turn_off_bitlocker');

/// View model for [TurnOffBitLockerPage].
class TurnOffBitLockerModel {
  /// Creates an instance with the given client.
  TurnOffBitLockerModel(this._client) {
    log.info('BitLocker must be turned off');
  }

  final SubiquityClient _client;

  Future<void> reboot() => _client.reboot(immediate: true);
}
