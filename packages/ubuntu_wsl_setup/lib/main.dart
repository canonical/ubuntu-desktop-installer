import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';
import 'package:ubuntu_wizard/app.dart';

import 'app.dart';

void main(List<String> args) {
  final options = parseCommandLine(args, onPopulateOptions: (parser) {
    parser.addFlag('reconfigure');
  })!;
  runWizardApp(
    UbuntuWslSetupApp(reconfigure: options['reconfigure'] == true),
    subiquityClient: SubiquityClient(),
    subiquityServer: SubiquityServer(),
    serverMode:
        options['dry-run'] == true ? ServerMode.DRY_RUN : ServerMode.LIVE,
    serverArgs: [
      if (options['reconfigure'] == true) '--reconfigure',
      '--machine-config',
      'examples/simple.json',
    ],
  );
}
