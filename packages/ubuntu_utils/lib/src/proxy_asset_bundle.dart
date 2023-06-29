import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;

typedef StructuredDataParser<T> = Future<T> Function(String value);

/// Attempts to locate assets in the app asset bundle, or if not found, falls
/// back to the specified package's asset bundle.
class ProxyAssetBundle extends AssetBundle {
  ProxyAssetBundle(this.source, {required this.package});

  /// The source bundle to load assets from.
  final AssetBundle source;

  /// The fallback package name.
  final String package;

  @override
  Future<ByteData> load(String key) {
    final asset = _findAsset(key, package: package);
    return source.load(asset);
  }

  @override
  Future<T> loadStructuredData<T>(String key, StructuredDataParser<T> parser) {
    final asset = _findAsset(key, package: package);
    return source.loadStructuredData<T>(asset, parser);
  }

  String _findAsset(String assetName, {required String package}) {
    // <app>/data/flutter_assets/
    final exePath = Platform.resolvedExecutable;
    final bundlePath = p.join(p.dirname(exePath), 'data', 'flutter_assets');

    // <bundle>/assets/foo.png
    final appAsset = File(p.join(bundlePath, assetName));
    if (appAsset.existsSync()) {
      return appAsset.path;
    }

    // <bundle>/packages/<package>/assets/foo.png
    final pkgAsset = File(p.join(bundlePath, 'packages', package, assetName));
    if (pkgAsset.existsSync()) {
      return pkgAsset.path;
    }

    return assetName;
  }
}
