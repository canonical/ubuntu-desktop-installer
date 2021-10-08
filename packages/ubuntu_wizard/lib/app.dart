import 'dart:async';
import 'dart:io' as io;

import 'package:args/args.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:gsettings/gsettings.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart' as p;
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';

import 'l10n.dart';
import 'settings.dart';
import 'utils.dart';

/// @internal
final log = Logger(_appName);

/// Initializes and runs the given [app].
///
/// Optionally, the Subiquity client] and server may be overridden for building
/// wizard variants and for testing purposes.
Future<void> runWizardApp(
  Widget app, {
  ArgResults? options,
  required SubiquityClient subiquityClient,
  required Variant variant,
  required SubiquityServer subiquityServer,
  List<String>? serverArgs,
  List<SingleChildWidget>? providers,
}) async {
  final interfaceSettings = GSettings('org.gnome.desktop.interface');

  if (options != null) {
    Logger.setup(
      path: _resolveLogPath(options['log-file']),
      level: LogLevel.fromString(options['log-level']),
    );
  }

  final serverMode = options == null || options['dry-run'] == true
      ? ServerMode.DRY_RUN
      : ServerMode.LIVE;

  await subiquityServer
      .start(serverMode, serverArgs)
      .then(subiquityClient.open);

  subiquityClient.setVariant(variant);

  // Use the default values for a number of endpoints
  // for which a UI page isn't implemented yet.
  subiquityClient.markConfigured([
    'mirror',
    'proxy',
    'network',
    'ssh',
    'snaplist',
  ]);
  subiquityClient.setTimezone('geoip');

  WidgetsFlutterBinding.ensureInitialized();
  await setupAppLocalizations();

  onWindowClosed().then((_) async {
    await interfaceSettings.close();
    await subiquityClient.close();
    await subiquityServer.stop();
  });

  runZonedGuarded(() {
    FlutterError.onError = (error) {
      log.error('Unhandled exception', error.exception, error.stack);
    };

    return runApp(MultiProvider(
      providers: [
        Provider.value(value: subiquityClient),
        ChangeNotifierProvider(create: (_) => Settings(interfaceSettings)),
        ...?providers,
      ],
      child: app,
    ));
  }, (error, stack) => log.error('Unhandled exception', error, stack));
}

String get _appName => p.basename(io.Platform.resolvedExecutable);

String _resolveLogPath(String? logfile) {
  if (logfile != null) {
    return logfile;
  }
  if (kDebugMode) {
    return '${p.dirname(io.Platform.resolvedExecutable)}/.$_appName/$_appName.log';
  }
  return '/var/log/installer/$_appName.log';
}

String? get _defaultLogFile => io.Platform.environment['LOG_FILE'];

String? get _defaultLogLevel =>
    io.Platform.environment['LOG_LEVEL'] ?? (kDebugMode ? 'debug' : 'info');

/// Parses the given command line [args].
ArgResults? parseCommandLine(
  List<String> args, {
  ValueChanged<ArgParser>? onPopulateOptions,
  @visibleForTesting io.IOSink? out,
  @visibleForTesting void Function(int exitCode) exit = io.exit,
}) {
  final parser = ArgParser();
  parser.addFlag('help', abbr: 'h', negatable: false);
  parser.addFlag('dry-run',
      defaultsTo: io.Platform.environment['LIVE_RUN'] != '1',
      help: 'Run Subiquity server in dry-run mode');
  parser.addOption('initial-route', hide: true);
  parser.addOption(
    'log-file',
    valueHelp: 'path',
    defaultsTo: _defaultLogFile,
    help: '''
Path of the log file.
Can also be specified in a LOG_FILE environment variable.
(defaults to "/var/log/installer/$_appName.log")
''',
  );
  parser.addOption(
    'log-level',
    valueHelp: 'level',
    defaultsTo: _defaultLogLevel,
    help: '''
Available logging levels: "debug", "info", "warning", "error".
Can also be specified in a LOG_LEVEL environment variable.
''',
  );
  onPopulateOptions?.call(parser);

  ArgResults? options;
  try {
    options = parser.parse(args);
  } on FormatException catch (e) {
    _printUsage(parser.usage, error: e.message, out: out, exit: exit);
  }
  if (options?['help'] == true) {
    _printUsage(parser.usage, out: out, exit: exit);
  }
  if (options?.rest.isNotEmpty == true) {
    _printUsage(parser.usage,
        error: 'Unknown positional arguments "${options!.rest.join(' ')}"',
        out: out,
        exit: exit);
  }
  return options;
}

void _printUsage(
  String options, {
  String? error,
  io.IOSink? out,
  required void Function(int exitCode) exit,
}) {
  final hasError = error?.isNotEmpty == true;
  out ??= hasError ? io.stderr : io.stdout;
  if (hasError) {
    out.write('Error: $error\n\n');
  }
  out.write('Usage: $_appName [options]\n\n');
  out.write('Options:\n$options\n');
  exit(hasError ? 1 : 0);
}
