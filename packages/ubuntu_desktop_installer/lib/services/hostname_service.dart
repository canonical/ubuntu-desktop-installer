import 'dart:async';

import 'package:dbus/dbus.dart';
import 'package:meta/meta.dart';
import 'package:ubuntu_wizard/utils.dart';

/// @internal
@visibleForTesting
const kHostnameInterface = 'org.freedesktop.hostname1';

/// @internal
@visibleForTesting
const kHostnamePath = '/org/freedesktop/hostname1';

/// Provides means for querying the system hostname.
///
/// https://www.freedesktop.org/software/systemd/man/org.freedesktop.hostname1.html
class HostnameService {
  /// Creates a new hostname service. The hostname D-BUS [object] can be passed
  /// for testing purposes.
  HostnameService([@visibleForTesting DBusRemoteObject? object])
      : _object = object ?? _createDefaultObject();

  static DBusRemoteObject _createDefaultObject() {
    return DBusRemoteObject(
      DBusClient.system(),
      name: kHostnameInterface,
      path: DBusObjectPath(kHostnamePath),
    );
  }

  /// Initializes the service and initializes the hostname properties.
  Future<void> init() async {
    await _initProperties();
    _propertyListener ??= _object.propertiesChanged.listen(_updateProperties);
  }

  /// Releases the resources used by the service.
  Future<void> dispose() async {
    await _hostnameController.close();
    await _staticHostnameController.close();
    await _propertyListener?.cancel();
    await _object.client.close();
  }

  late final DBusRemoteObject _object;
  StreamSubscription<DBusPropertiesChangedSignal>? _propertyListener;

  var _hostname = '';
  var _prettyHostname = '';
  var _staticHostname = '';

  /// Returns the hostname.
  String get hostname => _prettyHostname.orIfEmpty(_hostname)!;

  /// Stream of hostname changes.
  Stream<String> get hostnameChanged => _hostnameController.stream;
  final _hostnameController = StreamController<String>();

  /// Returns the static hostname.
  String get staticHostname => _staticHostname.orIfEmpty(_hostname.sanitize())!;

  /// Stream of static hostname changes.
  Stream<String> get staticHostnameChanged => _staticHostnameController.stream;
  final _staticHostnameController = StreamController<String>();

  /// Sets the system hostname.
  ///
  /// The specified hostname can be a pretty hostnamewith spaces and non-
  /// alphanumeric characters. A sanitized version of the hostname is set
  /// as the static hostname.
  Future<void> setHostname(String hostname) async {
    await _object.setHostname('SetPrettyHostname', hostname);
    await _object.setHostname('SetStaticHostname', hostname.sanitize());
  }

  void _updateHostname({
    required String? hostname,
    required String? prettyHostname,
    required String? staticHostname,
  }) {
    _hostname = hostname ?? _hostname;
    _prettyHostname = prettyHostname ?? _prettyHostname;
    _staticHostname = staticHostname ?? _staticHostname;

    if (!_hostnameController.isClosed) {
      _hostnameController.add(this.hostname);
    }
    if (!_staticHostnameController.isClosed) {
      _staticHostnameController.add(this.staticHostname);
    }
  }

  Future<void> _initProperties() async {
    _updateHostname(
      hostname: await _object.getHostname('Hostname'),
      prettyHostname: await _object.getHostname('PrettyHostname'),
      staticHostname: await _object.getHostname('StaticHostname'),
    );
  }

  void _updateProperties(DBusPropertiesChangedSignal signal) {
    _updateHostname(
      hostname: signal.getChangedHostname('Hostname'),
      prettyHostname: signal.getChangedHostname('PrettyHostname'),
      staticHostname: signal.getChangedHostname('StaticHostname'),
    );
  }
}

extension _HostnameObject on DBusRemoteObject {
  Future<String> getHostname(String name) async {
    final value = await getProperty(kHostnameInterface, name);
    return (value as DBusString).value;
  }

  Future<void> setHostname(String method, String argument) {
    final args = [DBusString(argument), const DBusBoolean(false)];
    return callMethod(kHostnameInterface, method, args);
  }
}

extension _ChangedHostname on DBusPropertiesChangedSignal {
  String? getChangedHostname(String name) {
    return (changedProperties[name] as DBusString?)?.value;
  }
}
