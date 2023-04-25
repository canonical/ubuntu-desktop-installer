import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ubuntu_wizard/constants.dart';

import '../../l10n.dart';

/// Asks the user to press one of keys.
class PressKeyView extends StatelessWidget {
  /// Creates a view.
  const PressKeyView(this._pressKey, {super.key});

  final List<String> _pressKey;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(lang.pressOneKey),
        const SizedBox(height: kContentSpacing),
        DefaultTextStyle(
          style: Theme.of(context).textTheme.headlineSmall!,
          child: Wrap(
            spacing: 24,
            alignment: WrapAlignment.spaceEvenly,
            children: _pressKey.map(Text.new).toList(),
          ),
        ),
      ],
    );
  }
}

/// Asks the user to confirm whether a key is present.
class KeyPresentView extends StatelessWidget {
  /// Creates a view.
  const KeyPresentView(this._keyPresent, {super.key});

  final String _keyPresent;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(lang.isKeyPresent),
        const SizedBox(height: kContentSpacing),
        DefaultTextStyle(
          style: Theme.of(context).textTheme.headlineSmall!,
          child: Align(
            alignment: Alignment.center,
            child: Text(_keyPresent),
          ),
        ),
      ],
    );
  }
}

/// Detects the keyboard layout by asking the user to press and confirm keys.
class DetectKeyboardView extends StatefulWidget {
  /// Creates a keyboard layout detection view.
  const DetectKeyboardView({
    super.key,
    String? keyPresent,
    List<String>? pressKey,
    ValueChanged<int>? onKeyPress,
  })  : _keyPresent = keyPresent,
        _pressKey = pressKey,
        _onKeyPress = onKeyPress;

  final String? _keyPresent;
  final List<String>? _pressKey;
  final ValueChanged<int>? _onKeyPress;

  @override
  State<DetectKeyboardView> createState() => _DetectKeyboardViewState();
}

class _DetectKeyboardViewState extends State<DetectKeyboardView> {
  @override
  void initState() {
    super.initState();
    RawKeyboard.instance.addListener(_handleKey);
  }

  @override
  void dispose() {
    RawKeyboard.instance.removeListener(_handleKey);
    super.dispose();
  }

  void _handleKey(RawKeyEvent event) {
    if (event is! RawKeyDownEvent) return;
    final data = event.data as RawKeyEventDataLinux;
    // From Ubiquity:
    // > FIXME needs to account for possible remapping. Find the API to translate
    // > kernel keycodes to X keycodes (xkb).
    //
    // Refers to `min_key_code = 8` in xkb:
    // https://github.com/xkbcommon/libxkbcommon/blob/master/src/xkbcomp/keycodes.c#L539
    widget._onKeyPress?.call(data.scanCode - 8);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (widget._pressKey != null) PressKeyView(widget._pressKey!),
          if (widget._keyPresent != null) KeyPresentView(widget._keyPresent!),
        ],
      ),
    );
  }
}
