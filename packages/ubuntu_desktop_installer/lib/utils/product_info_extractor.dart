import 'package:file/file.dart';
import 'package:file/local.dart';

const String isoPath = '/cdrom/.disk/info';
const String localPath = '/etc/os-release';

/// A class which reads current system version
class ProductInfoExtractor {
  static String _cachedProductInfo = '';

  final FileSystem _fileSystem;

  ProductInfoExtractor({
    FileSystem fileSystem = const LocalFileSystem(),
  }) : _fileSystem = fileSystem;

  /// Returns system version from CD ISO or hard disk falls back to simple
  /// "Ubuntu" text when cannot find file.
  ///
  /// Returned value is cached.
  /// Optionally cache can be cleared by specifing `shouldResetCache` to `true`
  String getProductInfo({bool shouldResetCache = false}) {
    if (shouldResetCache) {
      _cachedProductInfo = '';
    }

    if (_cachedProductInfo.isNotEmpty) {
      return _cachedProductInfo;
    }

    if (_fileSystem.file(isoPath).existsSync()) {
      try {
        final content = _fileSystem
            .file(isoPath)
            .readAsLinesSync()
            .firstWhere((line) => line.trim().isNotEmpty);

        // versions on ISO are stored in format - Ubuntu 20.04.2.0 LTS "Focal Fossa" - Release amd64 (20210209.1)
        // we want to read system name and version without code name, so we extract it before second quote
        _cachedProductInfo = content.substring(0, content.indexOf('"') - 1);
      } on Exception {
        _extractLocalVersion(localPath);
      }
    } else {
      _extractLocalVersion(localPath);
    }

    return _cachedProductInfo;
  }

  void _extractLocalVersion(String localPath) {
    if (_fileSystem.file(localPath).existsSync()) {
      try {
        final content = _fileSystem
            .file(localPath)
            .readAsLinesSync()
            .firstWhere((line) => line.startsWith('PRETTY_NAME'));

        _cachedProductInfo = content.substring(
            content.indexOf("\"") + 1, content.lastIndexOf("\""));
      } on Exception {
        _cachedProductInfo = 'Ubuntu';
      }
    } else {
      _cachedProductInfo = 'Ubuntu';
    }
  }
}
