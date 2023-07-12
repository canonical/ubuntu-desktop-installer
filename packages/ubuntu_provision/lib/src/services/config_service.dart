import 'dart:convert';

import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;
import 'package:toml/toml.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';
import 'package:yaml/yaml.dart';

/// @internal
final log = Logger('config');

class ConfigService {
  ConfigService(this._path, {@visibleForTesting FileSystem? fs})
      : _fs = fs ?? const LocalFileSystem();

  final String _path;
  final FileSystem _fs;
  Map<String, dynamic>? _config;

  Future<T?> get<T>(String key) async {
    _config ??= await load();
    return _config?[key] as T?;
  }

  @visibleForTesting
  Future<Map<String, dynamic>?> load() async {
    final file = _fs.file(_path);
    try {
      final data = await file.readAsString();
      final config = switch (p.extension(_path)) {
        '.yml' || '.yaml' => loadYaml(data),
        '.tml' || '.toml' => TomlDocument.parse(data).toMap(),
        '.json' => jsonDecode(data),
        _ => throw UnsupportedError(_path),
      };
      log.debug('loaded $_path');
      return (config as Map).cast();
    } on FileSystemException catch (e) {
      log.error('failed to load $_path', e);
      return null;
    }
  }
}
