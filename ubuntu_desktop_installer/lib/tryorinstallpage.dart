import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yaru/yaru.dart';

import 'package:subiquity_client/subiquity_client.dart';

class TryOrInstallPageButton extends StatefulWidget {
  const TryOrInstallPageButton({
    Key key,
    this.imageAsset,
    this.titleText,
    this.bodyText,
    this.onPressed,
  }) : super(key: key);

  final String imageAsset;
  final String titleText;
  final String bodyText;
  final VoidCallback onPressed;

  @override
  _TryOrInstallPageButtonState createState() => _TryOrInstallPageButtonState();
}

class _TryOrInstallPageButtonState extends State<TryOrInstallPageButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(children: <Widget>[
          SizedBox(height: 20),
          Expanded(child: Image.asset(widget.imageAsset)),
          SizedBox(height: 40),
          Expanded(child: Text(widget.titleText)),
          SizedBox(height: 20),
          Expanded(
              child: Text(
            widget.bodyText,
            style: yaruBodyText1Style.copyWith(
                color: yaruLightColorScheme.primaryVariant),
          )),
        ]),
      ),
      onPressed: () => widget.onPressed(),
    );
  }
}

class TryOrInstallPage extends StatefulWidget {
  const TryOrInstallPage({
    Key key,
    this.client,
  }) : super(key: key);

  final SubiquityClient client;

  @override
  _TryOrInstallPageState createState() => _TryOrInstallPageState();
}

class _TryOrInstallPageState extends State<TryOrInstallPage> {
  TapGestureRecognizer _releaseNotesTapHandler;

  @override
  void initState() {
    super.initState();
    _releaseNotesTapHandler = TapGestureRecognizer()
      ..onTap = () {
        launch(widget.client.releaseNotesURL);
      };
  }

  @override
  void dispose() {
    _releaseNotesTapHandler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Try or install'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TryOrInstallPageButton(
                      imageAsset: 'assets/repair-wrench.png',
                      titleText: 'Repair installation',
                      bodyText:
                          'Repairing will reinstall all installed software without touching documents or settings.',
                      onPressed: () {
                        print('TODO: repair Ubuntu');
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TryOrInstallPageButton(
                      imageAsset: 'assets/steering-wheel.png',
                      titleText: 'Try Ubuntu',
                      bodyText:
                          'You can try Ubuntu without making any changes to your computer.',
                      onPressed: () {
                        print('TODO: try Ubuntu');
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TryOrInstallPageButton(
                      imageAsset: 'assets/hard-drive.png',
                      titleText: 'Install Ubuntu',
                      bodyText:
                          "Install Ubuntu alongside (or instead of) your current operating system. This shouldn't take too long.",
                      onPressed: () {
                        print('TODO: install Ubuntu');
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 200),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    style: yaruBodyText1Style.copyWith(
                        color: yaruLightColorScheme.primaryVariant),
                    text: 'You may wish to read the ',
                    children: <TextSpan>[
                      TextSpan(
                        text: 'release notes',
                        style: TextStyle(color: Colors.blue),
                        recognizer: _releaseNotesTapHandler,
                      ),
                      TextSpan(text: '.'),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    OutlinedButton(
                      child: Text('Go Back'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 10),
                    OutlinedButton(
                      child: Text('Continue'),
                      onPressed: null, // TODO
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
