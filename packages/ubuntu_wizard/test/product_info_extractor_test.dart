import 'package:file/file.dart';
import 'package:file/memory.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_wizard/utils.dart';

void main() {
  group('ProductInfoExtractor', () {
    late FileSystem fileSystem;
    ProductInfoExtractor? productInfoExtractor;
    setUp(() {
      fileSystem = MemoryFileSystem();

      productInfoExtractor = ProductInfoExtractor(fileSystem: fileSystem);
    });

    test('should return product info when iso file exists', () async {
      final isoPath = '/cdrom/.disk/info';

      await fileSystem.file(isoPath).create(recursive: true).then((f) {
        f.writeAsString(
            'Ubuntu 21.04 "Hirsute Hippo" - Release amd64 (20210420)');
      });
      final version =
          productInfoExtractor?.getProductInfo(shouldResetCache: true);

      expect(version, 'Ubuntu 21.04');
    });

    test('should return product info from disk when iso file doesnt exists',
        () async {
      final localPath = '/etc/os-release';

      await fileSystem.file(localPath).create(recursive: true).then((f) {
        f.writeAsString('''
NAME="Ubuntu"
VERSION="21.04 (Hirsute Hippo)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 21.04"
VERSION_ID="21.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=hirsute
UBUNTU_CODENAME=hirsute

          ''');
      });
      final version =
          productInfoExtractor?.getProductInfo(shouldResetCache: true);

      expect(version, 'Ubuntu 21.04');
    });

    test('should return Ubuntu as fallback value', () {
      final version =
          productInfoExtractor?.getProductInfo(shouldResetCache: true);

      expect(version, 'Ubuntu');
    });

    test('should return product info with LTS when iso file exists', () async {
      final isoPath = '/cdrom/.disk/info';

      await fileSystem.file(isoPath).create(recursive: true).then((f) {
        f.writeAsString(
            'Ubuntu 20.04.2.0 LTS "Focal Fossa" - Release amd64 (20210209.1)');
      });
      final version =
          productInfoExtractor?.getProductInfo(shouldResetCache: true);

      expect(version, 'Ubuntu 20.04.2.0 LTS');
    });

    test('should return product info LTS from disk when iso file doesnt exists',
        () async {
      final localPath = '/etc/os-release';

      await fileSystem.file(localPath).create(recursive: true).then((f) {
        f.writeAsString('''
NAME="Ubuntu"
VERSION="20.04.2 LTS (Focal Fossa)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 20.04.2 LTS"
VERSION_ID="20.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=focal
UBUNTU_CODENAME=focal

          ''');
      });
      final version =
          productInfoExtractor?.getProductInfo(shouldResetCache: true);

      expect(version, 'Ubuntu 20.04.2 LTS');
    });

    test('should return product info for kubuntu', () async {
      final isoPath = '/cdrom/.disk/info';

      await fileSystem.file(isoPath).create(recursive: true).then((f) {
        f.writeAsString(
            'Kubuntu 21.04 "Hirsute Hippo" - Release amd64 (20210420)');
      });
      final version =
          productInfoExtractor?.getProductInfo(shouldResetCache: true);

      expect(version, 'Kubuntu 21.04');
    });

    test('should return product info for kubuntu', () async {
      final isoPath = '/cdrom/.disk/info';

      await fileSystem.file(isoPath).create(recursive: true).then((f) {
        f.writeAsString(
            'Kubuntu 21.04 "Hirsute Hippo" - Release amd64 (20210420)');
      });
      final version =
          productInfoExtractor?.getProductInfo(shouldResetCache: true);

      expect(version, 'Kubuntu 21.04');
    });

    test('should return product info for ubuntu mate', () async {
      final isoPath = '/cdrom/.disk/info';

      await fileSystem.file(isoPath).create(recursive: true).then((f) {
        f.writeAsString(
            'Ubuntu-MATE 21.04 "Hirsute Hippo" - Release amd64 (20210420)');
      });
      final version =
          productInfoExtractor?.getProductInfo(shouldResetCache: true);

      expect(version, 'Ubuntu-MATE 21.04');
    });

    test('should cache product info', () async {
      final isoPath = '/cdrom/.disk/info';

      await fileSystem.file(isoPath).create(recursive: true).then((f) {
        f.writeAsString(
            'Ubuntu 21.04 "Hirsute Hippo" - Release amd64 (20210420)');
      });
      var version =
          productInfoExtractor?.getProductInfo(shouldResetCache: true);

      await fileSystem.file(isoPath).create(recursive: true).then((f) {
        f.writeAsString(
            'Ubuntu-MATE 21.04 "Hirsute Hippo" - Release amd64 (20210420)');
      });

      version = productInfoExtractor?.getProductInfo();

      expect(version, 'Ubuntu 21.04');
    });

    test('should reset cache when paramter is passed', () async {
      final isoPath = '/cdrom/.disk/info';

      await fileSystem.file(isoPath).create(recursive: true).then((f) {
        f.writeAsString(
            'Ubuntu 21.04 "Hirsute Hippo" - Release amd64 (20210420)');
      });
      var version =
          productInfoExtractor?.getProductInfo(shouldResetCache: true);

      await fileSystem.file(isoPath).create(recursive: true).then((f) {
        f.writeAsString(
            'Ubuntu-MATE 21.04 "Hirsute Hippo" - Release amd64 (20210420)');
      });

      version = productInfoExtractor?.getProductInfo(shouldResetCache: true);

      expect(version, 'Ubuntu-MATE 21.04');
    });
  });
}
