import 'package:logger/logger.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/utils.dart';

/// @internal
final log = Logger('turn_off_bitlocker');

/// View model for [TurnOffBitLockerPage].
class TurnOffBitLockerModel with SystemShutdown {
  /// Creates an instance with the given client.
  TurnOffBitLockerModel(this.client) {
    log.info('BitLocker must be turned off');
  }

  @override
  final SubiquityClient client;
}
