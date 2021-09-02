import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/utils.dart';

/// View model for [TurnOffRSTPage].
class TurnOffRSTModel with SystemShutdown {
  /// Creates an instance with the given client.
  TurnOffRSTModel(this.client);

  @override
  final SubiquityClient client;
}
