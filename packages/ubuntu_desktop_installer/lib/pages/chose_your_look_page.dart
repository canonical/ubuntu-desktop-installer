import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../app_theme.dart';
import '../widgets.dart';
import 'wizard_page.dart';

class ChoseYourLookPage extends StatelessWidget {
  const ChoseYourLookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void nextPage() {
      // TODO: what's the next page to navigate to?
      //Navigator.pushNamed(context, Routes.?????);
    }

    final theme = context.watch<AppTheme>();
    return LocalizedView(
        builder: (context, lang) => WizardPage(
              actions: <WizardAction>[
                WizardAction(
                  label: lang.backButtonText,
                  onActivated: Navigator.of(context).pop,
                ),
                WizardAction(
                  label: lang.continueButtonText,
                  enabled: true,
                  onActivated: nextPage,
                ),
              ],
              title: Text(lang.choseYourLookPageTitle),
              contentPadding: EdgeInsets.fromLTRB(20, 50, 20, 150),
              content: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(children: [
                                Image.asset(
                                  'assets/Theme_thumbnails-Light.png',
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    children: [
                                      Radio<Brightness>(
                                          value: Brightness.light,
                                          groupValue:
                                              Theme.of(context).brightness,
                                          onChanged: (_) =>
                                              theme.apply(Brightness.light)),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: const Text('Light'),
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(children: [
                                Image.asset('assets/Theme_thumbnails-Dark.png',
                                    height:
                                        MediaQuery.of(context).size.height / 5),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    children: [
                                      Radio<Brightness>(
                                          value: Brightness.dark,
                                          groupValue:
                                              Theme.of(context).brightness,
                                          onChanged: (_) =>
                                              theme.apply(Brightness.dark)),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: const Text('Dark'),
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                            )
                          ]),
                    ],
                  ),
                ),
              ),
            ));
  }
}
