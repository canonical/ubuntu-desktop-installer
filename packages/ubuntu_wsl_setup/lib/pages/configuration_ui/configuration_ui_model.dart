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
  bool get interopGuiintegration => _conf.value.interopGuiintegration ?? false;
  set interopGuiintegration(bool value) {
    _conf.value = _conf.value.copyWith(interopGuiintegration: value);
  }

  /// Whether legacy audio integration is enabled.
  bool get interopAudiointegration =>
      _conf.value.interopAudiointegration ?? false;
  set interopAudiointegration(bool value) {
    _conf.value = _conf.value.copyWith(interopAudiointegration: value);
  }

  /// Whether advanced IP detection is enabled.
  bool get advancedIPDetection =>
      _conf.value.interopAdvancedipdetection ?? false;
  set advancedIPDetection(bool value) {
    _conf.value = _conf.value.copyWith(interopAdvancedipdetection: value);
  }

  /// Whether WSL MOTD news are enabled.
  bool get motdWSLnewsenabled => _conf.value.motdWSLnewsenabled ?? true;
  set motdWSLnewsenabled(bool value) {
    _conf.value = _conf.value.copyWith(motdWSLnewsenabled: value);
  }

  /// Whether automountEnabled is enabled.
  bool get automountEnabled => _conf.value.automountEnabled ?? true;
  set automountEnabled(bool value) {
    _conf.value = _conf.value.copyWith(automountEnabled: value);
  }

  /// Whether `/etc/fstab` will be mounted.
  bool get automountMountfstab => _conf.value.automountMountfstab ?? true;
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
    return _client
        .setWslConfigurationAdvanced(_conf.value)
        .then((_) => closeWindow());
  }
}
