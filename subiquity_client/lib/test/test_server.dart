import 'dart:io';

import 'package:http/http.dart';
import 'package:subiquity_client/src/http_unix_client.dart';

class TestServer {
  Process _server_process;

  Future<String> start(String config) async {
    var currentPath = Directory.current.path.substring(
            0,
            Directory.current.path.lastIndexOf('ubuntu-desktop-installer') +
                24) +
        '/subiquity_client';

    final subiquity_path = currentPath + '/subiquity';
    final socket_path = currentPath + '/test/socket';

    _server_process = await Process.start('/usr/bin/python3',
        ['-m', 'subiquity.cmd.server', '--dry-run', '--machine-config', config],
        workingDirectory: subiquity_path,
        // so subiquity doesn't think it's the flutter snap...
        environment: {
          'SNAP': '.',
          'SNAP_NAME': 'subiquity',
          'SNAP_REVISION': '',
          'SNAP_VERSION': ''
        }).then((process) {
      stdout.addStream(process.stdout);
      stderr.addStream(process.stderr);
      return process;
    });

    var client = HttpUnixClient(socket_path);
    var request = Request('GET', Uri.http('localhost', 'meta/status'));

    // allow 10s maximum for the server to start responding
    for (var i = 0; i < 10; ++i) {
      try {
        await client.send(request);
        break;
      } catch (e) {
        sleep(Duration(seconds: 1));
      }
    }

    return socket_path;
  }

  void stop() {
    _server_process.kill();
  }
}
