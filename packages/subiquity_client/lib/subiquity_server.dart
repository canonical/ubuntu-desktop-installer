import 'dart:io';

import 'package:http/http.dart';
import 'package:path/path.dart' as p;
import '../src/http_unix_client.dart';

enum ServerMode { LIVE, DRY_RUN }

class SubiquityServer {
  late Process _serverProcess;

  Future<String> start(ServerMode serverMode,
      [String machineConfig = ""]) async {
    var subiquityPath;
    var subiquityCmd;
    var socketPath;

    if (Platform.environment['SNAP_NAME'] == 'ubuntu-desktop-installer') {
      subiquityPath = p.join(Platform.environment['SNAP']!, 'bin', 'subiquity');
    } else {
      subiquityPath = p.join(Directory.current.path, 'subiquity');
    }

    if (serverMode == ServerMode.DRY_RUN) {
      socketPath = p.join(Directory.current.path, 'test/socket');
      subiquityCmd = [
        '-m',
        'subiquity.cmd.server',
        '--dry-run',
        '--machine-config',
        machineConfig
      ];
    } else {
      socketPath = '/run/subiquity/socket';
      subiquityCmd = ['-m', 'subiquity.cmd.server'];
    }

    _serverProcess = await Process.start('/usr/bin/python3', subiquityCmd,
        workingDirectory: subiquityPath,
        // so subiquity doesn't think it's the installer or flutter snap...
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

  Future<void> stop() async {
    _serverProcess.kill();
    await _serverProcess.exitCode;
  }
}
