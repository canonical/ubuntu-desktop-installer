import 'package:dbus/dbus.dart';
import 'package:meta/meta.dart';
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

class XdgLocaleService implements LocaleService {
  XdgLocaleService([@visibleForTesting DBusRemoteObject? object])
      : _object = object ?? _createRemoteObject();

  static DBusRemoteObject _createRemoteObject() {
    return DBusRemoteObject(
      DBusClient.system(),
      name: 'org.freedesktop.locale1',
      path: DBusObjectPath('/org/freedesktop/locale1'),
    );
  }

  final DBusRemoteObject _object;

  @override
  Future<String> getLocale() => _getLocale().then((v) => v['LANG']!);

  Future<Map<String, String>> _getLocale() async {
    final vars = await _object.getProperty(
      'org.freedesktop.locale1',
      'Locale',
      signature: DBusSignature.array(DBusSignature.string),
    );
    return Map.fromEntries(vars.asStringArray().map((e) {
      final p = e.split('=');
      return MapEntry(p.first, p.last);
    }));
  }

  @override
  Future<void> setLocale(String locale) async {
    final vars = await _getLocale();
    for (final k in vars.keys) {
      vars[k] = locale;
    }
    await _object.callMethod(
      'org.freedesktop.locale1',
      'SetLocale',
      [
        DBusArray.string([
          for (final k in vars.keys) '$k=${vars[k]}',
        ]),
        const DBusBoolean(false),
      ],
      replySignature: DBusSignature.empty,
    );
  }
}
