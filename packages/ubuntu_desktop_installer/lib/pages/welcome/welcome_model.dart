import 'dart:ui';

import 'package:diacritic/diacritic.dart';
import 'package:flutter/foundation.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:tuple/tuple.dart';

import '../../l10n.dart';
import '../../services.dart';

/// Implements the business logic of the welcome page.
class WelcomeModel extends ChangeNotifier {
  /// Creates a model with the specified [client] and [keyboardService].
  WelcomeModel({
    required SubiquityClient client,
    required KeyboardService keyboardService,
  })  : _client = client,
        _keyboardService = keyboardService;

  final SubiquityClient _client;
  final KeyboardService _keyboardService;

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

  /// Loads keyboards for the currently selected locale.
  Future<void> loadKeyboards() => _keyboardService.load(_client);

  /// Returns the locale for the given language [index].
  Locale locale(int index) => _languageList[index].item1;

  /// Applies the given [locale].
  Future<void> applyLocale(Locale locale) {
    return _client
        .setLocale('${locale.languageCode}_${locale.countryCode}.UTF-8');
  }

  /// Returns the number of languages.
  int get languageCount => _languageList.length;

  /// Returns the name of the language at the given [index].
  String language(int index) => _languageList[index].item2;

  /// Selects the given [locale].
  void selectLocale(String locale) {
    // Cater for various locale formats, such as "fr_FR.UTF-8" and "fr_UTF-8_FR"
    var l = locale.toLowerCase();
    l = l.replaceAll(RegExp(r'\.?utf-8'), '');
    final codes = l.split('_');
    final languageCode = codes.first;
    final countryCode = codes.last;

    // Try an exact match (language code + country code),
    // and fall back on a partial match (language code only).
    var found = false;
    var fallbackLocaleIndex = -1;
    for (var i = 0; i < _languageList.length; ++i) {
      final aLocale = this.locale(i);
      if (aLocale.languageCode.toLowerCase() == languageCode) {
        if (aLocale.countryCode?.toLowerCase() == countryCode) {
          selectedLanguageIndex = i;
          found = true;
          break;
        } else if (aLocale.countryCode == null || fallbackLocaleIndex == -1) {
          fallbackLocaleIndex = i;
        }
      }
    }
    if (!found && fallbackLocaleIndex > -1) {
      selectedLanguageIndex = fallbackLocaleIndex;
    }
  }
}
