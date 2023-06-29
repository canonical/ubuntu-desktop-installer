import 'package:flutter/material.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/widgets/push_button.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

/// Shows a confirmation dialog with the given title and message.
Future<bool> showConfirmationDialog(
  BuildContext context, {
  required String title,
  required String message,
  String? okLabel,
  bool okElevated = false,
}) async {
  final lang = UbuntuLocalizations.of(context);
  final result = await showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: YaruDialogTitleBar(title: Text(title)),
        titlePadding: EdgeInsets.zero,
        contentPadding: const EdgeInsets.all(kYaruPagePadding),
        actionsPadding: const EdgeInsets.all(kYaruPagePadding),
        buttonPadding: EdgeInsets.zero,
        content: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Text(message)),
        actions: <Widget>[
          PushButton.outlined(
            child: Text(lang.cancelLabel),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          okElevated
              ? PushButton.elevated(
                  child: Text(okLabel ?? lang.okLabel),
                  onPressed: () => Navigator.of(context).pop(true),
                )
              : PushButton.filled(
                  child: Text(okLabel ?? lang.okLabel),
                  onPressed: () => Navigator.of(context).pop(true),
                ),
        ],
      );
    },
  );
  return result == true;
}
