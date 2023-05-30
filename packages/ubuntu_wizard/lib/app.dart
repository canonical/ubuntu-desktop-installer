import 'dart:async';
import 'dart:io' as io;

import 'package:args/args.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart' as p;
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';
import 'package:ubuntu_localizations/ubuntu_localizations.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

/// @internal
final log = Logger(_appName);

bool isLiveRun(ArgResults? options) {
  return options != null && options['dry-run'] != true;
}

/// Initializes and runs the given [app].
///
/// Optionally, the Subiquity client and server may be overridden for building
/// wizard variants and for testing purposes.
///
/// Returns a future that completes when the Subiquity server is ready to
/// receive requests.
Future<bool?> runWizardApp(
  Widget app, {
  ArgResults? options,
  required SubiquityClient subiquityClient,
  required SubiquityServer subiquityServer,
  SubiquityStatusMonitor? subiquityMonitor,
  List<String>? serverArgs,
  Map<String, String>? serverEnvironment,
  FutureOr<void> Function()? dispose,
}) async {
  final subiquityReady = subiquityServer
      .start(args: serverArgs, environment: serverEnvironment)
      .then((endpoint) async {
    subiquityClient.open(endpoint);
    return subiquityMonitor?.start(endpoint);
  });

  WidgetsFlutterBinding.ensureInitialized();
  await setupAppLocalizations();

  final window = await YaruWindow.ensureInitialized();
  await window.onClose(() async {
    await subiquityMonitor?.stop();
    await subiquityClient.close();
    await subiquityServer.stop();
    await dispose?.call();
    return true;
  });

  return runZonedGuarded<Future<bool?>>(() {
    FlutterError.onError = (error) {
      log.error('Unhandled exception', error.exception, error.stack);
    };

    runApp(app);

    return subiquityReady;
  }, (error, stack) => log.error('Unhandled exception', error, stack));
}

String get _appName => p.basename(io.Platform.resolvedExecutable);

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
