import 'dart:ui';

import 'package:diacritic/diacritic.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/utils.dart';

import '../../l10n.dart';

const kDefaultLocale = Locale('en', 'US');
// Languages we won't invest in shipping fonts for just yet.
// They lack translations anyway, so fonts will not be missed at this point.
// If users select one of those, we will submit it to Subiquity, but won't
// update the UI.
const _languagesLackingFontSupport = {
  'am': 'Amharic',
  'ar': 'Arabic',
  'bn': 'Bangla',
  'bo': 'Tibetan',
  'dz': 'Dzongkha',
  'fa': 'Persian',
  'gu': 'Gujarati',
  'he': 'Hebrew',
  'hi': 'Hindi',
  'ja': 'Japanese',
  'ka': 'Georgian',
  'km': 'Khmer',
  'kn': 'Kannada',
  'ko': 'Korean',
  'lo': 'Lao',
  'ml': 'Malayalam',
  'mr': 'Marathi',
  'my': 'Burmese',
  'ne': 'Nepali',
  'pa': 'Punjabi',
  'si': 'Sinhala',
  'ta': 'Tamil',
  'te': 'Telugu',
  'th': 'Thai',
  'ug': 'Uyghur',
  'vi': 'Vietnamese',
  'zh': 'Chinese',
};

extension XDisplayName on LocalizedLanguage {
  String displayName() {
    final langCode = locale.languageCode;
    final altName = _languagesLackingFontSupport[langCode];
    if (altName != null) {
      return altName;
    }
    return name;
  }
}

/// View model for [SelectLanguagePage].
class SelectLanguageModel extends SafeChangeNotifier {
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
    return loadLocalizedLanguages(supportedLocales).then((languages) {
      _languages = languages;
      _languages.sort((a, b) => removeDiacritics(a.displayName())
          .compareTo(removeDiacritics(b.displayName())));
    }).then((_) => notifyListeners());
  }

  /// Returns the locale for the given language [index].
  Locale locale(int index) => _languages[index].locale;

  /// Returns the appropriate locale for the given language [index] considering
  /// that the referred language might lack font support, for which case we
  /// return the default locale to avoid issues in the UI.
  Locale uiLocale(int index) {
    final lang = _languages[index].locale.languageCode;
    final altName = _languagesLackingFontSupport[lang];
    if (altName != null) {
      return kDefaultLocale;
    }
    return _languages[index].locale;
  }

  /// Applies the given [locale].
  Future<void> applyLocale(Locale locale) {
    return _client
        .setLocale('${locale.languageCode}_${locale.countryCode}.UTF-8');
  }

  /// Returns the number of languages.
  int get languageCount => _languages.length;

  /// Returns the name of the language at the given [index].
  /// To avoid issues with the UI in WSL, the international name of
  /// the language is returned in case it's blacklisted.
  String language(int index) => _languages[index].displayName();

  /// Selects the given [locale].
  void selectLocale(Locale locale) {
    _selectedLanguageIndex = _languages.findBestMatch(locale);
  }

  /// Returns the [locale] defined in Subiquity server.
  Future<Locale> getServerLocale() {
    return _client.locale().then(parseLocale);
  }
}
