import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

import 'localized_view.dart';
import 'main.dart';
import 'routes.dart';

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
              child: Opacity(
                opacity: 0.9,
                child: Text(widget.bodyText),
              ),
            ),
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
  const TryOrInstallPage({
    Key key,
  }) : super(key: key);

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
      Navigator.pushNamed(context, Routes.repairUbuntu);
    } else if (_option == Option.tryUbuntu) {
      Navigator.pushNamed(context, Routes.tryUbuntu);
    } else if (_option == Option.installUbuntu) {
      // TODO: detect if we need to show the "Turn off RST" page,
      // or if we can proceed directly to installation
      //Navigator.pushNamed(context, Routes.turnOffRST);
      Navigator.pushNamed(context, Routes.keyboardLayout);
    } else {
      assert(false);
    }
  }

  String get _releaseNotesURL {
    final fileOnCdrom = File('/cdrom/.disk/release_notes_url');
    if (fileOnCdrom.existsSync()) {
      try {
        final url = fileOnCdrom
            .readAsLinesSync()
            .firstWhere((line) => line.trim().isNotEmpty);
        return url.replaceAll(
            r'${LANG}', UbuntuDesktopInstallerApp.locale.languageCode);
        // ignore: avoid_catches_without_on_clauses
      } catch (e) {}
    }
    try {
      final lines = File('/usr/share/distro-info/ubuntu.csv').readAsLinesSync();
      final last = lines.lastWhere((line) => line.trim().isNotEmpty);
      final codeName = last.split(',')[1].replaceAll(RegExp('\\s+'), '');
      assert(codeName.isNotEmpty);
      return 'https://wiki.ubuntu.com/$codeName/ReleaseNotes';
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      // Those are not actual release notes,
      // but it's a better fallback than a non-existent wiki page.
      return 'https://ubuntu.com/download/desktop';
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
                        data: lang.releaseNotesLabel(_releaseNotesURL),
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
