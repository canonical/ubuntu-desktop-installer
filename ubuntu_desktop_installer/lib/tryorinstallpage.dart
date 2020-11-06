import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yaru/yaru.dart';

import 'package:subiquity_client/subiquity_client.dart';

class TryOrInstallPageCard extends StatefulWidget {
  TryOrInstallPageCard({
    Key key,
    this.imageAsset,
    this.titleText,
    this.bodyText,
    this.onSelected,
  }) : super(key: key);

  final String imageAsset;
  final String titleText;
  final String bodyText;
  final VoidCallback onSelected;

  @override
  _TryOrInstallPageCardState createState() => _TryOrInstallPageCardState();
}

class _TryOrInstallPageCardState extends State<TryOrInstallPageCard> {
  bool selected = false;
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: (hovered || selected) ? 2.0 : 1.0,
      child: InkWell(
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
        onTap: () {
          selected = true;
          widget.onSelected();
        },
        onHover: (bool value) {
          hovered = value;
        },
      ),
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

enum SelectedOption { none, repairUbuntu, tryUbuntu, installUbuntu }

class _TryOrInstallPageState extends State<TryOrInstallPage> {
  TapGestureRecognizer _releaseNotesTapHandler;

  SelectedOption selectedOption = SelectedOption.none;

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

  void continueWithSelectedOption() {
    if (selectedOption == SelectedOption.repairUbuntu) {
      Navigator.pushNamed(context, '/repairubuntu');
    } else if (selectedOption == SelectedOption.tryUbuntu) {
      Navigator.pushNamed(context, '/tryubuntu');
    } else if (selectedOption == SelectedOption.installUbuntu) {
      Navigator.pushNamed(context, '/installubuntu');
    } else {
      assert(false);
    }
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
                    child: TryOrInstallPageCard(
                      imageAsset: 'assets/repair-wrench.png',
                      titleText: 'Repair installation',
                      bodyText:
                          'Repairing will reinstall all installed software without touching documents or settings.',
                      onSelected: () {
                        setState(() {
                          selectedOption = SelectedOption.repairUbuntu;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TryOrInstallPageCard(
                      imageAsset: 'assets/steering-wheel.png',
                      titleText: 'Try Ubuntu',
                      bodyText:
                          'You can try Ubuntu without making any changes to your computer.',
                      onSelected: () {
                        setState(() {
                          selectedOption = SelectedOption.tryUbuntu;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TryOrInstallPageCard(
                      imageAsset: 'assets/hard-drive.png',
                      titleText: 'Install Ubuntu',
                      bodyText:
                          "Install Ubuntu alongside (or instead of) your current operating system. This shouldn't take too long.",
                      onSelected: () {
                        setState(() {
                          selectedOption = SelectedOption.installUbuntu;
                        });
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
                ButtonBar(
                  children: <OutlinedButton>[
                    OutlinedButton(
                      child: Text('Go Back'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    OutlinedButton(
                      child: Text('Continue'),
                      onPressed: (selectedOption != SelectedOption.none)
                          ? continueWithSelectedOption
                          : null,
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
