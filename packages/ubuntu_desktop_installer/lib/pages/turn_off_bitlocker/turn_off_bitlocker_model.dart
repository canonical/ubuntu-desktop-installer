import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/utils.dart';

/// View model for [TurnOffBitLockerPage].
class TurnOffBitLockerModel with SystemShutdown {
  /// Creates an instance with the given client.
  TurnOffBitLockerModel(this.client);

  @override
  final SubiquityClient client;

  /// Requests an immediate system reboot.
  Future<void> reboot({bool immediate = true}) {
    return super.reboot(immediate: immediate);
  }
}
