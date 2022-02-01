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
        child: SingleChildScrollView(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: width / 3,
                      child: YaruImageTile(
                        path: 'assets/Theme_thumbnails-Light.png',
                        currentlySelected:
                            Theme.of(context).brightness == Brightness.light,
                        onTap: () {
                          settings.applyTheme(Brightness.light);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(lang.chooseYourLookPageLightSetting,
                          style: Theme.of(context).textTheme.headline6),
                    )
                  ],
                ),
                SizedBox(
                  width: width / 20,
                ),
                Column(
                  children: [
                    SizedBox(
                      width: width / 3,
                      child: YaruImageTile(
                        path: 'assets/Theme_thumbnails-Dark.png',
                        currentlySelected:
                            Theme.of(context).brightness == Brightness.dark,
                        onTap: () {
                          settings.applyTheme(Brightness.dark);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(lang.chooseYourLookPageDarkSetting,
                          style: Theme.of(context).textTheme.headline6),
                    )
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
