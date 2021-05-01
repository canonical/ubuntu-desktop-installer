import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

import '../app.dart';
import '../routes.dart';
import '../widgets.dart';

enum Option { none, repairUbuntu, tryUbuntu, installUbuntu }

class TryOrInstallPage extends StatefulWidget {
  const TryOrInstallPage({
    Key? key,
  }) : super(key: key);

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
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 50),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: OptionCard(
                        selected: _option == Option.repairUbuntu,
                        imageAsset: 'assets/repair-wrench.png',
                        titleText: lang.repairInstallation,
                        bodyText: lang.repairInstallationDescription,
                        onSelected: () => selectOption(Option.repairUbuntu),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: OptionCard(
                        selected: _option == Option.tryUbuntu,
                        imageAsset: 'assets/steering-wheel.png',
                        titleText: lang.tryUbuntu,
                        bodyText: lang.tryUbuntuDescription,
                        onSelected: () => selectOption(Option.tryUbuntu),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: OptionCard(
                        selected: _option == Option.installUbuntu,
                        imageAsset: 'assets/hard-drive.png',
                        titleText: lang.installUbuntu,
                        bodyText: lang.installUbuntuDescription,
                        onSelected: () => selectOption(Option.installUbuntu),
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
                      onLinkTap: (url, _, __, ___) => launch(url!),
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
    );
  }
}
