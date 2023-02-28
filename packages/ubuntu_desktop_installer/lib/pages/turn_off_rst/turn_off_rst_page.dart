import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../../l10n.dart';
import '../../services.dart';
import 'turn_off_rst_model.dart';

class TurnOffRSTPage extends StatelessWidget {
  const TurnOffRSTPage({
    super.key,
  });

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
        title: YaruWindowTitleBar(
          title: Text(lang.turnOffRST),
        ),
        header: Text(lang.turnOffRSTDescription),
        content: Column(
          children: <Widget>[
            Html(
              data: lang.instructionsForRST('help.ubuntu.com/rst'),
              style: {
                'body': Style(margin: Margins.zero),
                'a': Style(color: context.linkColor),
              },
              onLinkTap: (url, _, __, ___) => launchUrl(url!),
            ),
            const SizedBox(height: 60),
            SvgPicture.asset(
              'assets/turn_off_rst/qr-code.svg',
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ],
        ),
        actions: <WizardAction>[
          WizardAction.back(context),
          WizardAction.done(
            context,
            label: lang.restartButtonText,
            highlighted: true,
            onDone: () {
              final window = YaruWindow.of(context);
              model.reboot().then((_) => window.close());
            },
          ),
        ],
      ),
    );
  }
}
