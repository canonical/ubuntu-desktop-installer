import 'dart:io';

class VersionExtractor {
  static VersionExtractor? _instance;

  static VersionExtractor get instance {
    if (_instance == null) {
      _instance = VersionExtractor._();
    }
    return _instance!;
  }

  VersionExtractor._();

  String loadedVersion = '';

  String _dummy() {
    return 'Ubuntu';
  }

  String extractLocalVersion(String content) {
    return content.substring(content.indexOf("\"") + 1, content.length - 1);
  }

  String getVersion({
    String path = '/cdrom/.disk/info',
    String localPath = '/etc/os-release',
  }) {
    if (loadedVersion.isNotEmpty) {
      return loadedVersion;
    }

    final fileOnCdrom = File(path);
    final localVersionFile = File(localPath);
    if (fileOnCdrom.existsSync()) {
      try {
        final content = fileOnCdrom
            .readAsLinesSync()
            .firstWhere((line) => line.trim().isNotEmpty);

        loadedVersion = extractVersion(content);
      } catch (e) {
        //TODO: configure logger?
      }
    } else if (localVersionFile.existsSync()) {
      try {
        final content = localVersionFile
            .readAsLinesSync()
            .firstWhere((line) => line.contains('PRETTY_NAME'));

        loadedVersion = extractLocalVersion(content);
      } catch (e) {
        //TODO: configure logger?
      }
    } else {
      loadedVersion = _dummy();
    }

    return loadedVersion;
  }

  String extractVersion(String content) {
    return content.substring(0, content.indexOf('"') - 1);
  }
}
