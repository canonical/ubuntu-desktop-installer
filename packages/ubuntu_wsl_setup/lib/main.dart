import 'package:flutter/widgets.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_client/subiquity_server.dart';
import 'package:ubuntu_wizard/app.dart';
import 'package:ubuntu_wizard/services.dart';
import 'package:ubuntu_wizard/utils.dart';

import 'app.dart';
import 'installing_state.dart';

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
  final variant = ValueNotifier<Variant?>(null);
  List<String>? serverArgs;
  if (options['prefill'] != null) {
    serverArgs = ['--prefill', options['prefill']];
  }
  final subiquityMonitor = SubiquityStatusMonitor();
  registerService(UrlLauncher.new);
  runWizardApp(
    ValueListenableBuilder<Variant?>(
      valueListenable: variant,
      builder: (context, value, child) {
        return UbuntuWslSetupApp(
          variant: value,
          initialRoute: options['initial-route'],
        );
      },
    ),
    options: options,
    subiquityClient: SubiquityClient(),
    subiquityServer: SubiquityServer.wsl(),
    subiquityMonitor: subiquityMonitor,
    onInitSubiquity: (client) {
      client.variant().then((value) {
        variant.value = value;
        if (value == Variant.WSL_SETUP) {
          subiquityMonitor.onStatusChanged.listen((status) {
            setWindowClosable(status?.state?.isInstalling != true);
          });
        }
      });
      client.markConfigured(['filesystem']);
    },
    serverArgs: serverArgs,
    serverEnvironment: {
      if (!isLiveRun(options) && options['reconfigure'] == true)
        'DRYRUN_RECONFIG': 'true',
    },
  );
}
