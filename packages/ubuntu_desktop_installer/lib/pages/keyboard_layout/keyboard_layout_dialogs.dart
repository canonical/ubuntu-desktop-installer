import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ubuntu_wizard/constants.dart';

import '../../widgets.dart';
import 'keyboard_layout_detector.dart';
import 'keyboard_layout_widgets.dart';

const _kKeymapAsset = 'assets/pc105.tree';

const _kDialogWidthFactor = 0.6;
const _kDialogHeightFactor = 0.1;

/// Shows a dialog to detect the keyboard layout by asking the user to press
/// and confirm keys. Returns the keyboard layout code or null if canceled.
Future<String?> showDetectKeyboardLayoutDialog(BuildContext context) async {
  final detector = KeyboardLayoutDetector.fromData(
    await rootBundle.loadString(_kKeymapAsset),
  );
  final step = ValueNotifier(detector.step(0));

  return showDialog<String?>(
    context: context,
    builder: (context) {
      String? nextStep() {
        final next = step.value?.next();
        if (next != null) {
          final value = detector.step(next);
          if (value is KeymapResultStep) {
            Navigator.of(context).pop(value.keymap);
          }
          step.value = value;
        }
      }

      void keyFound() {
        (step.value as FindKeyStep).found();
        nextStep();
      }

      void keyNotFound() {
        (step.value as FindKeyStep).notFound();
        nextStep();
      }

      return LocalizedView(
        builder: (context, lang) {
          return ValueListenableBuilder<KeyboardLayoutStep?>(
            valueListenable: step,
            builder: (context, value, _) {
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
                    step: value,
                    onNextStep: nextStep,
                  ),
                ),
                actions: <Widget>[
                  Opacity(
                    opacity: value is FindKeyStep ? 1.0 : 0.0,
                    child: OutlinedButton(
                      child: Text(lang.noButtonText),
                      onPressed: value is FindKeyStep ? keyNotFound : null,
                    ),
                  ),
                  const SizedBox(width: kButtonBarSpacing),
                  Opacity(
                    opacity: value is FindKeyStep ? 1.0 : 0.0,
                    child: OutlinedButton(
                      child: Text(lang.yesButtonText),
                      onPressed: value is FindKeyStep ? keyFound : null,
                    ),
                  ),
                ],
              );
            },
          );
        },
      );
    },
  );
}
