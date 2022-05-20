import 'package:flutter/foundation.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/utils.dart';

/// Implements the business logic of the WSL Setup complete page.
class SetupCompleteModel extends SafeChangeNotifier with SystemShutdown {
  /// Creates a setup complete model.
  SetupCompleteModel(this.client) {
    _identity.addListener(notifyListeners);
  }

  @override
  final SubiquityClient client;

  final _identity = ValueNotifier(const IdentityData());

  /// The username for the profile.
  String get username => _identity.value.username;

  /// Initializes the model.
  Future<void> init() {
    return client.identity().then((identity) => _identity.value = identity);
  }
}
