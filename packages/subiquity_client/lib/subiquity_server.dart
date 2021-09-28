import 'dart:io';

import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;
import 'package:xdg_directories/xdg_directories.dart' as xdg;
import '../src/http_unix_client.dart';

enum ServerMode { LIVE, DRY_RUN }

/// @internal
final log = Logger('subiquity_server');

abstract class SubiquityServer {
  late Process _serverProcess;

  SubiquityServer._();

  /// Creates a new subiquity server.
  factory SubiquityServer() => _SubiquityServerImpl();

  /// Creates a WSL variant of the server.
  factory SubiquityServer.wsl() => _WslSubiquityServerImpl();

  /// A callback for integration testing purposes. The callback is called when
  /// the server has been started and thus, the application is ready for
  /// integration testing.
  @visibleForTesting
  static void Function(String socketPath)? startupCallback;

  // Whether the server process should be started in the specified mode.
  bool _shouldStart(ServerMode mode);

  // The name of the server's Python module.
  String get _pythonModule;

  // The path of the socket in live mode.
  String _getSocketPath(ServerMode mode) => mode == ServerMode.LIVE
      ? '/run/subiquity/socket'
      : p.join(Directory.current.path, 'test/socket');

  // Optional environment variables for the server process.
  Map<String, String> _getEnvironment(String subiquityPath) {
    // prefer local curtin and probert python modules that are pinned to the
    // correct versions
    final pythonPath = (Platform.environment['PYTHONPATH'] ?? '').split(':');
    pythonPath.add(subiquityPath);
    pythonPath.add(p.join(subiquityPath, 'curtin'));
    pythonPath.add(p.join(subiquityPath, 'probert'));
    return {'PYTHONPATH': pythonPath.join(':')};
  }

  Future<String> start(ServerMode serverMode, [List<String>? args]) async {
    final socketPath = _getSocketPath(serverMode);
    if (_shouldStart(serverMode)) {
      var subiquityCmd = <String>[
        '-m',
        _pythonModule,
        if (serverMode == ServerMode.DRY_RUN) '--dry-run',
        ...?args,
      ];
      await _startSubiquity(subiquityCmd);
    }

    return _waitSubiquity(socketPath).then((_) {
      startupCallback?.call(socketPath);
      return socketPath;
    });
  }

  Future<void> _startSubiquity(List<String> subiquityCmd) async {
    var subiquityPath = p.join(Directory.current.path, 'subiquity');
    String? workingDirectory;
    // try using local subiquity
    if (Directory(subiquityPath).existsSync()) {
      workingDirectory = subiquityPath;
    }

    // kill the existing test server if it's already running, so they don't pile
    // up on hot restarts
    final pid = await _readPidFile();
    if (pid != null) {
      Process.killPid(pid);
    }

    _serverProcess = await Process.start(
      'python3',
      subiquityCmd,
      workingDirectory: workingDirectory,
      environment: _getEnvironment(subiquityPath),
    ).then((process) {
      stdout.addStream(process.stdout);
      stderr.addStream(process.stderr);
      return process;
    });
    log.info('Starting server (PID: ${_serverProcess.pid})');

    await _writePidFile(_serverProcess.pid);
  }

  static Future<void> _waitSubiquity(String socketPath) async {
    final client = HttpUnixClient(socketPath);
    final request = Request('GET', Uri.http('localhost', 'meta/status'));

    // allow 10s maximum for the server to start responding
    for (var i = 0; i < 10; ++i) {
      try {
        await client.send(request);
        break;
      } on Exception catch (_) {
        await Future.delayed(Duration(seconds: 1));
      }
    }
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
      log.warning('Error writing ${file.path} (${e.message}). '
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

class _SubiquityServerImpl extends SubiquityServer {
  _SubiquityServerImpl() : super._();

  // Normally, the server is already running in live mode and thus, only
  // started in dry-run mode.
  @override
  bool _shouldStart(ServerMode mode) => mode == ServerMode.DRY_RUN;

  @override
  String get _pythonModule => 'subiquity.cmd.server';

  @override
  Map<String, String> _getEnvironment(String subiquityPath) {
    // so subiquity doesn't think it's the installer or flutter snap...
    return super._getEnvironment(subiquityPath)
      ..addAll({
        'SNAP': '.',
        'SNAP_NAME': 'subiquity',
        'SNAP_REVISION': '',
        'SNAP_VERSION': '',
      });
  }
}

// A server that runs in a WSL environment.
class _WslSubiquityServerImpl extends SubiquityServer {
  _WslSubiquityServerImpl() : super._();

  // The server should be always started in WSL because there's no systemd.
  @override
  bool _shouldStart(ServerMode mode) => true;

  @override
  String get _pythonModule => 'system_setup.cmd.server';
}
