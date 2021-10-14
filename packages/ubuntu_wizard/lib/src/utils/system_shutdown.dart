import 'package:logger/logger.dart';
import 'package:subiquity_client/subiquity_client.dart';

import 'window.dart';

/// @internal
final log = Logger('system_shutdown');

/// Provides system shutdown and reboot functionality, and performs the
/// appropriate application cleanup routines to close the window, subiquity
/// socket, and the server if was started by this UI instance.
mixin SystemShutdown {
  /// The client to send shutdown and reboot requests to.
  SubiquityClient get client;

  /// Request system reboot and close the window.
  ///
  /// The [immediate] argument should be `true` if the system should be rebooted
  /// immediately before the installation has finished.
  Future<void> reboot({required bool immediate}) {
    log.info('request reboot (immediate: $immediate)');
    return client.reboot(immediate: immediate).then((_) => closeWindow());
  }

  /// Request system shutdown and close the window.
  ///
  /// The [immediate] argument should be `true` if the system should be shut
  /// down immediately before the installation has finished.
  Future<void> shutdown({required bool immediate}) {
    log.info('request shutdown (immediate: $immediate)');
    return client.shutdown(immediate: immediate).then((_) => closeWindow());
  }
}
