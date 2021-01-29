import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yaru/yaru.dart';

import 'package:subiquity_client/subiquity_client.dart';

import 'i18n.dart';

enum Option { none, repairUbuntu, tryUbuntu, installUbuntu }

class OptionCard extends StatefulWidget {
  OptionCard({
    Key key,
    this.option,
    this.imageAsset,
    this.titleText,
    this.bodyText,
  }) : super(key: key);

  final Option option;
  final String imageAsset;
  final String titleText;
  final String bodyText;

  @override
  _OptionCardState createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard> {
  bool selected = false;
  bool hovered = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      selected = (TryOrInstallPage.of(context).option == widget.option);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: (hovered || selected) ? 4.0 : 1.0,
      child: InkWell(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(children: <Widget>[
            SizedBox(height: 20),
            Expanded(flex: 2, child: Image.asset(widget.imageAsset)),
            SizedBox(height: 40),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.titleText,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                )),
            SizedBox(height: 10),
            Expanded(
                child: Text(
              widget.bodyText,
              style: yaruBodyText1Style.copyWith(
                  color: yaruLightColorScheme.primaryVariant),
            )),
          ]),
        ),
        onTap: () {
          TryOrInstallPage.of(context).selectOption(widget.option);
        },
        onHover: (bool value) {
          setState(() {
            hovered = value;
          });
        },
      ),
    );
  }
}

class TryOrInstallPageInheritedContainer extends InheritedWidget {
  final TryOrInstallPageState data;

  TryOrInstallPageInheritedContainer({
    Key key,
    Widget child,
    this.data,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}

class TryOrInstallPage extends StatefulWidget {
  final Widget child;
  final SubiquityClient client;

  const TryOrInstallPage({
    Key key,
    this.child,
    this.client,
  }) : super(key: key);

  static TryOrInstallPageState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<
            TryOrInstallPageInheritedContainer>()
        .data;
  }

  @override
  State<StatefulWidget> createState() => TryOrInstallPageState();

  String get title => Intl.message('Try or install');

  String get repairTitle => Intl.message('Repair installation');
  String get repairDescription => Intl.message(
      'Repairing will reinstall all installed software without touching documents or settings.');

  String get tryTitle => Intl.message('Try Ubuntu');
  String get tryDescription => Intl.message(
      'You can try Ubuntu without making any changes to your computer.');

  String get installTitle => Intl.message('Install Ubuntu');
  String get installDescription => Intl.message(
      "Install Ubuntu alongside (or instead of) your current operating system. This shouldn't take too long.");

  String releaseNotesLabel(url) => Intl.message(
        'You may wish to read the <a href="$url">release notes</a>.',
        name: 'releaseNotesLabel',
        args: [url],
      );
}

class TryOrInstallPageState extends State<TryOrInstallPage> {
  Option option = Option.none;

  void selectOption(Option option) {
    assert(option != Option.none);
    if (option != this.option) {
      setState(() {
        this.option = option;
      });
    }
  }

  void continueWithSelectedOption() {
    if (option == Option.repairUbuntu) {
      Navigator.pushNamed(context, '/repairubuntu');
    } else if (option == Option.tryUbuntu) {
      Navigator.pushNamed(context, '/tryubuntu');
    } else if (option == Option.installUbuntu) {
      // XXX: detect we need to show the "Turn off RST" page,
      // or if we can proceed directly to installation
      //Navigator.pushNamed(context, '/turnoffrst');
      Navigator.pushNamed(context, '/keyboardlayout');
    } else {
      assert(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        automaticallyImplyLeading: false,
      ),
      body: TryOrInstallPageInheritedContainer(
        data: this,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              SizedBox(height: 50),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: OptionCard(
                        option: Option.repairUbuntu,
                        imageAsset: 'assets/repair-wrench.png',
                        titleText: widget.repairTitle,
                        bodyText: widget.repairDescription,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: OptionCard(
                        option: Option.tryUbuntu,
                        imageAsset: 'assets/steering-wheel.png',
                        titleText: widget.tryTitle,
                        bodyText: widget.tryDescription,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: OptionCard(
                        option: Option.installUbuntu,
                        imageAsset: 'assets/hard-drive.png',
                        titleText: widget.installTitle,
                        bodyText: widget.installDescription,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 150),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    child: Html(
                      data: widget
                          .releaseNotesLabel(widget.client.releaseNotesURL),
                      onLinkTap: (url) => launch(url),
                    ),
                  ),
                  ButtonBar(
                    children: <OutlinedButton>[
                      OutlinedButton(
                        child: Text(
                            UbuntuLocalizations.of(context).goBackButtonText),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      OutlinedButton(
                        child: Text(
                            UbuntuLocalizations.of(context).continueButtonText),
                        onPressed: (option != Option.none)
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
      ),
    );
  }
}
