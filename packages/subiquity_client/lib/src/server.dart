import 'dart:io';

import 'package:meta/meta.dart';

import 'endpoint.dart';
import 'server/common.dart';
import 'server/process.dart';
import 'server/paths.dart';

class SubiquityServer {
  /// An optional server launcher, should we need to start the server.
  SubiquityProcess? launcher;

  SubiquityServer({this.launcher});

  /// A callback for integration testing purposes. The callback is called when
  /// the server has been started and thus, the application is ready for
  /// integration testing.
  @visibleForTesting
  static void Function(Endpoint)? startupCallback;

  Future<Endpoint> start(ServerMode serverMode,
      {List<String>? args, Map<String, String>? environment}) async {
    final socketPath = await getSocketPath(serverMode);
    final endpoint = Endpoint.unix(socketPath);
    if (launcher != null) {
      await launcher!.start(additionalArgs: args, additionalEnv: environment);
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

  Future<void> stop() async => await launcher?.stop();
}
