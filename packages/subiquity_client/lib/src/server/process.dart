import 'dart:io';
import 'package:path/path.dart' as p;

import 'common.dart';
import 'pidfile.dart';

// Prefer local curtin and probert python modules that are pinned to the
// correct versions
Map<String, String> _pythonPath(String subiquityPath) {
  final pythonPath = (Platform.environment['PYTHONPATH'] ?? '').split(':');
  pythonPath.add(subiquityPath);
  pythonPath.add(p.join(subiquityPath, 'curtin'));
  pythonPath.add(p.join(subiquityPath, 'probert'));
  return {'PYTHONPATH': pythonPath.join(':')};
}

/// Manages the Subiquity process.
/// This class knows the many ways with which we may want to start Subiquity.
/// Starting the server builds on top of [Process.start], so this launcher
/// can be customized by implementing factory constructors that adjust the
/// [command] and [args].
/// The example below would allow starting subiquity inside a WSL2 distro
/// while the GUI client is running on the Windows host.
///
/// ```dart
/// /// Able to start the server inside [distroName] on WSL from the Windows host.
/// factory SubiquityProcess.wsl(String distroName, String command,
///     {List<String>? args,
///     Future<void>? defer,
///     Future<void> Function()? onProcessStart,
///     }) {
///   return SubiquityProcess._(
///     'wsl',
///     args: ['-d', distroName, command, ...?args],
///     deferStart: defer,
///     onProcessStart: onProcessStart,
///   );
/// }
/// ```
///
/// The following would allow starting subiquity inside an LXD container while
/// the GUI is running on the Linux host, which could be good for testing.
///
///```dart
/// /// Able to start the server inside [container] on LXD from the Linux host.
/// factory SubiquityProcess.lxd(String container, String command,
///     {List<String>? args, bool runAsDaemon = false, String? configFile}) {
///   final lxcArgs = <String>[
///     '-n',
///     container,
///     runAsDaemon ? '-d' : '',
///     if (configFile != null) ...['-f', configFile],
///     '--',
///     command,
///     ...?args
///  ];
///  return SubiquityProcess('lxc-execute', lxcArgs);
///}
///```
///
class SubiquityProcess {
  /// The program the process will run.
  final String command;

  /// The program arguments.
  final List<String> args;

  /// The process working directory
  final String? workingDirectory;

  /// The process environment variables.
  final Map<String, String>? environment;

  /// An optional future that must be awaited on before starting the server.
  /// It may be used to prevent starting the server before a certain condition
  /// is met or a certain event happens.
  final Future<void>? deferStart;

  /// An action one may want to take after calling [Process.start].
  final Future<void> Function()? onProcessStart;

  /// The process created by the [start] method.
  Process? _serverProcess;

  SubiquityProcess(
    this.command,
    this.args, {
    this.workingDirectory,
    this.environment,
    this.deferStart,
    this.onProcessStart,
  });

  /// Able to start subiquity by running the raw [command] with [args] without
  /// further customisation or logic, intended for the simpler cases.
  factory SubiquityProcess.command(String command, List<String> args) {
    return SubiquityProcess(command, args);
  }

  /// Able to start the server module [pythonModule] using Python defined either
  /// by [pythonExecutable] or via the SNAP_PYTHON environment variable.
  /// Defaults to system's default (usually located at /usr/bin/python3).
  factory SubiquityProcess.python(
    String pythonModule, {
    String? pythonExecutable,
    String? subiquityPath,
    ServerMode? serverMode,
  }) {
    final cmd = pythonExecutable ??
        Platform.environment['SNAP_PYTHON'] ??
        '/usr/bin/python3';

    final arguments = ['-m', pythonModule];
    final env = <String, String>{};

    if (serverMode == ServerMode.DRY_RUN) {
      arguments.add('--dry-run');
      env.addAll({
        // so subiquity doesn't think it's some other snap (e.g. flutter or vs code)
        'SNAP': '.',
        'SNAP_NAME': 'subiquity',
        'SNAP_REVISION': '',
        'SNAP_VERSION': '',
      });
    }
    if (subiquityPath != null) env.addAll(_pythonPath(subiquityPath));
    return SubiquityProcess(
      cmd,
      arguments,
      // will try using local subiquity
      workingDirectory: subiquityPath,
      environment: env,
    );
  }

  /// Able to start the server inside [distroName] on WSL from the Windows host
  /// by running [command] with [args] as [user].
  ///
  /// The environment variables map [env] in set on the host side, thus
  /// affecting the environment of the wsl.exe program. To share host
  /// environment variables with the distro by listing their names to [wslenv]
  /// (with their applicable flags), whether they are part of [env] or not.
  /// The list will be appended to $env:WSLENV.
  ///
  /// To know more about sharing env vars to WSL see:
  /// https://devblogs.microsoft.com/commandline/share-environment-vars-between-wsl-and-windows/
  factory SubiquityProcess.wsl(
    String distroName,
    String command, {
    List<String>? args,
    String? user,
    Map<String, String>? env,
    String? wslenv,
    ServerMode? serverMode,
    Future<void>? defer,
    Future<void> Function()? onProcessStart,
  }) {
    final environment = {
      ...?env,
      // WSL interoperability has its environment variable sharing mechanism.
      if (wslenv != null) ...{
        'WSLENV': '${Platform.environment['WSLENV']}:$wslenv',
      }
    };

    final arguments = [
      '-d',
      distroName,
      if (user != null) ...['-u', user],
      command,
      ...?args,
      if (serverMode == ServerMode.DRY_RUN) ...['--dry-run'],
    ];

    return SubiquityProcess(
      'wsl',
      arguments,
      environment: environment,
      deferStart: defer,
      onProcessStart: onProcessStart,
    );
  }

  /// Starts the server.
  Future<void> start({
    List<String>? additionalArgs,
    Map<String, String>? additionalEnv,
  }) async {
    // kill the existing test server if it's already running, so they don't pile
    // up on hot restarts
    final pid = await readPidFile();
    if (pid != null) {
      Process.killPid(pid);
    }

    if (deferStart != null) {
      await deferStart;
    }

    final allArgs = [...args, ...?additionalArgs];
    _serverProcess = await Process.start(
      command,
      allArgs,
      workingDirectory: workingDirectory,
      environment: {...?environment, ...?additionalEnv},
    ).then((process) {
      stdout.addStream(process.stdout);
      stderr.addStream(process.stderr);
      return process;
    });
    log.info(
        'Starting server (PID: ${_serverProcess!.pid}) with args: $allArgs');

    await onProcessStart?.call();
    await writePidFile(_serverProcess!.pid);
  }

  Future<void> stop() async {
    try {
      await pidFile().delete();
    } on FileSystemException catch (_) {}
    _serverProcess?.kill();
    await _serverProcess?.exitCode;
  }

  Future<int>? get exitCode => _serverProcess?.exitCode;
}
