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
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          Expanded(
            child: OptionCard(
              image: FlavorImage.asset('assets/Theme_thumbnails-Light.png'),
              body: Text(lang.chooseYourLookPageLightSetting),
              selected: Theme.of(context).brightness == Brightness.light,
              onSelected: () {
                final settings = Settings.of(context, listen: false);
                settings.applyTheme(Brightness.light);
              },
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: OptionCard(
              image: FlavorImage.asset('assets/Theme_thumbnails-Dark.png'),
              body: Text(lang.chooseYourLookPageDarkSetting),
              selected: Theme.of(context).brightness == Brightness.dark,
              onSelected: () {
                final settings = Settings.of(context, listen: false);
                settings.applyTheme(Brightness.dark);
              },
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
}
