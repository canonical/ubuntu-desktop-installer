import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';
import '../../services.dart';
import 'turn_off_bitlocker_model.dart';

class TurnOffBitLockerPage extends StatelessWidget {
  @visibleForTesting
  const TurnOffBitLockerPage({Key? key}) : super(key: key);

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
    return WizardPage(
      title: Text(lang.turnOffBitlockerTitle),
      header: Text(lang.turnOffBitlockerDescription),
      content: Column(
        children: [
          Html(
            data: lang
                .turnOffBitlockerLinkInstructions('help.ubuntu.com/bitlocker'),
            style: {
              'body': Style(
                margin: EdgeInsets.zero,
              ),
            },
            onLinkTap: (url, _, __, ___) => launchUrl(url!),
          ),
          const SizedBox(height: 60),
          SvgPicture.asset('assets/turn_off_bitlocker/qr-code.svg')
        ],
      ),
      actions: [
        WizardAction.back(context),
        WizardAction.done(
          context,
          label: lang.restartIntoWindows,
          highlighted: true,
          onDone: () => model.reboot(immediate: true),
        ),
      ],
    );
  }
}
