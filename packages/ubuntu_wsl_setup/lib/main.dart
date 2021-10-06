import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';
import 'package:ubuntu_wizard/app.dart';

import 'app.dart';

void main(List<String> args) {
  final options = parseCommandLine(args, onPopulateOptions: (parser) {
    parser.addFlag('reconfigure');
  })!;
  var variant = Variant.WSL_SETUP;
  if (options['reconfigure'] == true) {
    variant = Variant.WSL_CONFIGURATION;
  }
  runWizardApp(
    UbuntuWslSetupApp(
      initialRoute: options['initial-route'],
      reconfigure: options['reconfigure'] == true,
    ),
    options: options,
    subiquityClient: SubiquityClient(),
    subiquityServer: SubiquityServer.wsl(),
    variant: variant,
  );
}
