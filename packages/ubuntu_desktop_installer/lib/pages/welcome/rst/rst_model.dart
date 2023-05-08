import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';

/// @internal
final log = Logger('RST');

/// View model for [RstPage].
class RstModel extends SafeChangeNotifier {
  /// Creates an instance with the given client.
  RstModel(this._client) {
    log.info('RST must be turned off');
  }

  final SubiquityClient _client;

  Future<void> reboot() => _client.reboot(immediate: true);
}
