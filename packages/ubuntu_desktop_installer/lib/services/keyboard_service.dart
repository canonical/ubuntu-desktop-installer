import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_provision/keyboard.dart';

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

  @override
  Future<AnyStep> getKeyboardStep([String step = '0']) {
    return _subiquity.getKeyboardStep(step);
  }

  @override
  bool get canDetectLayout => true;
}
