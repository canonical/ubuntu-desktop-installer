import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/main.dart' as app;
import 'package:ubuntu_desktop_installer/pages.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/utils.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async => await cleanUpSubiquity());
  tearDown(() async => await resetAllServices());

  testWidgets('who are you', (tester) async {
    await app.main(['--initial-route=/who-are-you']);
    await tester.pumpAndSettle();

    final context = tester.element(find.byType(WhoAreYouPage));
    final l10n = AppLocalizations.of(context);

    await expectLater(
      find.byType(WhoAreYouPage),
      matchesGoldenFile('screenshots/who-are-you-page.png'),
    );

    await expectLater(
      find.ancestor(
        of: find.text(l10n.whoAreYouPageUsernameLabel),
        matching: find.byType(TextField),
      ),
      matchesGoldenFile('screenshots/who-are-you-username.png'),
    );
  });
}
