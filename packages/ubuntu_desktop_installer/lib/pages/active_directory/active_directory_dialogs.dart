import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_utils/ubuntu_utils.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

Future<void> showActiveDirectoryErrorDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => const ActiveDirectoryErrorDialog(),
  );
}

class ActiveDirectoryErrorDialog extends StatelessWidget {
  const ActiveDirectoryErrorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return AlertDialog(
      title: YaruDialogTitleBar(
        title: Text(lang.activeDirectoryErrorTitle),
      ),
      titlePadding: EdgeInsets.zero,
      contentPadding: const EdgeInsets.all(kYaruPagePadding),
      actionsPadding: const EdgeInsets.all(kYaruPagePadding),
      buttonPadding: EdgeInsets.zero,
      content: SizedBox(
        width: 600,
        child: Row(
          children: [
            const Icon(YaruIcons.error, size: 96),
            const SizedBox(width: kWizardSpacing),
            Expanded(
              child: Html(
                data: lang.activeDirectoryErrorMessage,
                style: {
                  'body': Style(margin: Margins.zero),
                  'a': Style(color: Theme.of(context).colorScheme.link),
                },
                onAnchorTap: (url, _, __) => launchUrl(url!),
                shrinkWrap: true,
              ),
            ),
          ],
        ),
      ),
      actions: [
        PushButton.filled(
          onPressed: Navigator.of(context).pop,
          child: Text(UbuntuLocalizations.of(context).okLabel),
        ),
      ],
    );
  }
}
