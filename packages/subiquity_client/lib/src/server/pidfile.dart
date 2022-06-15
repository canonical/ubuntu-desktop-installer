import 'dart:io';
import 'package:xdg_directories/xdg_directories.dart' as xdg;

import 'common.dart';

Future<int?> readPidFile() async {
  final file = pidFile();
  if (!await file.exists()) {
    return null;
  }
  final content = await file.readAsString();
  return int.tryParse(content.trim());
}

Future<void> writePidFile(int pid) async {
  final file = pidFile();
  try {
    await file.create(recursive: true);
    await file.writeAsString(pid.toString());
  } on FileSystemException catch (e) {
    log.warning('Error writing ${file.path} (${e.message}). '
        'Hot restarts may cause multiple Subiquity test servers to run.');
  }
}

File pidFile() {
  final dir = xdg.runtimeDir?.path ?? Directory.current.path;
  return File('$dir/subiquity-test-server.pid');
}
