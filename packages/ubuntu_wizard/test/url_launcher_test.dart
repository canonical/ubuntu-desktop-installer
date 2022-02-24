import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:ubuntu_wizard/src/utils/url_launcher.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

// ignore_for_file: prefer_mixin

void main() {
  const url = 'https://www.ubuntu.com';

  test('can launch', () async {
    final mock = MockUrlLauncherPlatform();
    when(mock.canLaunch(url)).thenAnswer((_) async => true);
    when(mock.launch(
      url,
      useSafariVC: true,
      useWebView: false,
      enableJavaScript: false,
      enableDomStorage: false,
      universalLinksOnly: false,
      headers: {},
      webOnlyWindowName: null,
    )).thenAnswer((_) async => true);
    UrlLauncherPlatform.instance = mock;

    final launcher = UrlLauncher();
    expect(await launcher.launchUrl(url), isTrue);

    verify(mock.canLaunch(url)).called(1);
    verify(mock.launch(
      url,
      useSafariVC: true,
      useWebView: false,
      enableJavaScript: false,
      enableDomStorage: false,
      universalLinksOnly: false,
      headers: {},
      webOnlyWindowName: null,
    )).called(1);
  });

  test('cannot launch', () async {
    final mock = MockUrlLauncherPlatform();
    when(mock.canLaunch(url)).thenAnswer((_) async => false);
    UrlLauncherPlatform.instance = mock;

    final launcher = UrlLauncher();
    expect(await launcher.launchUrl(url), isFalse);

    verify(mock.canLaunch(url)).called(1);
    verifyNever(mock.launch(
      url,
      useSafariVC: true,
      useWebView: false,
      enableJavaScript: false,
      enableDomStorage: false,
      universalLinksOnly: false,
      headers: {},
      webOnlyWindowName: null,
    ));
  });

  test('launch fail', () async {
    final mock = MockUrlLauncherPlatform();
    when(mock.canLaunch(url)).thenAnswer((_) async => true);
    when(mock.launch(
      url,
      useSafariVC: true,
      useWebView: false,
      enableJavaScript: false,
      enableDomStorage: false,
      universalLinksOnly: false,
      headers: {},
      webOnlyWindowName: null,
    )).thenAnswer((_) async => false);
    UrlLauncherPlatform.instance = mock;

    final launcher = UrlLauncher();
    expect(await launcher.launchUrl(url), isFalse);

    verify(mock.canLaunch(url)).called(1);
    verify(mock.launch(
      url,
      useSafariVC: true,
      useWebView: false,
      enableJavaScript: false,
      enableDomStorage: false,
      universalLinksOnly: false,
      headers: {},
      webOnlyWindowName: null,
    )).called(1);
  });
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
