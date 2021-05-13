import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets.dart';

const _kButtonPadding = EdgeInsets.only(right: 20, bottom: 20);

class TurnOffBitLockerPage extends StatefulWidget {
  @override
  _TurnOffBitLockerPageState createState() => _TurnOffBitLockerPageState();

  static Widget create(BuildContext context) {
    return TurnOffBitLockerPage();
  }
}

class _TurnOffBitLockerPageState extends State<TurnOffBitLockerPage> {
  @override
  Widget build(BuildContext context) {
    return LocalizedView(
      builder: (context, lang) => Scaffold(
        appBar: AppBar(
          title: Text(lang.turnOffBitlockerTitle),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(lang.turnOffBitlockerDescription),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Html(
                    data: lang.turnOffBitlockerLinkInstructions(
                        'help.ubuntu.com/bitlocker'),
                    style: {
                      'body': Style(
                        margin: EdgeInsets.all(0),
                      ),
                    },
                    onLinkTap: (url, _, __, ___) => launch(url!),
                  ),
                ),
              ),
              const SizedBox(height: 60),
              SvgPicture.asset('assets/qrbitlocker.svg')
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: _kButtonPadding,
          child: ButtonBar(
            children: <Widget>[
              OutlinedButton(
                child: Text(lang.backButtonText),
                onPressed: Navigator.of(context).pop,
              ),
              OutlinedButton(
                style: OutlinedButtonTheme.of(context).style!.copyWith(
                      backgroundColor: MaterialStateColor.resolveWith(
                        (states) => const Color(0xFF0e8420),
                      ),
                      foregroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white,
                      ),
                    ),
                child: Text(lang.restartIntoWindows),
                onPressed: () {
                  print('TODO: restart computer');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
