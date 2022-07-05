import 'package:args/args.dart';

void addCommonCliOptions(ArgParser parser) {
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
}

List<String>? serverArgsFromOptions(ArgResults options) {
  if (options['prefill'] == null) {
    return null;
  }

  return ['--prefill', options['prefill']];
}
