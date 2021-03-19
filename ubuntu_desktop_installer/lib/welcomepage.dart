import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:tuple/tuple.dart';
import 'package:yaru/yaru.dart';
import 'package:subiquity_client/subiquity_client.dart';

import 'localized_view.dart';
import 'main.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({
    Key key,
    @required this.client,
  })  : assert(client != null, '`SubiquityClient` must not be `null`'),
        super(key: key);

  final SubiquityClient client;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final List<Tuple2<Locale, String>> _languageList = [];

  int _selectedLanguageIndex = 0;

  AutoScrollController _languageListScrollController;

  static const kbdAssetName = 'assets/kbdnames.txt';

  void _asyncLoadLanguageList() async {
    assert(_languageList.isEmpty);

    for (final locale in AppLocalizations.supportedLocales) {
      final localization = await AppLocalizations.delegate.load(locale);
      if (localization.languageName.isNotEmpty) {
        _languageList.add(Tuple2(locale, localization.languageName));
      }
    }

    _languageList.sort((a, b) =>
        removeDiacritics(a.item2).compareTo(removeDiacritics(b.item2)));
  }

  @override
  void initState() {
    super.initState();
    _languageListScrollController = AutoScrollController();

    _asyncLoadLanguageList();

    widget.client
        .fetchKeyboardLayouts(kbdAssetName, UbuntuDesktopInstallerApp.locale);
    final locale = Intl.defaultLocale;
    for (var i = 0; i < _languageList.length; ++i) {
      if (locale.contains(_languageList[i].item1.languageCode)) {
        _selectedLanguageIndex = i;
        break;
      }
    }
    SchedulerBinding.instance.addPostFrameCallback((_) =>
        _languageListScrollController.scrollToIndex(_selectedLanguageIndex,
            preferPosition: AutoScrollPosition.middle,
            duration: const Duration(milliseconds: 1)));
  }

  @override
  void dispose() {
    _languageListScrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LocalizedView(
      builder: (context, lang) => Scaffold(
        appBar: AppBar(title: Text(lang.welcome)),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: FractionallySizedBox(
                    widthFactor: 0.5,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: yaruLightTheme.dividerColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Scrollbar(
                        controller: _languageListScrollController,
                        child: ListView.builder(
                          controller: _languageListScrollController,
                          itemCount: _languageList.length,
                          itemBuilder: (context, index) {
                            return AutoScrollTag(
                                index: index,
                                key: ValueKey(index),
                                controller: _languageListScrollController,
                                child: ListTile(
                                  title: Text(_languageList[index].item2),
                                  selected: index == _selectedLanguageIndex,
                                  onTap: () {
                                    setState(() {
                                      _selectedLanguageIndex = index;
                                      final locale = _languageList[index].item1;
                                      UbuntuDesktopInstallerApp.locale = locale;
                                      widget.client.fetchKeyboardLayouts(
                                          kbdAssetName, locale);
                                    });
                                  },
                                ));
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ButtonBar(
                children: <OutlinedButton>[
                  OutlinedButton(
                    child: Text(lang.backButtonText),
                    onPressed: null,
                  ),
                  OutlinedButton(
                    child: Text(lang.continueButtonText),
                    onPressed: () {
                      Navigator.pushNamed(context, '/tryorinstall');
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
