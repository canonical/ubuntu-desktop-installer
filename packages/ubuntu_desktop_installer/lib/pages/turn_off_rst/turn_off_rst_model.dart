import 'package:logger/logger.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/utils.dart';

/// @internal
final log = Logger('turn_off_RST');

/// View model for [TurnOffRSTPage].
class TurnOffRSTModel with SystemShutdown {
  /// Creates an instance with the given client.
  TurnOffRSTModel(this.client) {
    log.info('RST must be turned off');
  }

  @override
  final SubiquityClient client;
}
