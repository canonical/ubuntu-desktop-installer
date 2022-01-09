import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../l10n.dart';
import '../../services.dart';
import 'turn_off_rst_model.dart';

class TurnOffRSTPage extends StatelessWidget {
  const TurnOffRSTPage({
    Key? key,
  }) : super(key: key);

  static Widget create(BuildContext context) {
    final client = getService<SubiquityClient>();
    return Provider(
      create: (_) => TurnOffRSTModel(client),
      child: const TurnOffRSTPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TurnOffRSTModel>(context);
    final lang = AppLocalizations.of(context);
    return Scaffold(
      body: WizardPage(
        title: Text(lang.turnOffRST),
        header: Text(lang.turnOffRSTDescription),
        content: Column(
          children: <Widget>[
            Html(
              data: lang.instructionsForRST('help.ubuntu.com/rst'),
              style: {
                'body': Style(
                  margin: EdgeInsets.zero,
                ),
              },
              onLinkTap: (url, _, __, ___) => launch(url!),
            ),
            const SizedBox(height: 60),
            SvgPicture.asset(
              'assets/rst.svg',
              color: Theme.of(context).textTheme.bodyText1!.color,
            ),
          ],
        ),
        actions: <WizardAction>[
          WizardAction.back(context),
          WizardAction(
            label: lang.restartButtonText,
            highlighted: true,
            onActivated: () => model.reboot(immediate: true),
          ),
        ],
      ),
    );
  }
}
