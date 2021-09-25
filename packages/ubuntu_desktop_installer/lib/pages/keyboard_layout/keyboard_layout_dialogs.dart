import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/constants.dart';

import '../../l10n.dart';
import 'keyboard_layout_detector.dart';
import 'keyboard_layout_widgets.dart';

const _kDialogWidthFactor = 0.65;
const _kDialogHeightFactor = 0.15;

/// Shows a dialog to detect the keyboard layout by asking the user to press
/// and confirm keys. Returns the result with a keyboard layout and variant
/// codes or null if canceled.
Future<StepResult?> showDetectKeyboardLayoutDialog(BuildContext context) async {
  final client = Provider.of<SubiquityClient>(context, listen: false);

  return showDialog<StepResult?>(
    context: context,
    builder: (context) {
      final detector = KeyboardLayoutDetector(client, onResult: (result) {
        Navigator.of(context).pop(result);
      });
      detector.init();

      final lang = AppLocalizations.of(context);
      return ValueListenableBuilder<KeyboardStep?>(
        valueListenable: detector,
        builder: (context, step, _) {
          final size = MediaQuery.of(context).size;
          return AlertDialog(
            title: Text(lang.detectLayout),
            titlePadding: kHeaderPadding,
            contentPadding: kContentPadding.copyWith(
                top: kContentSpacing, bottom: kContentSpacing),
            actionsPadding: kFooterPadding,
            buttonPadding: EdgeInsets.zero,
            content: SizedBox(
              width: size.width * _kDialogWidthFactor,
              height: size.height * _kDialogHeightFactor,
              child: DetectKeyboardLayoutView(
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
                child: OutlinedButton(
                  child: Text(lang.noButtonText),
                  onPressed: step is StepKeyPresent ? detector.no : null,
                ),
              ),
              const SizedBox(width: kButtonBarSpacing),
              Visibility(
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
                visible: step is StepKeyPresent,
                child: OutlinedButton(
                  child: Text(lang.yesButtonText),
                  onPressed: step is StepKeyPresent ? detector.yes : null,
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
