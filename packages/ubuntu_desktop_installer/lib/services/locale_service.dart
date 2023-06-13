import 'package:subiquity_client/subiquity_client.dart';

abstract class LocaleService {
  Future<String> getLocale();
  Future<void> setLocale(String locale);
}

class SubiquityLocaleService implements LocaleService {
  const SubiquityLocaleService(this._subiquity);

  final SubiquityClient _subiquity;

  @override
  Future<String> getLocale() => _subiquity.getLocale();

  @override
  Future<void> setLocale(String locale) => _subiquity.setLocale(locale);
}
