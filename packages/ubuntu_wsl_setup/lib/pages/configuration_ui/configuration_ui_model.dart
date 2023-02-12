import 'package:flutter/foundation.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:subiquity_client/subiquity_client.dart';

/// Implements the business logic of the WSL Configuration UI page.
///
/// See also:
///  * [ConfigurationUIPage]
class ConfigurationUIModel extends SafeChangeNotifier {
  /// Creates a advanced setup model.
  ConfigurationUIModel(this._client) {
    _conf.addListener(notifyListeners);
  }

  final SubiquityClient _client;
  final _conf = ValueNotifier(const WSLConfigurationAdvanced());

  /// Whether the Windows Path will be appended in the PATH environment in WSL.
  bool get interopAppendwindowspath => _conf.value.interopAppendwindowspath;
  set interopAppendwindowspath(bool value) {
    _conf.value = _conf.value.copyWith(interopAppendwindowspath: value);
  }

  /// Whether the interoperability is enabled.
  bool get interopEnabled => _conf.value.interopEnabled;
  set interopEnabled(bool value) {
    _conf.value = _conf.value.copyWith(interopEnabled: value);
  }

  /// Whether automountEnabled is enabled.
  bool get automountEnabled => _conf.value.automountEnabled;
  set automountEnabled(bool value) {
    _conf.value = _conf.value.copyWith(automountEnabled: value);
  }

  /// Whether `/etc/fstab` will be mounted.
  bool get automountMountfstab => _conf.value.automountMountfstab;
  set automountMountfstab(bool value) {
    _conf.value = _conf.value.copyWith(automountMountfstab: value);
  }

  /// Whether the current input is valid.
  bool get isValid => true;

  /// Loads the UI configuration.
  Future<void> loadConfiguration() async {
    return _client
        .wslConfigurationAdvanced()
        .then((conf) => _conf.value = conf);
  }

  /// Saves the UI configuration.
  Future<void> saveConfiguration() async {
    return _client.setWslConfigurationAdvanced(_conf.value);
  }
}
