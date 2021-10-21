import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';
import 'package:ubuntu_wizard/app.dart';

import 'app.dart';

void main(List<String> args) {
  final options = parseCommandLine(args, onPopulateOptions: (parser) {
    parser.addFlag('reconfigure');
    parser.addOption(
      'prefill',
      valueHelp: 'prefill',
      help: '''
Path of the YAML file containing prefill information, which
feeds the installer with partial information to prefill the
screens, yet allowing user to overwrite any of those during setup.
  ''',
    );
  })!;
  var variant = Variant.WSL_SETUP;
  List<String>? serverArgs;
  if (options['reconfigure'] == true) {
    variant = Variant.WSL_CONFIGURATION;
  }
  if (options['prefill'] != null) {
    serverArgs = ['--prefill', options['prefill']];
  }
  runWizardApp(
    UbuntuWslSetupApp(
      initialRoute: options['initial-route'],
      reconfigure: options['reconfigure'] == true,
    ),
    options: options,
    subiquityClient: SubiquityClient(),
    subiquityServer: SubiquityServer.wsl(),
    onInitSubiquity: (client) => client.setVariant(variant),
    serverArgs: serverArgs,
  );
}
