import 'dart:io';

import 'package:meta/meta.dart';

import 'endpoint.dart';
import 'server/common.dart';
import 'server/process.dart';
import 'server/paths.dart';

Future<Endpoint> defaultEndpoint(ServerMode serverMode) async {
  final socketPath = await getSocketPath(serverMode);
  return Endpoint.unix(socketPath);
}

class SubiquityServer {
  /// An optional server launcher, should we need to start the server.
  SubiquityProcess? process;
  final Endpoint endpoint;

  SubiquityServer({this.process, required this.endpoint});

  /// A callback for integration testing purposes. The callback is called when
  /// the server has been started and thus, the application is ready for
  /// integration testing.
  @visibleForTesting
  static void Function(Endpoint)? startupCallback;

  Future<Endpoint> start({
    List<String>? args,
    Map<String, String>? environment,
  }) async {
    if (process != null) {
      await process!.start(additionalArgs: args, additionalEnv: environment);
    }

    return _waitSubiquity(endpoint).then((_) {
      startupCallback?.call(endpoint);
      return endpoint;
    });
  }

  static Future<void> _waitSubiquity(Endpoint endpoint) async {
    final client = HttpClient();
    client.connectionFactory = (uri, proxyHost, proxyPort) async {
      return Socket.startConnect(endpoint.address, endpoint.port);
    };

    // allow 10s maximum for the server to start responding
    for (var i = 0; i < 10; ++i) {
      try {
        final request = await client.openUrl(
          'GET',
          Uri.http(endpoint.authority, 'meta/status'),
        );
        await request.close();
        break;
      } on Exception catch (_) {
        await Future.delayed(const Duration(seconds: 1));
      }
    }
    client.close();
  }

  Future<void> stop() async => await process?.stop();
}
