import 'dart:io';

import 'package:http/http.dart';
import 'package:path/path.dart' as p;
import 'package:xdg_directories/xdg_directories.dart' as xdg;
import '../src/http_unix_client.dart';

enum ServerMode { LIVE, DRY_RUN }

class SubiquityServer {
  late Process _serverProcess;

  Future<String> start(ServerMode serverMode, List<String>? args) async {
    if (serverMode == ServerMode.LIVE) {
      return '/run/subiquity/socket';
    }

    var subiquityCmd = <String>[
      '-m',
      'subiquity.cmd.server',
      if (serverMode == ServerMode.DRY_RUN) '--dry-run',
      ...?args,
    ];

    var subiquityPath = p.join(Directory.current.path, 'subiquity');
    var socketPath = p.join(Directory.current.path, 'test/socket');

    // prefer local curtin and probert python modules that are pinned to the
    // correct versions
    final pythonPath = (Platform.environment['PYTHONPATH'] ?? '').split(':');
    pythonPath.add(subiquityPath);
    pythonPath.add(p.join(subiquityPath, 'curtin'));
    pythonPath.add(p.join(subiquityPath, 'probert'));

    // kill the existing test server if it's already running, so they don't pile
    // up on hot restarts
    final pid = await _readPidFile();
    if (pid != null) {
      Process.killPid(pid);
    }

    _serverProcess = await Process.start('/usr/bin/python3', subiquityCmd,
        workingDirectory: subiquityPath,
        // so subiquity doesn't think it's the installer or flutter snap...
        environment: {
          'PYTHONPATH': pythonPath.join(':'),
          'SNAP': '.',
          'SNAP_NAME': 'subiquity',
          'SNAP_REVISION': '',
          'SNAP_VERSION': ''
        }).then((process) {
      stdout.addStream(process.stdout);
      stderr.addStream(process.stderr);
      return process;
    });

    await _writePidFile(_serverProcess.pid);

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

  static File _pidFile() {
    return File('${xdg.runtimeDir?.path}/subiquity-test-server.pid');
  }

  static Future<int?> _readPidFile() async {
    final file = _pidFile();
    if (!await file.exists()) {
      return null;
    }
    final content = await file.readAsString();
    return int.tryParse(content.trim());
  }

  static Future<void> _writePidFile(int pid) async {
    final file = _pidFile();
    try {
      await file.create(recursive: true);
      await file.writeAsString(pid.toString());
    } on FileSystemException catch (e) {
      print('WARNING: Error writing ${file.path} (${e.message}). '
          'Hot restarts may cause multiple Subiquity test servers to run.');
    }
  }

  Future<void> stop() async {
    try {
      await _pidFile().delete();
    } on FileSystemException catch (_) {}
    _serverProcess.kill();
    await _serverProcess.exitCode;
  }
}
