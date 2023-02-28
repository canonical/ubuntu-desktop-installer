import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../../l10n.dart';
import '../../settings.dart';
import 'try_or_install_model.dart';

export 'try_or_install_model.dart' show Option;

class TryOrInstallPage extends StatefulWidget {
  const TryOrInstallPage({
    super.key,
  });

  static Widget create(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TryOrInstallModel(),
      child: const TryOrInstallPage(),
    );
  }

  @override
  TryOrInstallPageState createState() => TryOrInstallPageState();
}

class TryOrInstallPageState extends State<TryOrInstallPage> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TryOrInstallModel>(context);
    final lang = AppLocalizations.of(context);
    final flavor = Flavor.of(context);
    return WizardPage(
      title: YaruWindowTitleBar(
        title: Text(lang.tryOrInstallPageTitle),
      ),
      content: Column(
        children: [
          const Spacer(),
          Expanded(
            flex: 6,
            child: Row(
              children: [
                // Expanded(
                //   child: OptionCard(
                //     selected: model.option == Option.repairUbuntu,
                //     image: Image.asset('assets/try_or_install/repair-wrench.png'),
                //     title: Text(lang.repairInstallation),
                //     body: Text(lang.repairInstallationDescription),
                //     onSelected: () => model.selectOption(Option.repairUbuntu),
                //   ),
                // ),
                // const SizedBox(width: kContentSpacing),
                const Spacer(),
                Expanded(
                  flex: 2,
                  child: OptionCard(
                    selected: model.option == Option.tryUbuntu,
                    image:
                        Image.asset('assets/try_or_install/steering-wheel.png'),
                    title: Text(lang.tryUbuntu(flavor.name)),
                    body: Text(lang.tryUbuntuDescription(flavor.name)),
                    onSelected: () => model.selectOption(Option.tryUbuntu),
                  ),
                ),
                const SizedBox(width: kContentSpacing * 2),
                Expanded(
                  flex: 2,
                  child: OptionCard(
                    selected: model.option == Option.installUbuntu,
                    image: Image.asset('assets/try_or_install/hard-drive.png'),
                    title: Text(lang.installUbuntu(flavor.name)),
                    body: Text(lang.installUbuntuDescription(flavor.name)),
                    onSelected: () => model.selectOption(Option.installUbuntu),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          const Spacer(),
          Html(
            data: lang.releaseNotesLabel(
                model.releaseNotesURL(Settings.of(context).locale)),
            style: {'body': Style(margin: Margins.zero)},
            onLinkTap: (url, _, __, ___) => launchUrl(url!),
          ),
        ],
      ),
      actions: <WizardAction>[
        WizardAction.back(context),
        WizardAction.done(
          context,
          label: UbuntuLocalizations.of(context).continueAction,
          visible: model.option == Option.tryUbuntu,
          onDone: YaruWindow.of(context).close,
        ),
        WizardAction.next(
          context,
          visible: model.option != Option.tryUbuntu,
          enabled: model.option != Option.none,
          arguments: model.option,
        ),
      ],
    );
  }
}
