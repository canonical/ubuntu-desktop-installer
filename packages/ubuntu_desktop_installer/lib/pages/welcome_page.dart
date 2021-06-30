import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:tuple/tuple.dart';

import '../app.dart';
import '../keyboard_model.dart';
import '../routes.dart';
import '../widgets.dart';
import 'wizard_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({
    Key? key,
  }) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final List<Tuple2<Locale, String>> _languageList = [];

  int _selectedLanguageIndex = 0;

  final _languageListScrollController = AutoScrollController();

  void _asyncLoadLanguageList() async {
    assert(_languageList.isEmpty);

    for (final locale in AppLocalizations.supportedLocales) {
      final localization = await AppLocalizations.delegate.load(locale);
      if (localization.languageName.isNotEmpty) {
        _languageList.add(Tuple2(locale, localization.languageName));
      }
    }

    setState(() {
      _languageList.sort((a, b) =>
          removeDiacritics(a.item2).compareTo(removeDiacritics(b.item2)));
    });
  }

  @override
  void initState() {
    super.initState();

    _asyncLoadLanguageList();

    Provider.of<KeyboardModel>(context, listen: false)
        .load(Provider.of<SubiquityClient>(context, listen: false));

    final locale = Intl.defaultLocale;
    for (var i = 0; i < _languageList.length; ++i) {
      if (locale!.contains(_languageList[i].item1.languageCode)) {
        _selectedLanguageIndex = i;
        break;
      }
    }
    SchedulerBinding.instance!.addPostFrameCallback((_) =>
        _languageListScrollController.scrollToIndex(_selectedLanguageIndex,
            preferPosition: AutoScrollPosition.middle,
            duration: const Duration(milliseconds: 1)));
  }

  @override
  void dispose() {
    _languageListScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LocalizedView(
      builder: (context, lang) => WizardPage(
        title: Text(lang.welcome),
        content: FractionallySizedBox(
          widthFactor: 0.5,
          child: RoundedListView.builder(
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
                  onTap: () async {
                    final locale = _languageList[index].item1;
                    final subiquityClient =
                        Provider.of<SubiquityClient>(context, listen: false);
                    await subiquityClient.setLocale(locale.languageCode);
                    setState(() {
                      _selectedLanguageIndex = index;
                      UbuntuDesktopInstallerApp.locale = locale;
                      Provider.of<KeyboardModel>(context, listen: false)
                          .load(subiquityClient);
                    });
                  },
                ),
              );
            },
          ),
        ),
        actions: <WizardAction>[
          WizardAction(label: lang.backButtonText),
          WizardAction(
            label: lang.continueButtonText,
            onActivated: () {
              // TODO: implement ubiquity's apply_keyboard() function and run it here
              Navigator.pushNamed(context, Routes.tryOrInstall);
            },
          ),
        ],
      ),
    );
  }
}
