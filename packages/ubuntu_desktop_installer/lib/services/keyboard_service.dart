import 'package:subiquity_client/subiquity_client.dart';

export 'package:subiquity_client/subiquity_client.dart'
    show KeyboardLayout, KeyboardSetting, KeyboardSetup, KeyboardVariant;

abstract class KeyboardService {
  Future<KeyboardSetup> getKeyboard();
  Future<void> setKeyboard(KeyboardSetting setting);
  Future<void> setInputSource(KeyboardSetting setting, {String? user});
}

class SubiquityKeyboardService implements KeyboardService {
  const SubiquityKeyboardService(this._subiquity);

  final SubiquityClient _subiquity;

  @override
  Future<KeyboardSetup> getKeyboard() => _subiquity.getKeyboard();

  @override
  Future<void> setKeyboard(KeyboardSetting setting) {
    return _subiquity.setKeyboard(setting);
  }

  @override
  Future<void> setInputSource(KeyboardSetting setting, {String? user}) {
    return _subiquity.setInputSource(setting, user: user);
  }
}
