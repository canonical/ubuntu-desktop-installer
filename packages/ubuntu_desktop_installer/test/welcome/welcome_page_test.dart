import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/welcome/welcome_model.dart';
import 'package:ubuntu_desktop_installer/pages/welcome/welcome_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/ubuntu_test.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:yaru_test/yaru_test.dart';

import '../test_utils.dart';
import 'welcome_page_test.mocks.dart';

const kTestReleaseNotes = 'https://wiki.ubuntu.com/foo/ReleaseNotes';

@GenerateMocks([UrlLauncher, WelcomeModel])
void main() {
  setUpAll(YaruTestWindow.ensureInitialized);

  WelcomeModel buildModel({bool? isConnected, Option? option}) {
    final model = MockWelcomeModel();
    when(model.isConnected).thenReturn(isConnected ?? false);
    when(model.option).thenReturn(option ?? Option.none);
    when(model.releaseNotesURL(any)).thenReturn(kTestReleaseNotes);
    return model;
  }

  Widget buildPage(WelcomeModel model) {
    return ProviderScope(
      overrides: [
        welcomeModelProvider.overrideWith((_) => model),
      ],
      child: const WelcomePage(),
    );
  }

  testWidgets('release notes', (tester) async {
    final model = buildModel(isConnected: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(find.byType(Html).hitTestable(), findsOneWidget);

    final urlLauncher = MockUrlLauncher();
    when(urlLauncher.launchUrl(any)).thenAnswer((_) async => true);
    registerMockService<UrlLauncher>(urlLauncher);

    await tester.tapLink('release notes');

    verify(urlLauncher.launchUrl(kTestReleaseNotes)).called(1);
  });

  testWidgets('offline', (tester) async {
    final model = buildModel(isConnected: false);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(find.byType(Html).hitTestable(), findsNothing);
  });

  testWidgets('select option', (tester) async {
    final model = buildModel(option: Option.none);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(find.button(tester.ulang.nextLabel), isDisabled);

    await tester.tap(find.radio(Option.installUbuntu));
    verify(model.selectOption(Option.installUbuntu)).called(1);

    await tester.tap(find.radio(Option.tryUbuntu));
    verify(model.selectOption(Option.tryUbuntu)).called(1);
  });

  testWidgets('install ubuntu', (tester) async {
    final model = buildModel(option: Option.installUbuntu);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(find.button(tester.ulang.nextLabel), isEnabled);
  });

  testWidgets('try ubuntu', (tester) async {
    final model = buildModel(option: Option.tryUbuntu);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(find.button(tester.ulang.nextLabel), isEnabled);

    final windowClosed = YaruTestWindow.waitForClosed();

    await tester.tap(find.button(tester.ulang.nextLabel));
    await tester.pump();

    await expectLater(windowClosed, completes);
  });
}
