import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final log = Logger('configure_active_directory');

/// https://github.com/canonical/ubuntu-desktop-installer/issues/41
class ConfigureActiveDirectoryModel extends ChangeNotifier {
  ConfigureActiveDirectoryModel() {
    Listenable.merge([
      _domain,
      _admin,
      _password,
    ]).addListener(notifyListeners);
  }

  final _domain = ValueNotifier<String?>(null);
  final _admin = ValueNotifier<String?>(null);
  final _password = ValueNotifier<String?>(null);

  String get domain => _domain.value ?? '';
  set domain(String value) => _domain.value = value;

  String get admin => _admin.value ?? '';
  set admin(String value) => _admin.value = value;

  String get password => _password.value ?? '';
  set password(String value) => _password.value = value;

  // TODO: test the connection
  Future<void> testConnection() async {
    log.debug('Testing connection: $domain');
  }

  bool get isValid =>
      domain.isNotEmpty && admin.isNotEmpty && password.isNotEmpty;

  // TODO: load previously saved credentials
  Future<void> load() async {}

  // TODO: save the credentials
  Future<void> save() async {}
}
