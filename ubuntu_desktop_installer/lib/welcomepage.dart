import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yaru/yaru.dart';

import 'package:subiquity_client/subiquity_client.dart';

class WelcomePageButton extends StatefulWidget {
  const WelcomePageButton({
    Key key,
    this.imageAsset,
    this.bodyText,
    this.actionText,
    this.onPressed,
  }) : super(key: key);

  final String imageAsset;
  final String bodyText;
  final String actionText;
  final VoidCallback onPressed;

  @override
  _WelcomePageButtonState createState() => _WelcomePageButtonState();
}

class _WelcomePageButtonState extends State<WelcomePageButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(children: <Widget>[
          SizedBox(height: 20),
          Expanded(child: Image.asset(widget.imageAsset)),
          SizedBox(height: 40),
          Expanded(
              child: Text(
            widget.bodyText,
            style: yaruBodyText1Style.copyWith(
                color: yaruLightColorScheme.primaryVariant),
          )),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              widget.actionText,
              style: yaruBodyText1Style.copyWith(color: Colors.green[800]),
            ),
          ),
        ]),
      ),
      onPressed: () => widget.onPressed(),
    );
  }
}

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final SubiquityClient _client = SubiquityClient();
  int _selectedLanguageIndex = 0;
  TapGestureRecognizer _releaseNotesTapHandler;

  @override
  void initState() {
    super.initState();
    _releaseNotesTapHandler = TapGestureRecognizer()
      ..onTap = () {
        launch(_client.releaseNotesURL);
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
        title: Text(widget.title),
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: yaruLightTheme.dividerColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: ListView.builder(
                          itemCount: _client.languagelist.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(_client.languagelist[index]),
                              selected: index == _selectedLanguageIndex,
                              onTap: () {
                                setState(() {
                                  _selectedLanguageIndex = index;
                                });
                              },
                            );
                          }),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: WelcomePageButton(
                                  imageAsset: 'assets/steering-wheel.png',
                                  bodyText:
                                      'You can try Ubuntu without making any changes to your computer.',
                                  actionText: 'Try Ubuntu',
                                  onPressed: () {
                                    print('TODO: try Ubuntu');
                                  },
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: WelcomePageButton(
                                  imageAsset: 'assets/hard-drive.png',
                                  bodyText:
                                      "Install Ubuntu alongside (or instead of) your current operating system. This shouldn't take too long.",
                                  actionText: 'Install Ubuntu',
                                  onPressed: () {
                                    print('TODO: install Ubuntu');
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 200),
                        Align(
                          alignment: Alignment.centerRight,
                          child: RichText(
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ])),
    );
  }
}
