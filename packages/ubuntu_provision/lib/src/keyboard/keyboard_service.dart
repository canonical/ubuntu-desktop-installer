import 'package:subiquity_client/subiquity_client.dart';

export 'package:subiquity_client/subiquity_client.dart'
    show
        AnyStep,
        KeyboardLayout,
        KeyboardSetting,
        KeyboardSetup,
        KeyboardVariant,
        StepKeyPresent,
        StepPressKey,
        StepResult;

abstract class KeyboardService {
  Future<KeyboardSetup> getKeyboard();
  Future<void> setKeyboard(KeyboardSetting setting);
  Future<void> setInputSource(KeyboardSetting setting, {String? user});
  Future<AnyStep> getKeyboardStep([String step = '0']);
  bool get canDetectLayout;
}
