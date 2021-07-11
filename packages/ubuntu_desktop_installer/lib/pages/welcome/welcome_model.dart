import 'dart:ui';

import 'package:diacritic/diacritic.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:tuple/tuple.dart';

import '../../keyboard_model.dart';

/// Implements the business logic of the welcome page.
class WelcomeModel extends ChangeNotifier {
  /// Creates a model with the specified [client] and [keyboardModel].
  WelcomeModel({
    required SubiquityClient client,
    required KeyboardModel keyboardModel,
  })  : _client = client,
        _keyboardModel = keyboardModel;

  final SubiquityClient _client;
  final KeyboardModel _keyboardModel;

  /// The index of the currently selected language.
  int get selectedLanguageIndex => _selectedLanguageIndex;
  int _selectedLanguageIndex = 0;
  set selectedLanguageIndex(int index) {
    if (_selectedLanguageIndex == index) return;
    _selectedLanguageIndex = index;
    notifyListeners();
  }

  final _languageList = <Tuple2<Locale, String>>[];

  /// Loads available languages.
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

  /// Loads keyboard model for the currently selected locale.
  Future<void> loadKeyboardModel() => _keyboardModel.load(_client);

  /// Returns the locale for the given language [index].
  Locale locale(int index) => _languageList[index].item1;

  /// Applies the given [locale].
  Future<void> applyLocale(Locale locale) {
    return _client.setLocale(locale.languageCode);
  }

  /// Returns the number of languages.
  int get languageCount => _languageList.length;

  /// Returns the name of the language at the given [index].
  String language(int index) => _languageList[index].item2;

  /// Selects the given [locale].
  void selectLocale(String locale) {
    for (var i = 0; i < _languageList.length; ++i) {
      if (locale.contains(this.locale(i).languageCode)) {
        selectedLanguageIndex = i;
        break;
      }
    }
  }
}
