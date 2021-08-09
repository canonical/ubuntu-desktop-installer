import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wizard_router/wizard_router.dart';

import '../../widgets.dart';
import '../wizard_page.dart';
import 'turn_off_bitlocker_model.dart';

class TurnOffBitLockerPage extends StatelessWidget {
  static Widget create(BuildContext context) {
    final client = Provider.of<SubiquityClient>(context, listen: false);
    return Provider(
      create: (_) => TurnOffBitLockerModel(client),
      child: TurnOffBitLockerPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TurnOffBitLockerModel>(context);
    return LocalizedView(
      builder: (context, lang) => WizardPage(
        title: Text(lang.turnOffBitlockerTitle),
        header: Text(lang.turnOffBitlockerDescription),
        content: Column(
          children: [
            Html(
              data: lang.turnOffBitlockerLinkInstructions(
                  'help.ubuntu.com/bitlocker'),
              style: {
                'body': Style(
                  margin: EdgeInsets.all(0),
                ),
              },
              onLinkTap: (url, _, __, ___) => launch(url!),
            ),
            const SizedBox(height: 60),
            SvgPicture.asset('assets/qrbitlocker.svg')
          ],
        ),
        actions: [
          WizardAction(
            label: lang.backButtonText,
            onActivated: Wizard.of(context).back,
          ),
          WizardAction(
            label: lang.restartIntoWindows,
            highlighted: true,
            onActivated: model.reboot,
          ),
        ],
      ),
    );
  }
}
