import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';
import 'package:ubuntu_wizard/app.dart';

import 'installer.dart';
import 'services.dart';

const _kSystemdUnit = 'snap.ubuntu-desktop-installer.subiquity-server.service';

void main(List<String> args) {
  final options = parseCommandLine(args, onPopulateOptions: (parser) {
    parser.addOption('machine-config',
        valueHelp: 'path',
        defaultsTo: 'examples/simple.json',
        help: 'Path of the machine config (dry-run only)');
  })!;

  final subiquityClient = SubiquityClient();
  final subiquityServer = SubiquityServer();

  final journalUnit = isLiveRun(options) ? _kSystemdUnit : null;

  runWizardApp(
    UbuntuDesktopInstallerApp(initialRoute: options['initial-route']),
    options: options,
    subiquityClient: subiquityClient,
    subiquityServer: subiquityServer,
    serverArgs: [
      if (options['machine-config'] != null) ...[
        '--machine-config',
        options['machine-config'],
      ],
    ],
    serverEnvironment: {
      // so subiquity doesn't think it's the installer or flutter snap...
      'SNAP': '.',
      'SNAP_NAME': 'subiquity',
      'SNAP_REVISION': '',
      'SNAP_VERSION': '',
    },
    providers: [
      Provider(create: (_) => DiskStorageService(subiquityClient)),
      Provider(create: (_) => HostnameService()),
      Provider(create: (_) => JournalService(journalUnit)),
      Provider(create: (_) => KeyboardService()),
      Provider(create: (_) => UdevService()),
    ],
    onInitSubiquity: (client) {
      client.setVariant(Variant.DESKTOP);
      client.setTimezone('geoip');
    },
  );
}
