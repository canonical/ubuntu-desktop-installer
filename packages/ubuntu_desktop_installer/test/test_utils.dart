import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_test/ubuntu_test.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru/yaru.dart';

/// An extension on [WidgetTester] for building test apps.
///
/// The additional [lang] property returns the [AppLocalizations] instance
/// associated with the current [WizardPage], for easy access to the
/// application's translated strings.
///
/// Use like so when writing tests:
/// ```dart
/// import 'widget_tester_extensions.dart';
///
/// void main() {
///   Widget buildPage(WidgetTester tester) { [...] }
///
///   testWidgets('test description', (tester) async {
///     await tester.pumpWidget(tester.buildApp((_) => buildPage(tester)));
///
///     expect(find.text(tester.lang.someTranslatableString), findsOneWidget);
///   });
/// }
/// ```
///
/// If the tested widget is not in a [WizardPage], you can use the static
/// [UbuntuTester.context] property to specify the appropriate context to use.
///
/// For example:
/// ```dart
/// void main() {
///   setUpAll(() => LangTester.context = MyWidget);
/// }
/// ```
extension UbuntuTester on WidgetTester {
  // AppLocalizations get lang => AppLocalizationsEn();

  Widget buildApp(WidgetBuilder builder) {
    view.devicePixelRatio = 1;
    view.physicalSize = const Size(960, 680);
    return InheritedLocale(
      child: Flavor(
        data: const FlavorData(name: 'Ubuntu'),
        child: MaterialApp(
          localizationsDelegates: localizationsDelegates,
          theme: yaruLight,
          home: Wizard(
            routes: {
              '/': WizardRoute(
                builder: builder,
                onNext: (settings) => '/next',
              ),
              '/next': WizardRoute(
                builder: (_) => const Text('Next page'),
              ),
            },
          ),
        ),
      ),
    );
  }
}

extension CommonFindersX on CommonFinders {
  Finder al10n(L10nFinder<AppLocalizations> tr) => l10n<AppLocalizations>(tr);
}
