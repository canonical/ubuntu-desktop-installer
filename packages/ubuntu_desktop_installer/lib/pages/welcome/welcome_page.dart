import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ubuntu_desktop_installer/installer.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/widgets.dart';
import 'package:ubuntu_utils/ubuntu_utils.dart';
import 'package:ubuntu_wizard/constants.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'welcome_model.dart';
import 'welcome_widgets.dart';

export 'welcome_model.dart' show Option;

class WelcomePage extends ConsumerWidget {
  const WelcomePage({super.key});

  static Future<bool> load(BuildContext context, WidgetRef ref) {
    return Future.wait([
      ref.read(welcomeModelProvider).init(),
      MascotAvatar.precacheAsset(context),
    ]).then((_) => true);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(welcomeModelProvider);
    final lang = AppLocalizations.of(context);
    final flavor = ref.watch(flavorProvider);
    final brightness = Theme.of(context).brightness;
    final locale = Localizations.localeOf(context);

    return WizardPage(
      title: YaruWindowTitleBar(
        title: Text(lang.tryOrInstallPageTitle(flavor.name)),
      ),
      content: Column(
        children: [
          const Spacer(),
          SvgPicture.asset('assets/welcome/logo-${brightness.name}.svg'),
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
          Visibility(
            visible: model.isConnected,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Html(
              shrinkWrap: true,
              data: lang.releaseNotesLabel(model.releaseNotesURL(locale)),
              style: {
                'body': Style(margin: Margins.zero),
                'a': Style(color: context.linkColor),
              },
              onLinkTap: (url, _, __) => launchUrl(url!),
            ),
          ),
        ],
      ),
      bottomBar: WizardBar(
        leading: WizardButton.previous(context),
        trailing: [
          WizardButton(
            label: UbuntuLocalizations.of(context).nextLabel,
            visible: model.option == Option.tryUbuntu,
            execute: YaruWindow.of(context).close,
          ),
          WizardButton.next(
            context,
            visible: model.option != Option.tryUbuntu,
            enabled: model.option != Option.none,
            arguments: model.option,
          ),
        ],
      ),
    );
  }
}
