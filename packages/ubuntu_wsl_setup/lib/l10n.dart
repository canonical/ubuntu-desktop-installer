import 'package:flutter/widgets.dart';
import 'package:ubuntu_localizations/ubuntu_localizations.dart';
import 'l10n/app_localizations.dart';

export 'package:ubuntu_localizations/ubuntu_localizations.dart';
export 'l10n/app_localizations.dart';

/// All localization delegates for the Ubuntu Desktop Installer.
const localizationsDelegates = <LocalizationsDelegate<dynamic>>[
  ...AppLocalizations.localizationsDelegates,
  ...GlobalUbuntuLocalizations.delegates,
];
