import 'dart:async';

import 'package:dbus/dbus.dart';
import 'package:meta/meta.dart';

const kUbuntuProService = 'com.canonical.UbuntuAdvantage';
const kUbuntuProInterface = 'com.canonical.UbuntuAdvantage.Manager';
const kUbuntuProManager = '/com/canonical/UbuntuAdvantage/Manager';

abstract class UbuntuProException implements Exception {
  const UbuntuProException([this.message]);
  final String? message;
}

class UbuntuProFailedException extends UbuntuProException {
  static const name = 'com.canonical.UbuntuAdvantage.Failed';
  UbuntuProFailedException([String? message]) : super(message);
}

class UbuntuProAuthFailedException extends UbuntuProException {
  static const name = 'com.canonical.UbuntuAdvantage.AuthFailed';
  UbuntuProAuthFailedException([String? message]) : super(message);
}

abstract class UbuntuProClient {
  factory UbuntuProClient() => UbuntuProDBusClient();

  String get daemonVersion;
  bool get isAttached;
  Stream<List<String>> get propertiesChanged;

  Future<void> connect();
  Future<void> close();
  Future<void> attach(String token);
  Future<void> detach();
}

class UbuntuProDBusClient implements UbuntuProClient {
  UbuntuProDBusClient([@visibleForTesting DBusRemoteObject? dbus])
      : _dbus = dbus ?? _defaultRemoteObject();

  static DBusRemoteObject _defaultRemoteObject() {
    return DBusRemoteObject(
      DBusClient.system(),
      name: kUbuntuProService,
      path: DBusObjectPath(kUbuntuProManager),
    );
  }

  final DBusRemoteObject _dbus;

  final _properties = <String, DBusValue>{};
  StreamSubscription? _propertySubscription;
  final _propertyController = StreamController<List<String>>.broadcast();

  String get daemonVersion => _getStringProperty('DaemonVersion', '');
  bool get isAttached => _getBooleanProperty('Attached', false);
  Stream<List<String>> get propertiesChanged => _propertyController.stream;

  @override
  Future<void> connect() async {
    _propertySubscription ??= _dbus.propertiesChanged.listen((signal) {
      if (signal.propertiesInterface == kUbuntuProInterface) {
        _updateProperties(signal.changedProperties);
      }
    });
    _updateProperties(await _dbus.getAllProperties(kUbuntuProInterface));
  }

  @override
  Future<void> close() async {
    await _propertySubscription?.cancel();
    _propertySubscription = null;
    _dbus.client.close();
  }

  @override
  Future<void> attach(String token) async {
    try {
      await _dbus
          .callMethod(kUbuntuProInterface, 'Attach', [DBusString(token)]);
    } on DBusMethodResponseException catch (e) {
      _handleException(e);
    }
  }

  @override
  Future<void> detach() async {
    try {
      await _dbus.callMethod(kUbuntuProInterface, 'Detach', []);
    } on DBusMethodResponseException catch (e) {
      _handleException(e);
    }
  }

  bool _handleException(DBusMethodResponseException e) {
    final message = e.response.values.first.toNative() as String;
    switch (e.errorName) {
      case UbuntuProFailedException.name:
        throw UbuntuProFailedException(message);
      case UbuntuProAuthFailedException.name:
        throw UbuntuProAuthFailedException(message);
      default:
        throw e;
    }
  }

  bool _getBooleanProperty(String name, bool defaultValue) {
    final boolean = _properties[name] as DBusBoolean?;
    return boolean?.value ?? defaultValue;
  }

  String _getStringProperty(String name, String defaultValue) {
    final string = _properties[name] as DBusString?;
    return string?.value ?? defaultValue;
  }

  void _updateProperties(Map<String, DBusValue> properties) {
    _properties.addAll(properties);
    _propertyController.add(properties.keys.toList());
  }
}
