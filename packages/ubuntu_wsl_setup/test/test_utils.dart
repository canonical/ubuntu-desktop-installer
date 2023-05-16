import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_test/ubuntu_test.dart';
import 'package:ubuntu_wsl_setup/l10n.dart';

/// An extension on [WidgetTester] that exposes a [lang] property.
///
/// The additional [lang] property returns the [AppLocalizations] instance
/// associated with the current page context which must be initialized before
/// accessing translated strings.
///
/// Use like so when writing tests:
/// ```dart
/// import 'widget_tester_extensions.dart';
///
/// void main() {
///   LangTester.type = SelectLanguagePage;
///
///   Widget buildApp(WidgetTester tester) { [...] }
///
///   testWidgets('test description', (tester) async {
///     await tester.pumpWidget(buildApp(tester));
///
///     expect(find.text(tester.lang.someTranslatableString), findsOneWidget);
///   });
/// }
/// ```
extension AppLocalizationsFinders on CommonFinders {
  Finder al10n(L10nFinder<AppLocalizations> f) => l10n<AppLocalizations>(f);
}
