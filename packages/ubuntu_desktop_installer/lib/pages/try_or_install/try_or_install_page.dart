import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../../l10n.dart';
import '../../settings.dart';
import 'try_or_install_model.dart';
import 'try_or_install_widgets.dart';

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
    final brightness = Theme.of(context).brightness;

    return WizardPage(
      title: YaruWindowTitleBar(
        title: Text(lang.tryOrInstallPageTitle),
      ),
      content: Column(
        children: [
          const Spacer(),
          SvgPicture.asset(
            'assets/try_or_install/logo-${brightness.name}.svg',
          ),
          const Spacer(),
          OptionButton(
            value: Option.installUbuntu,
            groupValue: model.option,
            title: Text(lang.installUbuntu(flavor.name)),
            subtitle: Text(lang.installUbuntuDescription(flavor.name)),
            onChanged: (value) => model.selectOption(value!),
          ),
          const SizedBox(height: kContentSpacing / 2),
          OptionButton(
            value: Option.tryUbuntu,
            groupValue: model.option,
            title: Text(lang.tryUbuntu(flavor.name)),
            subtitle: Text(lang.tryUbuntuDescription(flavor.name)),
            onChanged: (value) => model.selectOption(value!),
          ),
          // const SizedBox(height: kContentSpacing / 2),
          // OptionButton(
          //   value: Option.repairUbuntu,
          //   groupValue: model.option,
          //   title: Text(lang.repairInstallation),
          //   subtitle: Text(lang.repairInstallationDescription),
          //   onChanged: (value) => model.selectOption(value!),
          // ),
          const Spacer(flex: 3),
          Html(
            shrinkWrap: true,
            data: lang.releaseNotesLabel(
                model.releaseNotesURL(Settings.of(context).locale)),
            style: {
              'body': Style(margin: Margins.zero),
              'a': Style(color: context.linkColor),
            },
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
