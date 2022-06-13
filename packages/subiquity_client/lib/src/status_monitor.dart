import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:meta/meta.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';

import 'endpoint.dart';
import 'types.dart';

/// @internal
final log = Logger('subiquity_status');

/// Background status monitor for subiquity.
class SubiquityStatusMonitor {
  SubiquityStatusMonitor([@visibleForTesting HttpClient? client])
      : _client = client ?? HttpClient();

  final HttpClient _client;
  ApplicationStatus? _status;
  StreamController<ApplicationStatus?>? _statusController;
  late final String _host;

  /// Starts monitoring the status using the provided [socketPath].
  Future<bool> start(Endpoint endpoint) async {
    _client.connectionFactory = (uri, proxyHost, proxyPort) async {
      return Socket.startConnect(endpoint.address, endpoint.port);
    };
    _host = endpoint.authority;
    return _fetchStatus().then(_updateStatus).then((_) {
      _listen();
      return _status != null;
    });
  }

  /// Stops monitoring the status.
  Future<void> stop() {
    _status = null;
    _client.close();
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
    final request = await _openUrl(_status?.state);
    final response = await _receive(request);
    if (response != null) {
      final json = jsonDecode(response) as Map<String, dynamic>;
      return ApplicationStatus.fromJson(json);
    }
    return null;
  }

  Future<HttpClientRequest> _openUrl(ApplicationState? state) {
    return _client.openUrl(
      'GET',
      Uri.http(_host, 'meta/status', {
        if (state != null) 'cur': '"${state.name}"',
      }),
    );
  }

  Future<String?> _receive(HttpClientRequest request) async {
    try {
      final response = await request.close();
      final data = await response.transform(utf8.decoder).join();
      if (response.statusCode != 200) {
        return null;
      }
      return data;
    } on HttpException catch (_) {
      return null;
    }
  }

  void _updateStatus(ApplicationStatus? status) {
    if (_status == status) return;
    log.info('${_status?.state.name} => $status');
    _status = status;
    if (_statusController?.isClosed == false) {
      _statusController!.add(status);
    }
  }
}
