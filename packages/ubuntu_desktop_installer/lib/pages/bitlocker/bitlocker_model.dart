import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';

/// @internal
final log = Logger('bitlocker');

/// View model for [BitLockerPage].
class BitLockerModel {
  /// Creates an instance with the given client.
  BitLockerModel(this._client) {
    log.info('BitLocker must be turned off');
  }

  final SubiquityClient _client;

  Future<void> reboot() => _client.reboot(immediate: true);
}
