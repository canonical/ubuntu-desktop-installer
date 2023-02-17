import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';

/// @internal
final log = Logger('turn_off_RST');

/// View model for [TurnOffRSTPage].
class TurnOffRSTModel {
  /// Creates an instance with the given client.
  TurnOffRSTModel(this._client) {
    log.info('RST must be turned off');
  }

  final SubiquityClient _client;

  Future<void> reboot() => _client.reboot(immediate: true);
}
