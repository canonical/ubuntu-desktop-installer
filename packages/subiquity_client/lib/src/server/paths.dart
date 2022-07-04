import 'dart:io';

import 'package:package_config/package_config.dart';
import 'package:path/path.dart' as p;

import 'common.dart';

String? _subiquityPath;
String? _socketPath;

Future<String> getSubiquityPath() async {
  return _subiquityPath ??= await _findSubiquityPath();
}

Future<String> getSocketPath(ServerMode mode) async {
  return _socketPath ??= await _getSocketPath(mode);
}

// The path of the socket is fixed in live-run mode. In dry-run mode, it needs
// to be resolved based on the location of the `subiquity_client` package.
Future<String> _getSocketPath(ServerMode mode) async {
  if (mode == ServerMode.DRY_RUN) {
    // Use a relative path to avoid hitting AF_UNIX path length limit because
    // <path/to/ubuntu-desktop-installer>/packages/subiquity_client/subiquity/.subiquity/socket>
    // grows easily to more than 108-1 characters (char sockaddr_un::sun_path[108]).
    return p.relative(p.join(await getSubiquityPath(), '.subiquity/socket'));
  }
  return '/run/subiquity/socket';
}

// Finds local subiquity relative to the `subiquity_client` Dart package.
Future<String> _findSubiquityPath() async {
  Object? error;
  final config = await findPackageConfig(
    Directory.current,
    onError: (e) => error = e,
  );
  final package = config?.packages
      .firstWhere((package) => package.name == 'subiquity_client');
  if (package == null) {
    log.warning(
        'Unable to find the subiquity_client package. '
        'Falling back to the current working dir: ${Directory.current.path}',
        error);
  } else {
    log.debug('Found subiquity_client in ${package.root.path}');
  }
  return p.join(
    package?.root.toFilePath() ?? Directory.current.path,
    'subiquity',
  );
}
