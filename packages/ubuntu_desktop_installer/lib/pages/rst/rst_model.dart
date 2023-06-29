import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';

/// @internal
final log = Logger('RST');

final rstModelProvider =
    Provider<RstModel>((_) => RstModel(getService<SubiquityClient>()));

/// View model for [RstPage].
class RstModel {
  /// Creates an instance with the given client.
  RstModel(this._client);

  final SubiquityClient _client;

  Future<bool> hasRst() => _client.hasRst();

  Future<void> reboot() => _client.reboot(immediate: true);
}
