import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';

import 'http_unix_client.dart';
import 'types.dart';

/// @internal
final log = Logger('subiquity_status');

/// Background status monitor for subiquity.
class SubiquityStatusMonitor {
  SubiquityStatusMonitor([@visibleForTesting this._client]);

  HttpUnixClient? _client;
  ApplicationStatus? _status;
  StreamController<ApplicationStatus?>? _statusController;

  /// Starts monitoring the status using the provided [socketPath].
  Future<bool> start(String socketPath) async {
    _client ??= HttpUnixClient(socketPath);
    return _fetchStatus().then(_updateStatus).then((_) {
      _listen();
      return _status != null;
    });
  }

  /// Stops monitoring the status.
  Future<void> stop() {
    _status = null;
    _client = null;
    return _cancel();
  }

  /// Returns the current status or `null` if the status is not available.
  ApplicationStatus? get status => _status;

  /// Emits the status whenever it changes.
  Stream<ApplicationStatus?> get onStatusChanged {
    _statusController ??= StreamController<ApplicationStatus?>.broadcast(
      onListen: _listen,
      onCancel: _cancel,
    );
    return _statusController!.stream;
  }

  Future<void> _listen() async {
    while (_status != null && _statusController?.isClosed == false) {
      await _fetchStatus().then(_updateStatus);
    }
  }

  Future<void> _cancel() async => _statusController?.close();

  Future<ApplicationStatus?> _fetchStatus() async {
    final request = _createRequest(_status?.state);
    final response = await _sendRequest(request);
    if (response != null) {
      final json = jsonDecode(response) as Map<String, dynamic>;
      return ApplicationStatus.fromJson(json);
    }
    return null;
  }

  static Request _createRequest(ApplicationState? state) {
    return Request(
      'GET',
      Uri.http('localhost', 'meta/status', {
        if (state != null) 'cur': '"${state.name}"',
      }),
    );
  }

  Future<String?> _sendRequest(Request request) async {
    final response = await _client?.send(request);
    final data = await response?.stream.bytesToString();
    if (response?.statusCode != 200) {
      return null;
    }
    return data;
  }

  void _updateStatus(ApplicationStatus? status) {
    if (_status == status) return;
    log.info('${_status?.state?.name} => $status');
    _status = status;
    if (_statusController?.isClosed == false) {
      _statusController!.add(status);
    }
  }
}
