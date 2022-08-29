import 'dart:convert';
import 'dart:io';

import 'endpoint.dart';
import 'server/common.dart';
import 'server/process.dart';
import 'server/paths.dart';
import 'types.dart';

const _kWaitTimes = 30;
const _kWaitDuration = Duration(seconds: 1);

Future<Endpoint> defaultEndpoint(ServerMode serverMode) async {
  final socketPath = await getSocketPath(serverMode);
  return Endpoint.unix(socketPath);
}

class SubiquityServer {
  /// An optional server launcher, should we need to start the server.
  SubiquityProcess? process;
  final Endpoint endpoint;

  SubiquityServer({this.process, required this.endpoint});

  Future<Endpoint> start({
    List<String>? args,
    Map<String, String>? environment,
  }) async {
    if (process != null) {
      await process!.start(additionalArgs: args, additionalEnv: environment);
    }

    return _waitSubiquity(endpoint).then((_) => endpoint);
  }

  static Future<void> _waitSubiquity(Endpoint endpoint) async {
    final client = HttpClient();
    client.connectionFactory = (uri, proxyHost, proxyPort) async {
      return Socket.startConnect(endpoint.address, endpoint.port);
    };

    // allow some time for the server to start responding
    log.info(
        'Waiting server up to ${(_kWaitDuration * _kWaitTimes).inSeconds} seconds');
    for (var i = 0; i < _kWaitTimes; ++i) {
      try {
        final request = await client.openUrl(
          'GET',
          Uri.http(endpoint.authority, 'meta/status'),
        );
        final response = await request.close();
        final json = jsonDecode(await response.transform(utf8.decoder).join());
        final status = ApplicationStatus.fromJson(json);
        log.info(status.state);
        if (status.state == ApplicationState.STARTING_UP ||
            status.state == ApplicationState.CLOUD_INIT_WAIT ||
            status.state == ApplicationState.EARLY_COMMANDS) {
          await Future.delayed(_kWaitDuration);
          continue;
        }
        break;
      } on Exception catch (e) {
        if (i < _kWaitTimes - 1) {
          log.error(e);
          await Future.delayed(_kWaitDuration);
        } else {
          rethrow;
        }
      }
    }
    client.close();
  }

  Future<void> stop() async => process?.stop();
}
