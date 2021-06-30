import 'dart:io';

class VersionExtractor {
  String _dummy() {
    return 'Ubuntu 20.04';
  }

  String getVersion({String path = '/cdrom/.disk/info'}) {
    final fileOnCdrom = File(path);
    if (fileOnCdrom.existsSync()) {
      try {
        final content = fileOnCdrom
            .readAsLinesSync()
            .firstWhere((line) => line.trim().isNotEmpty);

        return extractVersion(content);
      } catch (e) {
        //TODO: configure logger?
      }
    }
    return _dummy();
  }

  String extractVersion(String content) {
    final chunks = content.split(' ');
    if (chunks.length > 1) {
      return '${chunks[0]} ${chunks[1]}';
    }
    return '';
  }
}
