import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../../l10n.dart';
import '../../services.dart';
import '../../widgets.dart';
import 'turn_off_bitlocker_model.dart';

class TurnOffBitLockerPage extends StatelessWidget {
  @visibleForTesting
  const TurnOffBitLockerPage({super.key});

  static Widget create(BuildContext context) {
    final client = getService<SubiquityClient>();
    return Provider(
      create: (_) => TurnOffBitLockerModel(client),
      child: const TurnOffBitLockerPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TurnOffBitLockerModel>(context);
    final lang = AppLocalizations.of(context);
    final flavor = Flavor.of(context);
    return WizardPage(
      title: YaruWindowTitleBar(
        title: Text(lang.turnOffBitlockerTitle),
      ),
      content: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: SvgPicture.asset(
                'assets/turn_off_bitlocker/qr-code.svg',
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
                  Text(lang.turnOffBitlockerTitle,
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: kContentSpacing),
                  Text(lang.turnOffBitlockerDescription(
                      lang.installationTypeErase(flavor.name))),
                  const SizedBox(height: kContentSpacing),
                  Html(
                    data: lang.turnOffBitlockerLinkInstructions(
                        'help.ubuntu.com/bitlocker'),
                    style: {
                      'body': Style(margin: Margins.zero),
                      'a': Style(color: context.linkColor),
                    },
                    onLinkTap: (url, _, __, ___) => launchUrl(url!),
                  ),
                  const SizedBox(height: kContentSpacing),
                  FilledButton(
                    onPressed: () async {
                      final window = YaruWindow.of(context);
                      final confirmed = await showConfirmationDialog(
                        context,
                        title: lang.turnOffBitlockerTitle,
                        message: lang.restartIntoWindowsDescription(
                            Flavor.of(context).name),
                        okLabel: lang.restartButtonText,
                        okElevated: true,
                      );
                      if (confirmed) {
                        model.reboot().then((_) => window.close());
                      }
                    },
                    child: Text(lang.restartIntoWindows),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      singleLeading: true,
      actions: [
        WizardAction.back(context),
      ],
    );
  }
}
