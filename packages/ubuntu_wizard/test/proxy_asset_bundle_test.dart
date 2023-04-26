import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:path/path.dart' as p;
import 'package:ubuntu_wizard/utils.dart';

import 'proxy_asset_bundle_test.mocks.dart';

final appPath = p.dirname(Platform.resolvedExecutable);
final assetName = p.join('assets', 'foo.txt');
final bundlePath = p.join(appPath, 'data', 'flutter_assets');
final appAssetPath = p.join(bundlePath, assetName);
final pkgAssetPath = p.join(bundlePath, 'packages', 'qux', assetName);

@GenerateMocks([], customMocks: [
  MockSpec<AssetBundle>(
    as: #MockAssetBundle,
    fallbackGenerators: {#loadStructuredData: loadMockData},
  ),
])
void main() {
  test('app asset', () async {
    final bundle = MockAssetBundle();
    final proxy = ProxyAssetBundle(bundle, package: 'qux');

    await IOOverrides.runZoned(() async {
      when(bundle.load(appAssetPath))
          .thenAnswer((_) async => 'bar'.toByteData());
      expect(await proxy.loadString(assetName), equals('bar'));
    }, createFile: MockFileCreator({appAssetPath}));

    verify(bundle.load(appAssetPath)).called(1);
    verifyNever(bundle.load(pkgAssetPath));
    verifyNever(bundle.load(assetName));
  });

  test('structured app asset', () async {
    final bundle = MockAssetBundle();
    final proxy = ProxyAssetBundle(bundle, package: 'qux');

    await IOOverrides.runZoned(() async {
      when(
        bundle.loadStructuredData<String>(appAssetPath, parseMockData),
      ).thenAnswer((_) async => 'baz');
      expect(await proxy.loadStructuredData<String>(assetName, parseMockData),
          equals('baz'));
    }, createFile: MockFileCreator({appAssetPath}));

    verify(bundle.loadStructuredData<String>(appAssetPath, parseMockData))
        .called(1);
    verifyNever(bundle.loadStructuredData<String>(pkgAssetPath, parseMockData));
    verifyNever(bundle.loadStructuredData<String>(assetName, parseMockData));
  });

  test('package asset', () async {
    final bundle = MockAssetBundle();
    final proxy = ProxyAssetBundle(bundle, package: 'qux');

    await IOOverrides.runZoned(() async {
      when(bundle.load(pkgAssetPath))
          .thenAnswer((_) async => 'bar'.toByteData());
      expect(await proxy.loadString(assetName), equals('bar'));
    }, createFile: MockFileCreator({pkgAssetPath}));

    verifyNever(bundle.load(appAssetPath));
    verify(bundle.load(pkgAssetPath)).called(1);
    verifyNever(bundle.load(assetName));
  });

  test('structured package asset', () async {
    final bundle = MockAssetBundle();
    final proxy = ProxyAssetBundle(bundle, package: 'qux');

    await IOOverrides.runZoned(() async {
      when(
        bundle.loadStructuredData<String>(pkgAssetPath, parseMockData),
      ).thenAnswer((_) async => 'baz');
      expect(await proxy.loadStructuredData<String>(assetName, parseMockData),
          equals('baz'));
    }, createFile: MockFileCreator({pkgAssetPath}));

    verifyNever(bundle.loadStructuredData<String>(appAssetPath, parseMockData));
    verify(bundle.loadStructuredData<String>(pkgAssetPath, parseMockData))
        .called(1);
    verifyNever(bundle.loadStructuredData<String>(assetName, parseMockData));
  });

  test('test asset', () async {
    final bundle = MockAssetBundle();
    final proxy = ProxyAssetBundle(bundle, package: 'qux');

    await IOOverrides.runZoned(() async {
      when(bundle.load(assetName)).thenAnswer((_) async => 'bar'.toByteData());
      expect(await proxy.loadString(assetName), equals('bar'));
    }, createFile: MockFileCreator({}));

    verifyNever(bundle.load(appAssetPath));
    verifyNever(bundle.load(pkgAssetPath));
    verify(bundle.load(assetName)).called(1);
  });

  test('structured test asset', () async {
    final bundle = MockAssetBundle();
    final proxy = ProxyAssetBundle(bundle, package: 'qux');

    await IOOverrides.runZoned(() async {
      when(
        bundle.loadStructuredData<String>(assetName, parseMockData),
      ).thenAnswer((_) async => 'baz');
      expect(await proxy.loadStructuredData<String>(assetName, parseMockData),
          equals('baz'));
    }, createFile: MockFileCreator({}));

    verifyNever(bundle.loadStructuredData<String>(appAssetPath, parseMockData));
    verifyNever(bundle.loadStructuredData<String>(pkgAssetPath, parseMockData));
    verify(bundle.loadStructuredData<String>(assetName, parseMockData))
        .called(1);
  });
}

extension StringData on String {
  ByteData toByteData() => ByteData.view(Uint8List.fromList(codeUnits).buffer);
}

Future<String> parseMockData(String data) async => 'baz';
Future<String> loadMockData<T>(String? k, StructuredDataParser? p) async => '';

class MockFileCreator {
  MockFileCreator(this.paths);
  final Set<String> paths;
  File call(String path) {
    final file = MockFile(path);
    when(file.existsSync()).thenReturn(paths.contains(path));
    return file;
  }
}

class MockFile extends Mock implements File {
  MockFile(this.path);

  @override
  final String path;

  @override
  bool existsSync() {
    return super.noSuchMethod(
      Invocation.method(#existsSync, []),
      returnValue: false,
    );
  }
}
