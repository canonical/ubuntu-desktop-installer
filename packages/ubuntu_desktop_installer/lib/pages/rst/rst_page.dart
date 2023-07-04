import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ubuntu_desktop_installer/installer.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/widgets.dart';
import 'package:ubuntu_utils/ubuntu_utils.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'rst_model.dart';

class RstPage extends ConsumerWidget {
  const RstPage({super.key});

  static Future<bool> load(WidgetRef ref) {
    return ref.read(rstModelProvider).hasRst();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flavor = ref.watch(flavorProvider);
    final model = ref.watch(rstModelProvider);
    final lang = AppLocalizations.of(context);
    return Scaffold(
      body: WizardPage(
        title: YaruWindowTitleBar(
          title: Text(lang.rstTitle),
        ),
        content: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: SvgPicture.asset(
                  'assets/rst/qr-code.svg',
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(width: 48),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(lang.rstHeader,
                        style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(height: kWizardSpacing),
                    Text(lang.rstDescription),
                    const SizedBox(height: kWizardSpacing),
                    Html(
                      data: lang.rstInstructions('help.ubuntu.com/rst'),
                      style: {
                        'body': Style(margin: Margins.zero),
                        'a': Style(color: Theme.of(context).colorScheme.link),
                      },
                      onLinkTap: (url, _, __) => launchUrl(url!),
                    ),
                    const SizedBox(height: kWizardSpacing),
                    FilledButton(
                      onPressed: () async {
                        final window = YaruWindow.of(context);
                        final confirmed = await showConfirmationDialog(
                          context,
                          title: lang.restartIntoWindowsTitle,
                          message:
                              lang.restartIntoWindowsDescription(flavor.name),
                          okLabel: lang.restartButtonText,
                          okElevated: true,
                        );
                        if (confirmed) {
                          model.reboot().then((_) => window.close());
                        }
                      },
                      child: Text(
                        lang.restartIntoWindows,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomBar: WizardBar(
          leading: WizardButton.previous(context),
        ),
      ),
    );
  }
}
