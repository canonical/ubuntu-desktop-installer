import 'dart:io';

import 'package:args/args.dart';

void addCommonCliOptions(ArgParser parser) {
  parser.addFlag('dry-run',
      defaultsTo: Platform.environment['LIVE_RUN'] != '1',
      help: 'Run Subiquity server in dry-run mode');
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
  parser.addOption('initial-route', hide: true);
}

List<String>? serverArgsFromOptions(ArgResults options) {
  return <String>[
    if (options['prefill'] != null) ...['--prefill', options['prefill']],
    // Prevents the server to go autoinstall if a previous run was.
    // See https://github.com/canonical/ubuntu-desktop-installer/pull/1026
    if (options['reconfigure'] != null) '--autoinstall=',
  ];
}
