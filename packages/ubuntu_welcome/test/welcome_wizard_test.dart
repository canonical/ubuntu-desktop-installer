import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages.dart';
import 'package:ubuntu_desktop_installer/pages/identity/identity_model.dart';
import 'package:ubuntu_provision/ubuntu_provision.dart';
import 'package:ubuntu_test/ubuntu_test.dart';
import 'package:ubuntu_welcome/l10n.dart';
import 'package:ubuntu_welcome/welcome_wizard.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';
import 'package:yaru_test/yaru_test.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

// TODO: move to shared packages
import '../../ubuntu_desktop_installer/test/identity/test_identity.dart';
import '../../ubuntu_provision/test/keyboard/test_keyboard.dart';
import '../../ubuntu_provision/test/locale/test_locale.dart';
import '../../ubuntu_provision/test/timezone/test_timezone.dart';

void main() {
  LiveTestWidgetsFlutterBinding.ensureInitialized();

  setUp(() => YaruTestWindow.ensureInitialized(state: const YaruWindowState()));

  testWidgets('welcome', (tester) async {
    final localeModel = buildLocaleModel();
    final keyboardModel = buildKeyboardModel();
    final timezoneModel = buildTimezoneModel();
    final identityModel = buildIdentityModel(isValid: true);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          localeModelProvider.overrideWith((_) => localeModel),
          keyboardModelProvider.overrideWith((_) => keyboardModel),
          timezoneModelProvider.overrideWith((_) => timezoneModel),
          identityModelProvider.overrideWith((_) => identityModel),
        ],
        child: tester.buildTestWizard(),
      ),
    );

    await tester.pump(const Duration(seconds: 1));

    await tester.pumpAndSettle();
    expect(find.byType(LocalePage), findsOneWidget);

    await tester.tapNext();
    await tester.pumpAndSettle();
    expect(find.byType(KeyboardPage), findsOneWidget);
    verify(keyboardModel.init()).called(1);

    await tester.tapNext();
    await tester.pumpAndSettle();
    expect(find.byType(TimezonePage), findsOneWidget);
    verify(timezoneModel.init()).called(1);

    await tester.tapNext();
    await tester.pumpAndSettle();
    expect(find.byType(IdentityPage), findsOneWidget);
    verify(identityModel.init()).called(1);

    final windowClosed = YaruTestWindow.waitForClosed();

    await tester.tapDone();
    await tester.pumpAndSettle();

    await expectLater(windowClosed, completes);
  });
}

extension on WidgetTester {
  Widget buildTestWizard() {
    return WizardApp(
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      home: const WelcomeWizard(),
    );
  }
}
