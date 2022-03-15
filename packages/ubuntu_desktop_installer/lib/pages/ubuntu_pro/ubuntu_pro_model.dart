import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';

import '../../services.dart';

/// @internal
final log = Logger('ubuntu_pro');

enum UbuntuProMode { enable, skip }
enum UbuntuProError { failed, authFailed }
enum UbuntuProStatus {
  init,
  ready,
  attaching,
  attached,
  detaching,
  detached,
  error,
}

class UbuntuProModel extends ChangeNotifier {
  UbuntuProModel(this._client);

  var _token = '';
  var _mode = UbuntuProMode.skip;
  var _status = UbuntuProStatus.init;
  UbuntuProError? _error;
  final UbuntuProClient _client;

  bool get isAttached => status == UbuntuProStatus.attached;
  bool get isAttaching => status == UbuntuProStatus.attaching;
  bool get isEnabled => mode == UbuntuProMode.enable;
  bool get hasError => status == UbuntuProStatus.error;
  bool get hasValidToken => isValidToken(_token);

  UbuntuProMode get mode => _mode;
  set mode(UbuntuProMode mode) {
    if (_mode == mode) return;
    _mode = mode;
    notifyListeners();
  }

  UbuntuProError? get error => _error;
  UbuntuProStatus get status => _status;

  void _setStatus(UbuntuProStatus status, [UbuntuProException? exception]) {
    if (exception != null) {
      log.error('Status: error (${exception.message})');
    } else if (_status != status) {
      log.debug('Status: ${status.name}');
    }
    _status = status;
    _error = exception?.toError();
    notifyListeners();
  }

  static bool isValidToken(String? token) {
    return token != null && token.length >= 24 && token.length <= 32;
  }

  String get token => _token;
  set token(String token) {
    if (_token == token) return;
    _token = token;
    _setStatus(UbuntuProStatus.ready);
    notifyListeners();
  }

  Future<void> init() async {
    return _client.connect().then((_) async {
      final version = await _client.daemonVersion;
      log.debug('Connected to daemon v$version');
      _setStatus(UbuntuProStatus.ready);
    });
  }

  Future<void> save() async {
    // TODO: save token on the target
  }

  @override
  void dispose() {
    _client.close();
    super.dispose();
  }

  Future<void> attach() async {
    if (_client.isAttached) await detach();
    _setStatus(UbuntuProStatus.attaching);
    try {
      await _client.attach(token).then((_) {
        _setStatus(UbuntuProStatus.attached);
      });
    } on UbuntuProException catch (e) {
      _setStatus(UbuntuProStatus.error, e);
    }
  }

  Future<void> detach() async {
    _setStatus(UbuntuProStatus.detaching);
    try {
      await _client.detach().then((_) {
        _setStatus(UbuntuProStatus.detached);
      });
    } on UbuntuProException catch (e) {
      _setStatus(UbuntuProStatus.error, e);
    }
  }
}

extension _UbuntuProErrorException on UbuntuProException {
  UbuntuProError? toError() {
    if (this is UbuntuProFailedException) {
      return UbuntuProError.failed;
    }
    if (this is UbuntuProAuthFailedException) {
      return UbuntuProError.authFailed;
    }
    return null;
  }
}
