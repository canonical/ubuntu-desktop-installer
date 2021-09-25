import 'package:subiquity_client/subiquity_client.dart';

import 'package:ubuntu_wizard/utils.dart';

/// View model for [InstallationCompletePage].
class InstallationCompleteModel with SystemShutdown {
  /// Creates an instance with the given client.
  InstallationCompleteModel(this.client);

  @override
  final SubiquityClient client;
}
