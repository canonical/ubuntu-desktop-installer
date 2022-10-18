import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:meta/meta.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';

/// @internal
final log = Logger('config');

class ConfigService {
  ConfigService(this._path, {@visibleForTesting FileSystem? fs})
      : _fs = fs ?? const LocalFileSystem();

  final String _path;
  final FileSystem _fs;

  Future<Map<String, String?>> load() async {
    final file = _fs.file(_path);
    try {
      final config =
          await file.readAsLines().then((lines) => lines.toKeyValueMap());
      log.debug('loaded ${config.length} entries from $_path');
      return config;
    } on FileSystemException catch (e) {
      if (file.existsSync()) {
        log.error('failed to load $_path', e);
      }
      return {};
    }
  }

  Future<void> save(Map<String, String?> config) async {
    try {
      final file = _fs.file(_path);
      final data = config.toKeyValueList().join('\n');
      await file.create(recursive: true);
      await file.writeAsString('$data\n');
      log.debug('saved ${config.length} entries to $_path');
    } on FileSystemException catch (e) {
      log.error('failed to save $_path', e);
    }
  }
}

extension _KeyValueList on List<String> {
  Map<String, String?> toKeyValueMap() {
    return Map.fromEntries(
      where((line) => !line.startsWith('#'))
          .map((line) => line.split('='))
          .where((parts) => parts.length == 2)
          .map((parts) => MapEntry(parts.first, parts.last.unquote())),
    );
  }
}

extension _KeyValueMap on Map<String, String?> {
  List<String> toKeyValueList() {
    return entries
        .map((entry) => '${entry.key}=${entry.value?.maybeQuote() ?? ''}')
        .toList();
  }
}

extension _StringX on String {
  String removePrefix(String prefix) {
    if (!startsWith(prefix)) return this;
    return substring(prefix.length);
  }

  String removeSuffix(String suffix) {
    if (!endsWith(suffix)) return this;
    return substring(0, length - suffix.length);
  }

  String unquote() {
    return removePrefix('"')
        .removePrefix("'")
        .removeSuffix('"')
        .removeSuffix("'");
  }

  String maybeQuote() => contains(' ') ? '"$this"' : this;
}
