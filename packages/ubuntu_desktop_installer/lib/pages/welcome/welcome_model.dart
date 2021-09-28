import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:subiquity_client/subiquity_client.dart';

import '../../l10n.dart';
import '../../services.dart';

/// @internal
final log = Logger('welcome');

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
    if (index >= 0 && index < _languageList.length) {
      log.info('Selected ${_languageList[index].locale} as UI language');
    }
    notifyListeners();
  }

  final _languageList = <LocalizedLanguage>[];

  /// Loads available languages.
  Future<void> loadLanguages() async {
    assert(_languageList.isEmpty);
    final languages =
        await loadLocalizedLanguages(AppLocalizations.supportedLocales);
    _languageList.addAll(languages);
    log.info('Loaded ${languages.length} languages');
    notifyListeners();
  }

  /// Loads keyboards for the currently selected locale.
  Future<void> loadKeyboards() async {
    await _keyboardService.load(_client);
    log.info('Loaded ${_keyboardService.layouts.length} keyboard layouts');
  }

  /// Returns the locale for the given language [index].
  Locale locale(int index) => _languageList[index].locale;

  /// Applies the given [locale].
  Future<void> applyLocale(Locale locale) {
    log.info('Set $locale as system locale');
    return _client
        .setLocale('${locale.languageCode}_${locale.countryCode}.UTF-8');
  }

  /// Returns the number of languages.
  int get languageCount => _languageList.length;

  /// Returns the name of the language at the given [index].
  String language(int index) => _languageList[index].name;

  /// Selects the best match for the given [locale].
  ///
  /// See also:
  /// * [LocalizedLanguageMatcher.findBestMatch]
  void selectLocale(Locale locale) {
    _selectedLanguageIndex = _languageList.findBestMatch(locale);
  }
}
