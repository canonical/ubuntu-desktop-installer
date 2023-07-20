import 'package:flutter/widgets.dart';
import 'package:ubuntu_localizations/ubuntu_localizations.dart';
import 'package:ubuntu_provision/l10n.dart';
import 'l10n/ubuntu_bootstrap_localizations.dart';

export 'package:ubuntu_localizations/ubuntu_localizations.dart';
export 'package:ubuntu_provision/l10n.dart';
export 'l10n/ubuntu_bootstrap_localizations.dart';

/// All localization delegates for the Ubuntu Desktop Installer.
const localizationsDelegates = <LocalizationsDelegate<dynamic>>[
  ...UbuntuBootstrapLocalizations.localizationsDelegates,
  ...UbuntuProvisionLocalizations.localizationsDelegates,
  ...GlobalUbuntuLocalizations.delegates,
];
