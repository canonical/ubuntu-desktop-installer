import 'dart:io';

import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:flutter/foundation.dart';

class ProductInfoExtractor {
  static String _cachedProductInfo = '';

  final FileSystem fileSystem;

  ProductInfoExtractor({
    this.fileSystem = const LocalFileSystem(),
  });

  String getProductInfo({
    String isoPath = '/cdrom/.disk/info',
    String localPath = '/etc/os-release',
  }) {
    if (_cachedProductInfo.isNotEmpty) {
      return _cachedProductInfo;
    }

    if (fileSystem.file(isoPath).existsSync()) {
      try {
        final content = fileSystem
            .file(isoPath)
            .readAsLinesSync()
            .firstWhere((line) => line.trim().isNotEmpty);

        _cachedProductInfo = content.substring(0, content.indexOf('"') - 1);
      } on Exception catch (e) {
        _extractLocalVersion(localPath);
      }
    } else {
      _extractLocalVersion(localPath);
    }

    return _cachedProductInfo;
  }

  void _extractLocalVersion(String localPath) {
    if (fileSystem.file(localPath).existsSync()) {
      try {
        final content = fileSystem
            .file(localPath)
            .readAsLinesSync()
            .firstWhere((line) => line.startsWith('PRETTY_NAME'));

        _cachedProductInfo = content.substring(
            content.indexOf("\"") + 1, content.lastIndexOf("\""));
      } on Exception catch (e) {
        _cachedProductInfo = 'Ubuntu';
      }
    } else {
      _cachedProductInfo = 'Ubuntu';
    }
  }

  @visibleForTesting
  void resetState() {
    _cachedProductInfo = '';
  }
}
