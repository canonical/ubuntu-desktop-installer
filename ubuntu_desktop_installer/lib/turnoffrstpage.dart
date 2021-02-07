import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yaru/yaru.dart';

import 'i18n.dart';

class TurnOffRSTPage extends StatelessWidget {
  const TurnOffRSTPage({
    Key key,
  }) : super(key: key);

  String get title => Intl.message('Turn off RST');

  String get description => Intl.message(
      'This computer uses Intel RST (Rapid Storage Technology). You need to turn off RST in Windows before installing Ubuntu.');

  String instructions(Object url) => Intl.message(
        'For instructions, open this page on a phone or other device: <a href="https://$url">$url</a>',
        name: 'instructions',
        args: [url],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Expanded(
                child: Column(children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(description),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Html(
                  data: instructions('help.ubuntu.com/rst'),
                  style: {
                    'body': Style(
                      margin: EdgeInsets.all(0),
                    ),
                  },
                  onLinkTap: launch,
                ),
              ),
              const SizedBox(height: 40),
              Image.asset('assets/rst.png'),
            ])),
            const SizedBox(height: 20),
            ButtonBar(
              children: <OutlinedButton>[
                OutlinedButton(
                    child:
                        Text(UbuntuLocalizations.of(context).goBackButtonText),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                OutlinedButton(
                  style: yaruOutlinedButtonThemeData.style.copyWith(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Color(0xFF0e8420)),
                      foregroundColor: MaterialStateColor.resolveWith(
                          (states) => yaruWhite)),
                  child:
                      Text(UbuntuLocalizations.of(context).restartButtonText),
                  onPressed: () {
                    print('TODO: restart computer');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
