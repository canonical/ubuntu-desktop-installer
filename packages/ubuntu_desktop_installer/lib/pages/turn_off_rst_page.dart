import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets.dart';
import 'wizard_page.dart';

class TurnOffRSTPage extends StatelessWidget {
  const TurnOffRSTPage({
    Key? key,
  }) : super(key: key);

  static Widget create(BuildContext context) => TurnOffRSTPage();

  @override
  Widget build(BuildContext context) {
    return LocalizedView(
      builder: (context, lang) => Scaffold(
        body: WizardPage(
          title: Text(lang.turnOffRST),
          header: Text(lang.turnOffRSTDescription),
          content: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Html(
                        data: lang.instructionsForRST('help.ubuntu.com/rst'),
                        style: {
                          'body': Style(
                            margin: EdgeInsets.all(0),
                          ),
                        },
                        onLinkTap: (url, _, __, ___) => launch(url!),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Image.asset(
                      'assets/rst.png',
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: <WizardAction>[
            WizardAction(
              label: lang.backButtonText,
              onActivated: Navigator.of(context).pop,
            ),
            WizardAction(
              label: lang.restartButtonText,
              highlighted: true,
              onActivated: () {
                print('TODO: restart computer');
              },
            ),
          ],
        ),
      ),
    );
  }
}
