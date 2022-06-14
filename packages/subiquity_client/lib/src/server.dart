import 'dart:io';

import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;
import 'package:xdg_directories/xdg_directories.dart' as xdg;

import 'endpoint.dart';
import 'server/common.dart';
import 'server/paths.dart';

abstract class SubiquityServer {
  Process? _serverProcess;

  SubiquityServer._();

  /// Creates a new subiquity server.
  factory SubiquityServer() => _SubiquityServerImpl();

  /// Creates a WSL variant of the server.
  factory SubiquityServer.wsl() => _WslSubiquityServerImpl();

  /// A callback for integration testing purposes. The callback is called when
  /// the server has been started and thus, the application is ready for
  /// integration testing.
  @visibleForTesting
  static void Function(Endpoint)? startupCallback;

  // Whether the server process should be started in the specified mode.
  bool _shouldStart(ServerMode mode);

  // The name of the server's Python module.
  String get _pythonModule;

  // Prefer local curtin and probert python modules that are pinned to the
  // correct versions
  Map<String, String> _pythonPath(String subiquityPath) {
    final pythonPath = (Platform.environment['PYTHONPATH'] ?? '').split(':');
    pythonPath.add(subiquityPath);
    pythonPath.add(p.join(subiquityPath, 'curtin'));
    pythonPath.add(p.join(subiquityPath, 'probert'));
    return {'PYTHONPATH': pythonPath.join(':')};
  }

  Future<Endpoint> start(ServerMode serverMode,
      {List<String>? args, Map<String, String>? environment}) async {
    final socketPath = await getSocketPath(serverMode);
    final endpoint = Endpoint.unix(socketPath);
    if (_shouldStart(serverMode)) {
      var subiquityCmd = <String>[
        '-m',
        _pythonModule,
        if (serverMode == ServerMode.DRY_RUN) '--dry-run',
        ...?args,
      ];
      await _startSubiquity(serverMode, subiquityCmd, environment);
    }

    return _waitSubiquity(endpoint).then((_) {
      startupCallback?.call(endpoint);
      return endpoint;
    });
  }

  Future<void> _startSubiquity(ServerMode serverMode, List<String> subiquityCmd,
      Map<String, String>? environment) async {
    final subiquityPath = await getSubiquityPath();
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

    // Use `/usr/bin/python3` over `/snap/flutter/current/usr/bin/python3` when
    // developing with flutter-snap on the desktop. This ensures that subiquity
    // has locally installed Python module dependencies available. (#364)
    _serverProcess = await Process.start(
      Platform.environment['SNAP_PYTHON'] ?? '/usr/bin/python3',
      subiquityCmd,
      workingDirectory: workingDirectory,
      environment: {
        ..._pythonPath(subiquityPath),
        if (serverMode == ServerMode.DRY_RUN) ...{
          // so subiquity doesn't think it's some other snap (e.g. flutter or vs code)
          'SNAP': '.',
          'SNAP_NAME': 'subiquity',
          'SNAP_REVISION': '',
          'SNAP_VERSION': '',
        },
        ...?environment,
      },
    ).then((process) {
      stdout.addStream(process.stdout);
      stderr.addStream(process.stderr);
      return process;
    });
    log.info(
      'Starting server (PID: ${_serverProcess!.pid}) with args: $subiquityCmd',
    );

    await _writePidFile(_serverProcess!.pid);
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
    _serverProcess?.kill();
    await _serverProcess?.exitCode;
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
