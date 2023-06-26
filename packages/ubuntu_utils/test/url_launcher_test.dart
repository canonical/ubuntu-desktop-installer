import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:ubuntu_utils/src/url_launcher.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

// ignore_for_file: prefer_mixin

void main() {
  const testUrl = 'https://www.ubuntu.com';

  test('can launch', () async {
    createPlatformMock(testUrl, canLaunch: true, result: true);

    final launcher = UrlLauncher();
    expect(await launcher.launchUrl(testUrl), isTrue);

    verifyPlatformMock(url: testUrl, canLaunch: true, result: true);
  });

  test('cannot launch', () async {
    createPlatformMock(testUrl, canLaunch: false, result: false);

    final launcher = UrlLauncher();
    expect(await launcher.launchUrl(testUrl), isFalse);

    verifyPlatformMock(url: testUrl, canLaunch: false, result: false);
  });

  test('launch fail', () async {
    createPlatformMock(testUrl, canLaunch: true, result: false);

    final launcher = UrlLauncher();
    expect(await launcher.launchUrl(testUrl), isFalse);

    verifyPlatformMock(url: testUrl, canLaunch: true, result: false);
  });

  test('service', () async {
    createPlatformMock(testUrl, canLaunch: true, result: true);

    registerMockService(UrlLauncher());
    expect(await launchUrl(testUrl), isTrue);

    verifyPlatformMock(url: testUrl, canLaunch: true, result: true);
  });
}

void createPlatformMock(
  String url, {
  required bool canLaunch,
  required bool result,
}) {
  final mock = MockUrlLauncherPlatform();
  when(mock.canLaunch(url)).thenAnswer((_) async => canLaunch);
  when(mock.launchUrl(url, any)).thenAnswer((_) async => result);
  UrlLauncherPlatform.instance = mock;
}

void verifyPlatformMock({
  required String url,
  required bool canLaunch,
  required bool result,
}) {
  final mock = UrlLauncherPlatform.instance as MockUrlLauncherPlatform;

  verify(mock.canLaunch(url)).called(1);

  if (canLaunch) {
    verify(mock.launchUrl(url, any)).called(1);
  } else {
    verifyNever(mock.launchUrl(url, any));
  }
}

class MockUrlLauncherPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements UrlLauncherPlatform {
  @override
  Future<bool> canLaunch(String url) {
    return super.noSuchMethod(
      Invocation.method(#canLaunch, [url]),
      returnValue: Future.value(false),
    );
  }

  @override
  Future<bool> launchUrl(String url, LaunchOptions? options) {
    return super.noSuchMethod(
      Invocation.method(#launchUrl, [url, options]),
      returnValue: Future.value(false),
    );
  }
}
