import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yaru/yaru.dart';

import 'localized_view.dart';

class TurnOffRSTPage extends StatelessWidget {
  const TurnOffRSTPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LocalizedView(
      builder: (context, lang) => Scaffold(
        appBar: AppBar(
          title: Text(lang.turnOffRST),
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
                  child: Text(lang.turnOffRSTDescription),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Html(
                    data: lang.instructionsForRST('help.ubuntu.com/rst'),
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
                    child: Text(lang.backButtonText),
                    onPressed: Navigator.of(context).pop,
                  ),
                  OutlinedButton(
                    style: yaruOutlinedButtonThemeData.style.copyWith(
                      backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Color(0xFF0e8420),
                      ),
                      foregroundColor:
                          MaterialStateColor.resolveWith((states) => yaruWhite),
                    ),
                    child: Text(lang.restartButtonText),
                    onPressed: () {
                      print('TODO: restart computer');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
