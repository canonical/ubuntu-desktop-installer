import 'app.dart';
import 'wsl_oobe.dart';

void main(List<String> args) {
  final options = parseCommandLine(args, showReconfigure: true)!;
  runWizardApp(
    UbuntuWslOobeWizardApp(reconfigure: options['reconfigure'] == true),
    serverMode:
        options['dry-run'] == true ? ServerMode.DRY_RUN : ServerMode.LIVE,
    serverArgs: [
      if (options['reconfigure'] == true) '--reconfigure',
    ],
  );
}
