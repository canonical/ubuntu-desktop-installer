import 'package:flutter/material.dart';
import 'package:ubuntu_wizard/settings.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../../l10n.dart';

class ChooseYourLookPage extends StatelessWidget {
  const ChooseYourLookPage({Key? key}) : super(key: key);

  static Widget create(BuildContext context) => const ChooseYourLookPage();

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final width = MediaQuery.of(context).size.width;
    final settings = Settings.of(context, listen: false);
    return WizardPage(
      header: Text(lang.chooseYourLookPageHeader),
      actions: <WizardAction>[
        WizardAction.back(context),
        WizardAction.next(context),
      ],
      title: Text(lang.chooseYourLookPageTitle),
      content: Center(
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ThemeOptionCard(
                width: width / 3,
                assetName: 'assets/choose_your_look/light-theme.png',
                selected: Theme.of(context).brightness == Brightness.light,
                onTap: () {
                  settings.applyTheme(Brightness.light);
                },
                preferenceName: lang.chooseYourLookPageLightSetting,
              ),
              SizedBox(
                width: width / 20,
              ),
              _ThemeOptionCard(
                width: width / 3,
                assetName: 'assets/choose_your_look/dark-theme.png',
                selected: Theme.of(context).brightness == Brightness.dark,
                onTap: () {
                  settings.applyTheme(Brightness.dark);
                },
                preferenceName: lang.chooseYourLookPageDarkSetting,
              ),
            ]),
      ),
    );
  }
}

class _ThemeOptionCard extends StatelessWidget {
  const _ThemeOptionCard({
    Key? key,
    required this.width,
    required this.assetName,
    required this.selected,
    required this.onTap,
    required this.preferenceName,
  }) : super(key: key);

  final double width;
  final String assetName;
  final bool selected;
  final Function() onTap;
  final String preferenceName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: width,
          child: YaruSelectableContainer(
            child: Image.asset(assetName),
            selected: selected,
            onTap: onTap,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(preferenceName,
              style: Theme.of(context).textTheme.headline6),
        )
      ],
    );
  }
}
