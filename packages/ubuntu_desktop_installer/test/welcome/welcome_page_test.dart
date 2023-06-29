import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/welcome/welcome_model.dart';
import 'package:ubuntu_desktop_installer/pages/welcome/welcome_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/ubuntu_test.dart';
import 'package:ubuntu_utils/ubuntu_utils.dart';
import 'package:yaru_test/yaru_test.dart';

import 'test_welcome.dart';

void main() {
  setUpAll(YaruTestWindow.ensureInitialized);

  testWidgets('release notes', (tester) async {
    final model = buildWelcomeModel(isConnected: true);
    await tester.pumpWidget(tester.buildApp((_) => buildWelcomePage(model)));

    expect(find.byType(Html).hitTestable(), findsOneWidget);

    final urlLauncher = MockUrlLauncher();
    when(urlLauncher.launchUrl(any)).thenAnswer((_) async => true);
    registerMockService<UrlLauncher>(urlLauncher);

    await tester.tapLink('release notes');

    verify(urlLauncher.launchUrl(kTestReleastNoteUrl)).called(1);
  });

  testWidgets('offline', (tester) async {
    final model = buildWelcomeModel(isConnected: false);
    await tester.pumpWidget(tester.buildApp((_) => buildWelcomePage(model)));

    expect(find.byType(Html).hitTestable(), findsNothing);
  });

  testWidgets('select option', (tester) async {
    final model = buildWelcomeModel(option: Option.none);
    await tester.pumpWidget(tester.buildApp((_) => buildWelcomePage(model)));

    expect(find.button(tester.ulang.nextLabel), isDisabled);

    await tester.tap(find.radio(Option.installUbuntu));
    verify(model.selectOption(Option.installUbuntu)).called(1);

    await tester.tap(find.radio(Option.tryUbuntu));
    verify(model.selectOption(Option.tryUbuntu)).called(1);
  });

  testWidgets('install ubuntu', (tester) async {
    final model = buildWelcomeModel(option: Option.installUbuntu);
    await tester.pumpWidget(tester.buildApp((_) => buildWelcomePage(model)));

    expect(find.button(tester.ulang.nextLabel), isEnabled);
  });

  testWidgets('try ubuntu', (tester) async {
    final model = buildWelcomeModel(option: Option.tryUbuntu);
    await tester.pumpWidget(tester.buildApp((_) => buildWelcomePage(model)));

    expect(find.button(tester.ulang.nextLabel), isEnabled);

    final windowClosed = YaruTestWindow.waitForClosed();

    await tester.tapNext();
    await tester.pump();

    await expectLater(windowClosed, completes);
  });
}
