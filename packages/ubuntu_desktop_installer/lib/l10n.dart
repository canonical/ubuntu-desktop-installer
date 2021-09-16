import 'package:flutter/widgets.dart';
import 'package:ubuntu_wizard/l10n.dart';
import 'l10n/app_localizations.dart';

export 'package:ubuntu_wizard/l10n.dart';
export 'l10n/app_localizations.dart';

/// All localization delegates for the Ubuntu Desktop Installer.
const localizationsDelegates = <LocalizationsDelegate<dynamic>>[
  ...AppLocalizations.localizationsDelegates,
  ...UbuntuLocalizations.localizationsDelegates,
  LocalizationsDelegateOc(),
];
