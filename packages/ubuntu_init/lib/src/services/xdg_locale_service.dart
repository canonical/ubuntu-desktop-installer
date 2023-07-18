import 'package:meta/meta.dart';
import 'package:ubuntu_provision/services.dart';
import 'package:xdg_locale/xdg_locale.dart';

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
