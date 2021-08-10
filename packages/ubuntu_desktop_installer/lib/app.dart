import 'dart:io';

import 'package:args/args.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:gsettings/gsettings.dart';
import 'package:path/path.dart' as p;
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';
import 'disk_storage_service.dart';
import 'keyboard_service.dart';

import 'l10n/app_localizations.dart';
import 'settings.dart';

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

  final eventChannel = EventChannel('ubuntu-desktop-installer');
  eventChannel.receiveBroadcastStream().listen((event) async {
    switch (event) {
      case 'deleteEvent':
        await subiquityClient!.close();
        await subiquityServer!.stop();
        break;
      default:
        print('Warning: event $event ignored');
    }
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
ArgResults parseCommandLine(List<String> args, {bool? showMachineConfig}) {
  final parser = ArgParser();
  parser.addFlag('help', abbr: 'h', negatable: false);
  parser.addFlag('dry-run',
      defaultsTo: Platform.environment['LIVE_RUN'] != '1',
      help: 'Run Subiquity server in dry-run mode');
  if (showMachineConfig == true) {
    parser.addOption('machine-config',
        valueHelp: 'path',
        defaultsTo: 'examples/simple.json',
        help: 'Path of the machine config (dry-run only)');
  }

  late ArgResults options;
  try {
    options = parser.parse(args);
  } on FormatException catch (e) {
    _printUsage(parser.usage, error: e.message);
  } finally {
    if (options['help'] == true) {
      _printUsage(parser.usage);
    }
    if (options.rest.isNotEmpty) {
      _printUsage(parser.usage,
          error: 'Unknown positional arguments "${options.rest.join(' ')}"');
    }
  }
  return options;
}

void _printUsage(String options, {String? error}) {
  final hasError = error?.isNotEmpty == true;
  final out = hasError ? stderr : stdout;
  final executable = p.basename(Platform.resolvedExecutable);
  if (hasError) {
    out.write('Error: $error\n\n');
  }
  out.write('Usage: $executable [options]\n\n');
  out.write('Options:\n$options\n');
  exit(hasError ? 1 : 0);
}
