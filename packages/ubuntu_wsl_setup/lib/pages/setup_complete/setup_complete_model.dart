import 'dart:io' as io;

import 'package:flutter/foundation.dart';
import 'package:subiquity_client/subiquity_client.dart';

/// Implements the business logic of the WSL Setup complete page.
class SetupCompleteModel extends ChangeNotifier {
  /// Creates a setup complete model.
  SetupCompleteModel(this._client) {
    _identity.addListener(notifyListeners);
  }

  final SubiquityClient _client;
  final _identity = ValueNotifier(IdentityData());

  /// The username for the profile.
  String get username => _identity.value.username ?? '';

  /// Initializes the model.
  Future<void> init() {
    return _client.identity().then((identity) => _identity.value = identity);
  }

  /// Requests system reboot.
  Future<void> reboot({
    @visibleForTesting void Function(int exitCode) exit = io.exit,
  }) async {
    // TODO: use SystemShutdown from ubuntu_wizard/utils when available
    _client.reboot();
    exit(0);
  }
}
