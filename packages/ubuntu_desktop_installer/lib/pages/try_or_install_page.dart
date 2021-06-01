import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

import '../app.dart';
import '../routes.dart';
import '../widgets.dart';
import 'wizard_page.dart';

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
      builder: (context, lang) => WizardPage(
        title: Text(lang.tryOrInstallPageTitle),
        contentPadding: EdgeInsets.fromLTRB(20, 50, 20, 150),
        content: Row(
          children: [
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
        footer: Html(
          data: lang.releaseNotesLabel(_releaseNotesURL),
          onLinkTap: (url, _, __, ___) => launch(url!),
        ),
        actions: <WizardAction>[
          WizardAction(
            label: lang.backButtonText,
            onActivated: Navigator.of(context).pop,
          ),
          WizardAction(
            label: lang.continueButtonText,
            enabled: _option != Option.none,
            onActivated: continueWithSelectedOption,
          ),
        ],
      ),
    );
  }
}
