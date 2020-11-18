import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'l10n/messages_all.dart';

class UbuntuLocalizations {
  UbuntuLocalizations(this.localeName);

  static Future<UbuntuLocalizations> load(Locale locale) {
    final name = (locale.countryCode != null && locale.countryCode.isEmpty)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return UbuntuLocalizations(localeName);
    });
  }

  static UbuntuLocalizations of(BuildContext context) {
    return Localizations.of<UbuntuLocalizations>(context, UbuntuLocalizations);
  }

  final String localeName;

  static const LocalizationsDelegate<UbuntuLocalizations> delegate =
      _UbuntuLocalizationsDelegate();

  String get goBackButtonText => Intl.message('Go Back');
  String get continueButtonText => Intl.message('Continue');
}

class _UbuntuLocalizationsDelegate
    extends LocalizationsDelegate<UbuntuLocalizations> {
  const _UbuntuLocalizationsDelegate();

  // FIXME: use supportedLocales list
  @override
  bool isSupported(Locale locale) => ['en', 'fr'].contains(locale.languageCode);

  @override
  Future<UbuntuLocalizations> load(Locale locale) =>
      UbuntuLocalizations.load(locale);

  @override
  bool shouldReload(_UbuntuLocalizationsDelegate old) => false;
}
