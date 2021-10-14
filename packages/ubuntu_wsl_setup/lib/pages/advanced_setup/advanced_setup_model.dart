import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:subiquity_client/subiquity_client.dart';

/// Implements the business logic of the WSL Advanced Setup page.
class AdvancedSetupModel extends ChangeNotifier {
  /// Creates an advanced setup model.
  AdvancedSetupModel(this._client) {
    _conf.addListener(notifyListeners);
  }

  final SubiquityClient _client;
  final _conf = ValueNotifier(WSLConfigurationBase());

  /// Location for the automount.
  String get mountLocation => _conf.value.automountRoot ?? '';
  set mountLocation(String value) {
    _conf.value = _conf.value.copyWith(automountRoot: value);
  }

  /// Option passed for the automount.
  String get mountOption => _conf.value.automountOptions ?? '';
  set mountOption(String value) {
    _conf.value = _conf.value.copyWith(automountOptions: value);
  }

  /// Whether to enable /etc/hosts re-generation at every start.
  bool get enableHostGeneration => _conf.value.networkGeneratehosts ?? true;
  set enableHostGeneration(bool value) {
    _conf.value = _conf.value.copyWith(networkGeneratehosts: value);
  }

  /// Whether to enable /etc/resolv.conf re-generation at every start.
  bool get enableResolvConfGeneration =>
      _conf.value.networkGenerateresolvconf ?? true;
  set enableResolvConfGeneration(bool value) {
    _conf.value = _conf.value.copyWith(networkGenerateresolvconf: value);
  }

  /// Returns `true` if the mount location is valid.
  static bool isValidMountLocation(String? path) {
    if (path == null || path.isEmpty) return true;
    return p.isAbsolute(path);
  }

  /// Whether the current input is valid.
  bool get isValid => isValidMountLocation(mountLocation);

  /// Loads the advanced setup.
  Future<void> loadAdvancedSetup() async {
    return _client.wslConfigurationBase().then((conf) => _conf.value = conf);
  }

  /// Saves the advanced setup.
  Future<void> saveAdvancedSetup() async {
    return _client.setWslConfigurationBase(_conf.value);
  }
}
