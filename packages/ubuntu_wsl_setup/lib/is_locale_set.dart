import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wizard/utils.dart';

Future<bool> isLocaleSet(SubiquityClient client) async {
  final loc = await client.getLocale().then(parseLocale);
  return loc.languageCode != 'C';
}
