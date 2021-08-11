import 'app.dart';
import 'installer.dart';

void main(List<String> args) {
  final options = parseCommandLine(args, showMachineConfig: true)!;
  runWizardApp(
    UbuntuDesktopInstallerApp(),
    serverMode:
        options['dry-run'] == true ? ServerMode.DRY_RUN : ServerMode.LIVE,
    serverArgs: [
      if (options['machine-config'] != null) ...[
        '--machine-config',
        options['machine-config'],
      ],
    ],
  );
}
