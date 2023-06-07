import 'package:meta/meta.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:xdg_locale/xdg_locale.dart';

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

class XdgLocaleService implements LocaleService {
  XdgLocaleService([@visibleForTesting XdgLocaleClient? client])
      : _client = client ?? XdgLocaleClient();

  final XdgLocaleClient _client;
  @override
  Future<String> getLocale() async {
    await _client.connect();
    final locale = _client.locale['LANG']!;
    return locale;
  }

  @override
  Future<void> setLocale(String locale) async {
    await _client.connect();
    final vars = _client.locale.map((key, value) => MapEntry(key, locale));
    await _client.setLocale(vars, false);
  }
}
