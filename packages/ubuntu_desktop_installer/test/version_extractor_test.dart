import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/pages/installation_complete/version_extractor.dart';

void main() {
  group('VersionExtractor', () {
    test('should return Ubuntu 20.04 for given string', () {
      final extractor = VersionExtractor();

      final version = extractor.extractVersion(
          'Ubuntu 21.04 "Hirsute Hippo" - Release amd64 (20210420)');

      expect(version, 'Ubuntu 21.04');
    });

    test('should return Ubuntu 20.04 for two elements', () {
      final extractor = VersionExtractor();

      final version = extractor.extractVersion('Ubuntu 21.04.10');

      expect(version, 'Ubuntu 21.04.10');
    });

    test('should return empty string when version too short', () {
      final extractor = VersionExtractor();

      final version = extractor.extractVersion('Ubuntu');

      expect(version, '');
    });
  });
}
