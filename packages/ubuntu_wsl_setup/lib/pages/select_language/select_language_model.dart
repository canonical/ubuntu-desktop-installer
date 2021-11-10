import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/l10n.dart';
import 'package:ubuntu_wizard/utils.dart';

import '../../l10n.dart';

/// View model for [SelectLanguagePage].
class SelectLanguageModel extends ChangeNotifier {
  /// Creates a model with the specified client.
  SelectLanguageModel(this._client);

  final SubiquityClient _client;

  /// The index of the currently selected language.
  int get selectedLanguageIndex => _selectedLanguageIndex;
  int _selectedLanguageIndex = 0;
  set selectedLanguageIndex(int index) {
    if (_selectedLanguageIndex == index) return;
    _selectedLanguageIndex = index;
    notifyListeners();
  }

  var _languages = <LocalizedLanguage>[];

  /// Loads available languages.
  Future<void> loadLanguages() async {
    return loadLocalizedLanguages(AppLocalizations.supportedLocales)
        .then((languages) => _languages = languages)
        .then((_) => notifyListeners());
  }

  /// Returns the locale for the given language [index].
  Locale locale(int index) => _languages[index].locale;

  /// Applies the given [locale].
  Future<void> applyLocale(Locale locale) {
    return _client
        .setLocale('${locale.languageCode}_${locale.countryCode}.UTF-8');
  }

  /// Returns the number of languages.
  int get languageCount => _languages.length;

  /// Returns the name of the language at the given [index].
  String language(int index) => _languages[index].name;

  /// Selects the given [locale].
  void selectLocale(Locale locale) {
    _selectedLanguageIndex = _languages.findBestMatch(locale);
  }

  /// Returns the [locale] defined in Subiquity server.
  Future<Locale> getServerLocale() {
    return _client.locale().then(parseLocale);
  }
}
