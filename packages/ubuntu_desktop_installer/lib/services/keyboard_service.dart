import 'package:dbus/dbus.dart';
import 'package:gsettings/gsettings.dart';
import 'package:meta/meta.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:xdg_locale/xdg_locale.dart';

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

class XdgKeyboardService implements KeyboardService {
  XdgKeyboardService([
    @visibleForTesting XdgLocaleClient? client,
    @visibleForTesting GSettings? inputSourceSettings,
  ])  : _client = client ?? XdgLocaleClient(),
        _inputSourceSettings =
            inputSourceSettings ?? GSettings('org.gnome.desktop.input-sources');

  final XdgLocaleClient _client;
  final GSettings _inputSourceSettings;

  @override
  Future<KeyboardSetup> getKeyboard() async {
    await _client.connect();
    final keyboardSetup = KeyboardSetup(
      setting: KeyboardSetting(
        layout: _client.x11Layout,
        toggle: _client.vConsoleKeymapToggle.isNotEmpty
            ? _client.vConsoleKeymapToggle
            : null,
        variant: _client.x11Variant,
      ),
      // TODO: find a way to fetch list of supported layouts
      layouts: [],
    );
    return keyboardSetup;
  }

  @override
  Future<AnyStep> getKeyboardStep([String step = '0']) async {
    // TODO: implement keyboard detection (?)
    throw UnsupportedError(
        'XdgKeyboardService does\'t support keyboard layout detection');
  }

  @override
  Future<void> setInputSource(KeyboardSetting setting, {String? user}) async {
    final xkbString = setting.variant.isNotEmpty
        ? '${setting.layout}+${setting.variant}'
        : setting.layout;
    await _inputSourceSettings.set(
      'sources',
      DBusArray(
          DBusSignature.struct([DBusSignature.string, DBusSignature.string]), [
        DBusStruct([const DBusString('xkb'), DBusString(xkbString)])
      ]),
    );
  }

  @override
  Future<void> setKeyboard(KeyboardSetting setting) async {
    await _client.connect();
    await _client.setX11Keyboard(
      setting.layout,
      _client.x11Model,
      setting.variant,
      _client.x11Options,
      false,
      false,
    );
  }

  @override
  bool get canDetectLayout => false;
}
