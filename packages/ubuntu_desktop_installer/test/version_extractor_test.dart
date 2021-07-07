import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/utils/version_extractor.dart';

void main() {
  group('VersionExtractor', () {
    test('should return Ubuntu 20.04 for given string', () {
      final extractor = VersionExtractor.instance;

      final version = extractor.extractVersion(
          'Ubuntu 21.04 "Hirsute Hippo" - Release amd64 (20210420)');

      expect(version, 'Ubuntu 21.04');
    });

    test('should return Ubuntu 20.04.2.0 LTS for lts version string', () {
      final extractor = VersionExtractor.instance;

      final version = extractor.extractVersion(
          'Ubuntu 20.04.2.0 LTS "Focal Fossa" - Release amd64 (20210209.1)');

      expect(version, 'Ubuntu 20.04.2.0 LTS');
    });

    test('should return Ubuntu when paths do not exist', () {
      final extractor = VersionExtractor.instance;

      final version = extractor.getVersion(path: '/a', localPath: '/b');

      expect(version, 'Ubuntu');
    });

    test('should extract pretty name from content', () {
      final extractor = VersionExtractor.instance;

      final version =
          extractor.extractLocalVersion('PRETTY_NAME="Ubuntu 21.04"');

      expect(version, 'Ubuntu 21.04');
    });
  });
}
