import 'package:flutter/foundation.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/utils.dart';

/// Implements the business logic of the WSL Configuration UI page.
///
/// See also:
///  * [ConfigurationUIPage]
class ConfigurationUIModel extends ChangeNotifier {
  /// Creates a advanced setup model.
  ConfigurationUIModel(this._client) {
    _conf.addListener(notifyListeners);
  }

  final SubiquityClient _client;
  final _conf = ValueNotifier(WSLConfigurationAdvanced());

  /// Whether legacy GUI integration is enabled.
  bool get legacyGUI => _conf.value.legacyGui ?? false;
  set legacyGUI(bool value) {
    _conf.value = _conf.value.copyWith(legacyGui: value);
  }

  /// Whether legacy audio integration is enabled.
  bool get legacyAudio => _conf.value.legacyAudio ?? false;
  set legacyAudio(bool value) {
    _conf.value = _conf.value.copyWith(legacyAudio: value);
  }

  /// Whether advanced IP detection is enabled.
  bool get advancedIPDetection => _conf.value.advIpDetect ?? false;
  set advancedIPDetection(bool value) {
    _conf.value = _conf.value.copyWith(advIpDetect: value);
  }

  /// Whether WSL MOTD news are enabled.
  bool get wslMotdNews => _conf.value.wslMotdNews ?? true;
  set wslMotdNews(bool value) {
    _conf.value = _conf.value.copyWith(wslMotdNews: value);
  }

  /// Whether automount is enabled.
  bool get automount => _conf.value.automount ?? true;
  set automount(bool value) {
    _conf.value = _conf.value.copyWith(automount: value);
  }

  /// Whether `/etc/fstab` will be mounted.
  bool get mountFstab => _conf.value.mountfstab ?? true;
  set mountFstab(bool value) {
    _conf.value = _conf.value.copyWith(mountfstab: value);
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
    return _client
        .setWslConfigurationAdvanced(_conf.value)
        .then((_) => closeWindow());
  }
}
