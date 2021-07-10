import 'dart:ui';

import 'package:diacritic/diacritic.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:tuple/tuple.dart';

import '../../keyboard_model.dart';

class WelcomeModel extends ChangeNotifier {
  WelcomeModel({
    required SubiquityClient client,
    required KeyboardModel keyboardModel,
  })  : _client = client,
        _keyboardModel = keyboardModel;

  final SubiquityClient _client;
  final KeyboardModel _keyboardModel;

  int _selectedLanguageIndex = 0;
  int get selectedLanguageIndex => _selectedLanguageIndex;
  set selectedLanguageIndex(int index) {
    if (_selectedLanguageIndex == index) return;
    _selectedLanguageIndex = index;
    notifyListeners();
  }

  final _languageList = <Tuple2<Locale, String>>[];

  Future<void> loadLanguages() async {
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

  Future<void> loadKeyboardModel() => _keyboardModel.load(_client);

  Locale locale(int index) => _languageList[index].item1;
  Future<void> setLocale(Locale locale) {
    return _client.setLocale(locale.languageCode);
  }

  int get languageCount => _languageList.length;
  String language(int index) => _languageList[index].item2;

  void selectLocale(String locale) {
    for (var i = 0; i < _languageList.length; ++i) {
      if (locale.contains(this.locale(i).languageCode)) {
        selectedLanguageIndex = i;
        break;
      }
    }
  }
}
