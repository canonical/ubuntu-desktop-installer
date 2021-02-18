import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';

/// Finds the Locale of Operating System i.e. Platform. and assigns it to
/// [Intl.systemLocale] and [Intl.defaultLocale].
///
/// Must See,
/// * [Intl.defaultLocale]
/// * [Intl.systemLocale]
void setupAppLocalizations() async {
  await findSystemLocale();
  Intl.defaultLocale = Intl.systemLocale;
}
