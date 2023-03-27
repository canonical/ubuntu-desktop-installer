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
        content: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: SvgPicture.asset(
                  'assets/turn_off_rst/qr-code.svg',
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
                    Text(lang.turnOffRSTTitle,
                        style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(height: kContentSpacing),
                    Text(lang.turnOffRSTDescription),
                    const SizedBox(height: kContentSpacing),
                    Html(
                      data: lang.instructionsForRST('help.ubuntu.com/rst'),
                      style: {
                        'body': Style(margin: Margins.zero),
                        'a': Style(color: context.linkColor),
                      },
                      onLinkTap: (url, _, __, ___) => launchUrl(url!),
                    ),
                    const SizedBox(height: kContentSpacing),
                    ElevatedButton(
                      onPressed: () {
                        final window = YaruWindow.of(context);
                        model.reboot().then((_) => window.close());
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
        singleLeading: true,
        actions: <WizardAction>[
          WizardAction.back(context),
        ],
      ),
    );
  }
}
