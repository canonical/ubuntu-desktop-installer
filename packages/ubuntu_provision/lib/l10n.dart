import 'dart:ui';

import 'src/l10n/ubuntu_provision_localizations.dart';
export 'src/l10n/ubuntu_provision_localizations.dart';

/// All supported locales for Ubuntu Provision.
final List<Locale> supportedLocales = {
  const Locale('en'), // make sure 'en' comes first (#512)
  ...List.of(UbuntuProvisionLocalizations.supportedLocales)
    ..remove(const Locale('en')),
}.toList();
