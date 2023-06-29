import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';
import 'package:ubuntu_widgets/ubuntu_widgets.dart' show KeySearchX;

/// @internal
final log = Logger('locale');

final localeModelProvider = ChangeNotifierProvider((ref) {
  return LocaleModel(
    locale: getService<LocaleService>(),
    sound: tryGetService<SoundService>(),
  );
});

/// Implements the business logic of the locale page.
class LocaleModel extends SafeChangeNotifier {
  /// Creates a model with the specified [client].
  LocaleModel({
    required LocaleService locale,
    required SoundService? sound,
  })  : _locale = locale,
        _sound = sound;

  final LocaleService _locale;
  final SoundService? _sound;

  /// The index of the currently selected language and locale.
  int get selectedIndex => _selectedIndex;
  int _selectedIndex = 0;

  /// The currently selected locale
  Locale? get selectedLocale =>
      _languageList.elementAtOrNull(selectedIndex)?.locale;

  Future<void> selectLanguage(int index) async {
    if (_selectedIndex == index) return;
    _selectedIndex = index;
    final locale = _languageList.elementAtOrNull(index)?.locale;
    if (locale != null) {
      log.info('Selected $locale as UI language');
    }
    return initDefaultLocale(locale.toString()).then((_) => notifyListeners());
  }

  var _languageList = <LocalizedLanguage>[];

  /// Loads available languages.
  Future<void> init() async {
    assert(_languageList.isEmpty);
    final languages = await loadLocalizedLanguages(supportedLocales);
    _languageList = List.of(languages);
    log.info('Loaded ${_languageList.length} languages');
    return _locale.getLocale().then((v) {
      selectLocale(parseLocale(v));
      notifyListeners();
    });
  }

  /// Returns the locale for the given language [index].
  Locale locale(int index) => _languageList[index].locale;

  /// Applies the given [locale].
  Future<void> applyLocale(Locale locale) {
    log.info('Set $locale as system locale');
    return _locale
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
        .keySearch(query, selectedIndex + 1);
  }

  /// Selects the best match for the given [locale].
  ///
  /// See also:
  /// * [LocalizedLanguageMatcher.findBestMatch]
  Future<void> selectLocale(Locale locale) {
    return selectLanguage(_languageList.findBestMatch(locale));
  }
}
