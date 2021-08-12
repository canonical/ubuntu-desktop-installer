import 'dart:io' as io;

import 'package:args/args.dart';
import 'package:flutter/widgets.dart';
import 'package:gsettings/gsettings.dart';
import 'package:path/path.dart' as p;
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';

import 'l10n.dart';
import 'services.dart';
import 'settings.dart';
import 'utils.dart';

export 'package:subiquity_client/subiquity_server.dart' show ServerMode;

/// Initializes and runs the given [app].
///
/// Optionally, the Subiquity client] and server may be overridden for building
/// wizard variants and for testing purposes.
Future<void> runWizardApp(
  Widget app, {
  SubiquityClient? subiquityClient,
  SubiquityServer? subiquityServer,
  required ServerMode serverMode,
  List<String>? serverArgs,
}) async {
  subiquityClient ??= SubiquityClient();
  subiquityServer ??= SubiquityServer();

  final interfaceSettings = GSettings(schemaId: 'org.gnome.desktop.interface');

  await subiquityServer
      .start(serverMode, serverArgs)
      .then(subiquityClient.open);

  // Use the default values for a number of endpoints
  // for which a UI page isn't implemented yet.
  subiquityClient.markConfigured([
    'mirror',
    'proxy',
    'network',
    'ssh',
    'snaplist',
    'timezone',
  ]);

  WidgetsFlutterBinding.ensureInitialized();
  await setupAppLocalizations();

  onWindowClosed().then((_) async {
    await subiquityClient!.close();
    await subiquityServer!.stop();
  });

  runApp(MultiProvider(
    providers: [
      Provider.value(value: subiquityClient),
      ChangeNotifierProvider(create: (_) => Settings(interfaceSettings)),
      Provider(create: (_) => DiskStorageService(subiquityClient!)),
      Provider(create: (_) => KeyboardService()),
    ],
    child: app,
  ));
}

/// Parses the given command line [args].
ArgResults? parseCommandLine(
  List<String> args, {
  bool? showMachineConfig,
  bool? showReconfigure,
  @visibleForTesting io.IOSink? out,
  @visibleForTesting void Function(int exitCode) exit = io.exit,
}) {
  final parser = ArgParser();
  parser.addFlag('help', abbr: 'h', negatable: false);
  parser.addFlag('dry-run',
      defaultsTo: io.Platform.environment['LIVE_RUN'] != '1',
      help: 'Run Subiquity server in dry-run mode');
  if (showMachineConfig == true) {
    parser.addOption('machine-config',
        valueHelp: 'path',
        defaultsTo: 'examples/simple.json',
        help: 'Path of the machine config (dry-run only)');
  }
  if (showReconfigure == true) {
    parser.addFlag('reconfigure',
        help: 'Run the wizard in reconfiguration mode');
  }

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
  final executable = p.basename(io.Platform.resolvedExecutable);
  if (hasError) {
    out.write('Error: $error\n\n');
  }
  out.write('Usage: $executable [options]\n\n');
  out.write('Options:\n$options\n');
  exit(hasError ? 1 : 0);
}
