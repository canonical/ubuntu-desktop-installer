import 'package:flutter/material.dart';
import 'package:ubuntu_wizard/settings.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../../l10n.dart';

class ChooseYourLookPage extends StatelessWidget {
  const ChooseYourLookPage({Key? key}) : super(key: key);

  static Widget create(BuildContext context) => const ChooseYourLookPage();

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
      contentPadding: const EdgeInsets.fromLTRB(20, 50, 20, 150),
      content: Center(
        child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OptionCard(
                  image: FlavorImage.asset('assets/Theme_thumbnails-Light.png'),
                  title: Text(lang.chooseYourLookPageLightSetting),
                  body: Text(lang.chooseYourLookPageLightBodyText),
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
                  image: FlavorImage.asset('assets/Theme_thumbnails-Dark.png'),
                  title: Text(lang.chooseYourLookPageDarkSetting),
                  body: Text(lang.chooseYourLookPageDarkBodyText),
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
