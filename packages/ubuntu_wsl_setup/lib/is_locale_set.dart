import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_localizations/ubuntu_localizations.dart';

Future<bool> isLocaleSet(SubiquityClient client) async {
  final loc = await client.getLocale().then(parseLocale);
  return loc.languageCode != 'C';
}
