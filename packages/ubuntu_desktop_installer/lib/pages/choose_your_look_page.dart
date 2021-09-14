import 'package:flutter/material.dart';
import 'package:ubuntu_wizard/settings.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';

class ChooseYourLookPage extends StatelessWidget {
  const ChooseYourLookPage({Key? key}) : super(key: key);

  static Widget create(BuildContext context) => ChooseYourLookPage();

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return WizardPage(
      header: Text(lang.chooseYourLookPageHeader),
      actions: <WizardAction>[
        WizardAction.back(context),
        WizardAction.next(context),
      ],
      title: Text(lang.chooseYourLookPageTitle),
      contentPadding: EdgeInsets.fromLTRB(20, 50, 20, 150),
      content: Center(
        child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OptionCard(
                  imageAsset: 'assets/Theme_thumbnails-Light.png',
                  titleText: lang.chooseYourLookPageLightSetting,
                  bodyText: lang.chooseYourLookPageLightBodyText,
                  selected: Theme.of(context).brightness == Brightness.light,
                  onSelected: () {
                    final settings = Settings.of(context, listen: false);
                    settings.applyTheme(Brightness.light);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OptionCard(
                  imageAsset: 'assets/Theme_thumbnails-Dark.png',
                  titleText: lang.chooseYourLookPageDarkSetting,
                  bodyText: lang.chooseYourLookPageDarkBodyText,
                  selected: Theme.of(context).brightness == Brightness.dark,
                  onSelected: () {
                    final settings = Settings.of(context, listen: false);
                    settings.applyTheme(Brightness.dark);
                  },
                ),
              )
            ]),
      ),
    );
  }
}
