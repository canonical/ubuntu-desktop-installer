import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:ubuntu_wizard/services.dart';
import 'package:ubuntu_wizard/src/utils/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart' show WebViewConfiguration;
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

const expectedUseWebView = true;
const expectedWebViewConfiguration = WebViewConfiguration();
const expectedUniversalLinksOnly = false;
const expectedWebOnlyWindowName = null;

void createPlatformMock(
  String url, {
  required bool canLaunch,
  required bool result,
}) {
  final mock = MockUrlLauncherPlatform();
  when(mock.canLaunch(url)).thenAnswer((_) async => canLaunch);
  when(mock.launch(
    url,
    useSafariVC: expectedUseWebView,
    useWebView: expectedUseWebView,
    enableJavaScript: expectedWebViewConfiguration.enableJavaScript,
    enableDomStorage: expectedWebViewConfiguration.enableDomStorage,
    universalLinksOnly: expectedUniversalLinksOnly,
    headers: expectedWebViewConfiguration.headers,
    webOnlyWindowName: expectedWebOnlyWindowName,
  )).thenAnswer((_) async => result);
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
    verify(mock.launch(
      url,
      useSafariVC: expectedUseWebView,
      useWebView: expectedUseWebView,
      enableJavaScript: expectedWebViewConfiguration.enableJavaScript,
      enableDomStorage: expectedWebViewConfiguration.enableDomStorage,
      universalLinksOnly: expectedUniversalLinksOnly,
      headers: expectedWebViewConfiguration.headers,
      webOnlyWindowName: expectedWebOnlyWindowName,
    )).called(1);
  } else {
    verifyNever(mock.launch(
      url,
      useSafariVC: expectedUseWebView,
      useWebView: expectedUseWebView,
      enableJavaScript: expectedWebViewConfiguration.enableJavaScript,
      enableDomStorage: expectedWebViewConfiguration.enableDomStorage,
      universalLinksOnly: expectedUniversalLinksOnly,
      headers: expectedWebViewConfiguration.headers,
      webOnlyWindowName: expectedWebOnlyWindowName,
    ));
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
  Future<bool> launch(
    String url, {
    required bool useSafariVC,
    required bool useWebView,
    required bool enableJavaScript,
    required bool enableDomStorage,
    required bool universalLinksOnly,
    required Map<String, String> headers,
    String? webOnlyWindowName,
  }) {
    return super.noSuchMethod(
      Invocation.method(
        #launch,
        [url],
        {
          #useSafariVC: useSafariVC,
          #useWebView: useWebView,
          #enableJavaScript: enableJavaScript,
          #enableDomStorage: enableDomStorage,
          #universalLinksOnly: universalLinksOnly,
          #headers: headers,
          #webOnlyWindowName: webOnlyWindowName,
        },
      ),
      returnValue: Future.value(false),
    );
  }
}
