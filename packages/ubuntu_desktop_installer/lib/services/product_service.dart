import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:meta/meta.dart';

const String isoPath = '/cdrom/.disk/info';
const String localPath = '/etc/os-release';

/// A class which contains the system name and version
class ProductInfo {
  ProductInfo({required this.name, this.version});

  final String name;
  final String? version;

  @override
  String toString() => [name, version].whereType<String>().join(' ');
}

/// A class which reads current system info
class ProductService {
  ProductInfo? _cachedProductInfo;

  final FileSystem _fileSystem;

  ProductService([@visibleForTesting FileSystem? fileSystem])
      : _fileSystem = fileSystem ?? const LocalFileSystem();

  /// Returns system version from CD ISO or hard disk falls back to simple
  /// "Ubuntu" text when cannot find file.
  ProductInfo getProductInfo() {
    try {
      _cachedProductInfo ??= _extractIsoInfo(_fileSystem.file(isoPath));
      // ignore: empty_catches
    } on Exception {}

    try {
      _cachedProductInfo ??= _extractLocalInfo(_fileSystem.file(localPath));
      // ignore: empty_catches
    } on Exception {}

    _cachedProductInfo ??= ProductInfo(name: 'Ubuntu');

    return _cachedProductInfo!;
  }

  static ProductInfo? _extractIsoInfo(File file) {
    // versions on ISO are stored in format - Ubuntu 20.04.2.0 LTS "Focal Fossa" - Release amd64 (20210209.1)
    // we want to read system name and version without code name, so we extract them before the first quote
    final isoName =
        file.readAsLinesSync().firstWhere((l) => l.trim().isNotEmpty);
    return _parseProductName(isoName.substring(0, isoName.indexOf('"') - 1));
  }

  static ProductInfo _extractLocalInfo(File file) {
    // PRETTY_NAME="Ubuntu 20.04.2 LTS"
    final content = file
        .readAsLinesSync()
        .firstWhere((line) => line.startsWith('PRETTY_NAME'));
    final localName =
        content.substring(content.indexOf('"') + 1, content.lastIndexOf('"'));
    return _parseProductName(localName);
  }

  static ProductInfo _parseProductName(String info) {
    // extract an optional version string from the end of "Ubuntu 20.04.2.0 LTS".
    // the version is expected to be in format "<x>.<y>(.<z>...)" and may be
    // followed by a textual identifier such as "LTS".
    final match = RegExp(r'\d+\.\d+(?:\.\d+)*').firstMatch(info);

    // the product name up until the optional version
    final name = info.substring(0, match?.start ?? info.length);

    return ProductInfo(
      name: name.trim(),
      version: match != null ? info.substring(match.start) : null,
    );
  }
}
