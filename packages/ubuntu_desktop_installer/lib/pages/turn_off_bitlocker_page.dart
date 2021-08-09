import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wizard_router/wizard_router.dart';

import '../widgets.dart';
import 'wizard_page.dart';

class TurnOffBitLockerPage extends StatefulWidget {
  @override
  _TurnOffBitLockerPageState createState() => _TurnOffBitLockerPageState();

  static Widget create(BuildContext context) {
    return TurnOffBitLockerPage();
  }
}

class _TurnOffBitLockerPageState extends State<TurnOffBitLockerPage> {
  @override
  Widget build(BuildContext context) {
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
            onActivated: Wizard.of(context).next,
            highlighted: true,
          ),
        ],
      ),
    );
  }
}
