import 'dart:io';

import 'package:http/http.dart';
import 'package:path/path.dart' as p;
import '../src/http_unix_client.dart';

class TestServer {
  Process _serverProcess;

  Future<String> start(String config) async {
    final subiquityPath = p.join(Directory.current.path, 'subiquity');
    final socketPath = p.join(Directory.current.path, 'test/socket');

    _serverProcess = await Process.start('/usr/bin/python3',
        ['-m', 'subiquity.cmd.server', '--dry-run', '--machine-config', config],
        workingDirectory: subiquityPath,
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

    final client = HttpUnixClient(socketPath);
    final request = Request('GET', Uri.http('localhost', 'meta/status'));

    // allow 10s maximum for the server to start responding
    for (var i = 0; i < 10; ++i) {
      try {
        await client.send(request);
        break;
      } on Exception catch (_) {
        sleep(Duration(seconds: 1));
      }
    }

    return socketPath;
  }

  void stop() {
    _serverProcess.kill();
  }
}
