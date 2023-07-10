import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ubuntu_desktop_installer/l10n.dart' as udi;
import 'package:ubuntu_localizations/ubuntu_localizations.dart';
import 'package:ubuntu_provision/l10n.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';
export 'package:ubuntu_localizations/ubuntu_localizations.dart';
export 'package:ubuntu_provision/l10n.dart';

const localizationsDelegates = <LocalizationsDelegate<dynamic>>[
  ...AppLocalizations.localizationsDelegates,
  ...UbuntuProvisionLocalizations.localizationsDelegates,
  ...udi.AppLocalizations.localizationsDelegates,
  ...GlobalUbuntuLocalizations.delegates,
];
