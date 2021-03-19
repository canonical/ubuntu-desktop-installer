import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yaru/yaru.dart';

import 'package:subiquity_client/subiquity_client.dart';

import 'localized_view.dart';

enum Option { none, repairUbuntu, tryUbuntu, installUbuntu }

class OptionCard extends StatefulWidget {
  OptionCard({
    Key key,
    @required this.option,
    @required this.imageAsset,
    @required this.titleText,
    @required this.bodyText,
  })  : assert(option != null, '`option` must not be `null`'),
        assert(imageAsset != null, '`imageAsset` must not be `null`'),
        assert(titleText != null, '`titleText` must not be `null`'),
        assert(bodyText != null, '`bodyText` must not be `null`'),
        super(key: key);

  final Option option;
  final String imageAsset;
  final String titleText;
  final String bodyText;

  @override
  _OptionCardState createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard> {
  bool _selected = false;
  bool _hovered = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      _selected = (TryOrInstallPage.of(context)._option == widget.option);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: (_hovered || _selected) ? 4.0 : 1.0,
      child: InkWell(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(children: <Widget>[
            const SizedBox(height: 20),
            Expanded(flex: 2, child: Image.asset(widget.imageAsset)),
            const SizedBox(height: 40),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.titleText,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                )),
            const SizedBox(height: 10),
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
        onHover: (value) {
          setState(() {
            _hovered = value;
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
    @required this.data,
  })  : assert(data != null, '`TryOrInstallPageState` must not be `null`'),
        super(
          key: key,
          child: child,
        );

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}

class TryOrInstallPage extends StatefulWidget {
  final SubiquityClient client;

  const TryOrInstallPage({
    Key key,
    @required this.client,
  })  : assert(client != null, '`SubiquityClient` must not be `null`'),
        super(key: key);

  static TryOrInstallPageState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<
            TryOrInstallPageInheritedContainer>()
        .data;
  }

  @override
  TryOrInstallPageState createState() => TryOrInstallPageState();
}

class TryOrInstallPageState extends State<TryOrInstallPage> {
  Option _option = Option.none;

  void selectOption(Option option) {
    assert(option != Option.none);
    if (option != _option) {
      setState(() {
        _option = option;
      });
    }
  }

  void continueWithSelectedOption() {
    if (_option == Option.repairUbuntu) {
      Navigator.pushNamed(context, '/repairubuntu');
    } else if (_option == Option.tryUbuntu) {
      Navigator.pushNamed(context, '/tryubuntu');
    } else if (_option == Option.installUbuntu) {
      // TODO: detect if we need to show the "Turn off RST" page,
      // or if we can proceed directly to installation
      //Navigator.pushNamed(context, '/turnoffrst');
      Navigator.pushNamed(context, '/keyboardlayout');
    } else {
      assert(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LocalizedView(
      builder: (context, lang) => Scaffold(
        appBar: AppBar(
          title: Text(lang.tryOrInstallPageTitle),
          automaticallyImplyLeading: false,
        ),
        body: TryOrInstallPageInheritedContainer(
          data: this,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 50),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: OptionCard(
                          option: Option.repairUbuntu,
                          imageAsset: 'assets/repair-wrench.png',
                          titleText: lang.repairInstallation,
                          bodyText: lang.repairInstallationDescription,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: OptionCard(
                          option: Option.tryUbuntu,
                          imageAsset: 'assets/steering-wheel.png',
                          titleText: lang.tryUbuntu,
                          bodyText: lang.tryUbuntuDescription,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: OptionCard(
                          option: Option.installUbuntu,
                          imageAsset: 'assets/hard-drive.png',
                          titleText: lang.installUbuntu,
                          bodyText: lang.installUbuntuDescription,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 150),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      fit: FlexFit.tight,
                      child: Html(
                        data: lang
                            .releaseNotesLabel(widget.client.releaseNotesURL),
                        onLinkTap: launch,
                      ),
                    ),
                    ButtonBar(
                      children: <OutlinedButton>[
                        OutlinedButton(
                          child: Text(lang.backButtonText),
                          onPressed: Navigator.of(context).pop,
                        ),
                        OutlinedButton(
                          child: Text(lang.continueButtonText),
                          onPressed: (_option != Option.none)
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
      ),
    );
  }
}
