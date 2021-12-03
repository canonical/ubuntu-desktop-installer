import 'package:flutter/widgets.dart';
import 'package:ubuntu_localizations/ubuntu_localizations.dart';
import 'l10n/app_localizations.dart';

export 'package:ubuntu_localizations/ubuntu_localizations.dart';
export 'l10n/app_localizations.dart';

/// All supported locales for the Ubuntu Desktop Installer.
final List<Locale> supportedLocales = {
  const Locale('en'), // make sure 'en' comes first (#512)
  ...List.of(AppLocalizations.supportedLocales)..remove(Locale('en')),
}.toList();

/// All localization delegates for the Ubuntu Desktop Installer.
const localizationsDelegates = <LocalizationsDelegate<dynamic>>[
  ...AppLocalizations.localizationsDelegates,
  ...GlobalUbuntuLocalizations.delegates,
];
