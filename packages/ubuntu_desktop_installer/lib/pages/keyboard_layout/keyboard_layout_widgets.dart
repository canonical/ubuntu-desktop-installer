import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ubuntu_wizard/constants.dart';

import '../../widgets.dart';
import 'keyboard_layout_detector.dart';

/// Asks the user to press one of keys.
class PressKeyView extends StatelessWidget {
  /// Creates a view.
  const PressKeyView(this._step, {Key? key}) : super(key: key);

  final PressKeyStep _step;

  @override
  Widget build(BuildContext context) {
    return LocalizedView(
      builder: (context, lang) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(lang.pressOneKey),
            const SizedBox(height: kContentSpacing),
            DefaultTextStyle(
              style: Theme.of(context).textTheme.headline5!,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _step.keys.map((key) => Text(key)).toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Asks the user to confirm whether a key exists.
class FindKeyView extends StatelessWidget {
  /// Creates a view.
  const FindKeyView(this._step, {Key? key}) : super(key: key);

  final FindKeyStep _step;

  @override
  Widget build(BuildContext context) {
    return LocalizedView(
      builder: (context, lang) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(lang.isKeyPresent),
            const SizedBox(height: kContentSpacing),
            DefaultTextStyle(
              style: Theme.of(context).textTheme.headline5!,
              child: Align(
                alignment: Alignment.center,
                child: Text(_step.key),
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Detects the keyboard layout by asking the user to press and confirm keys.
class DetectKeyboardLayoutView extends StatefulWidget {
  /// Creates a keyboard layout detection view.
  const DetectKeyboardLayoutView({
    Key? key,
    required KeyboardLayoutStep? step,
    required VoidCallback onNextStep,
  })  : _step = step,
        _onNextStep = onNextStep,
        super(key: key);

  final KeyboardLayoutStep? _step;
  final VoidCallback _onNextStep;

  @override
  _DetectKeyboardLayoutViewState createState() =>
      _DetectKeyboardLayoutViewState();
}

class _DetectKeyboardLayoutViewState extends State<DetectKeyboardLayoutView> {
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
    if (event is! RawKeyDownEvent || widget._step is! PressKeyStep) return;
    final data = event.data as RawKeyEventDataLinux;
    final step = widget._step as PressKeyStep;
    step.press(data.scanCode);
    widget._onNextStep();
  }

  @override
  Widget build(BuildContext context) {
    return LocalizedView(builder: (context, lang) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget._step is PressKeyStep)
              PressKeyView(widget._step as PressKeyStep),
            if (widget._step is FindKeyStep)
              FindKeyView(widget._step as FindKeyStep),
          ],
        ),
      );
    });
  }
}
