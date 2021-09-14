import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/widgets.dart';
import 'package:ubuntu_wizard/l10n.dart';

/// An extension on [WidgetTester] that exposes a [lang] property.
///
/// The additional [lang] property returns the [AppLocalizations] instance
/// associated with the current [LocalizedView], for easy access to the
/// application's translated strings.
///
/// Use like so when writing tests:
/// ```dart
/// import 'widget_tester_extensions.dart';
///
/// void main() {
///   Widget buildApp(WidgetTester tester) { [...] }
///
///   testWidgets('test description', (tester) async {
///     await tester.pumpWidget(buildApp(tester));
///
///     expect(find.text(tester.lang.someTranslatableString), findsOneWidget);
///   });
/// }
/// ```
extension LangTester on WidgetTester {
  AppLocalizations get lang {
    final view = element(find.byType(LocalizedView).first);
    return AppLocalizations.of(view);
  }

  UbuntuLocalizations get ulang {
    final view = element(find.byType(LocalizedView).first);
    return UbuntuLocalizations.of(view);
  }
}
