import 'package:flutter/material.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_desktop_installer/widgets.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'keyboard_detector.dart';
import 'keyboard_widgets.dart';

const _kDialogWidthFactor = 0.65;
const _kDialogHeightFactor = 0.15;

/// Shows a dialog to detect the keyboard layout by asking the user to press
/// and confirm keys. Returns the result with a keyboard layout and variant
/// codes or null if canceled.
Future<StepResult?> showDetectKeyboardDialog(BuildContext context) async {
  final service = getService<KeyboardService>();

  return showDialog<StepResult?>(
    context: context,
    builder: (context) {
      final detector = KeyboardDetector(service, onResult: (result) {
        Navigator.of(context).pop(result);
      });
      detector.init();

      final lang = AppLocalizations.of(context);
      return ValueListenableBuilder<AnyStep?>(
        valueListenable: detector,
        builder: (context, step, _) {
          final size = MediaQuery.of(context).size;
          return AlertDialog(
            title: YaruDialogTitleBar(
              title: Text(lang.detectLayout),
            ),
            titlePadding: EdgeInsets.zero,
            contentPadding: const EdgeInsets.all(kYaruPagePadding),
            actionsPadding: const EdgeInsets.all(kYaruPagePadding),
            buttonPadding: EdgeInsets.zero,
            content: SizedBox(
              width: size.width * _kDialogWidthFactor,
              height: size.height * _kDialogHeightFactor,
              child: DetectKeyboardView(
                pressKey: detector.pressKey,
                keyPresent: detector.keyPresent,
                onKeyPress: detector.press,
              ),
            ),
            actions: <Widget>[
              Visibility(
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
                visible: step is StepKeyPresent,
                child: PushButton.filled(
                  onPressed: step is StepKeyPresent ? detector.no : null,
                  child: Text(UbuntuLocalizations.of(context).noLabel),
                ),
              ),
              const SizedBox(width: kButtonBarSpacing),
              Visibility(
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
                visible: step is StepKeyPresent,
                child: PushButton.filled(
                  onPressed: step is StepKeyPresent ? detector.yes : null,
                  child: Text(UbuntuLocalizations.of(context).yesLabel),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
