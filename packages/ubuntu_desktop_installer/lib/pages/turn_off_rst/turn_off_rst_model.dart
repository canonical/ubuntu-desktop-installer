import 'dart:io' as io;

import 'package:flutter/foundation.dart';
import 'package:subiquity_client/subiquity_client.dart';

/// View model for [TurnOffRSTPage].
class TurnOffRSTModel {
  /// Creates an instance with the given client.
  TurnOffRSTModel(this._client);

  final SubiquityClient _client;

  /// Requests system reboot.
  Future<void> reboot({
    @visibleForTesting void Function(int exitCode) exit = io.exit,
  }) async {
    // TODO: await for reboot result
    _client.reboot();
    exit(0);
  }
}
