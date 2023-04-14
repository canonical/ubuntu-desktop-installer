import 'dart:ui';

import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart' show KeySearchX;

import '../../l10n.dart';
import '../../services/sound_service.dart';

/// @internal
final log = Logger('welcome');

/// Implements the business logic of the welcome page.
class WelcomeModel extends SafeChangeNotifier {
  /// Creates a model with the specified [client].
  WelcomeModel({
    required SubiquityClient client,
    required SoundService? sound,
  })  : _client = client,
        _sound = sound;

  final SubiquityClient _client;
  final SoundService? _sound;

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

  var _languageList = <LocalizedLanguage>[];

  /// Loads available languages.
  Future<void> loadLanguages() async {
    assert(_languageList.isEmpty);
    final languages = await loadLocalizedLanguages(supportedLocales);
    _languageList = List.of(languages);
    log.info('Loaded ${_languageList.length} languages');
    notifyListeners();
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

  Future<void> playWelcomeSound() async => _sound?.play('system-ready');

  /// Searches for a language matching the given [query].
  ///
  /// See also:
  /// * [KeySearchX.keySearch]
  int searchLanguage(String query) {
    return _languageList
        .map((l) => l.name)
        .toList()
        .keySearch(query, selectedLanguageIndex + 1);
  }

  /// Selects the best match for the given [locale].
  ///
  /// See also:
  /// * [LocalizedLanguageMatcher.findBestMatch]
  void selectLocale(Locale locale) {
    _selectedLanguageIndex = _languageList.findBestMatch(locale);
  }
}
