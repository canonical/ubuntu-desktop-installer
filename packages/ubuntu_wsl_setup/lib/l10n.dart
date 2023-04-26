import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ubuntu_localizations/ubuntu_localizations.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';
export 'package:ubuntu_localizations/ubuntu_localizations.dart';

/// All supported locales for the Ubuntu WSL Setup.
final List<Locale> supportedLocales = {
  const Locale('en'), // make sure 'en' comes first (#512)
  ...AppLocalizations.supportedLocales,
}.toList();

/// All localization delegates for the Ubuntu WSL Setup.
const localizationsDelegates = <LocalizationsDelegate<dynamic>>[
  ...AppLocalizations.localizationsDelegates,
  ...GlobalUbuntuLocalizations.delegates,
];
