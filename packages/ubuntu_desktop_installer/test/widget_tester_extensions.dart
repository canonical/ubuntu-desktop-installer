import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_wizard/l10n.dart';
import 'package:ubuntu_wizard/widgets.dart';

/// An extension on [WidgetTester] that exposes a [lang] property.
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
///   Widget buildApp(WidgetTester tester) { [...] }
///
///   testWidgets('test description', (tester) async {
///     await tester.pumpWidget(buildApp(tester));
///
///     expect(find.text(tester.lang.someTranslatableString), findsOneWidget);
///   });
/// }
/// ```
///
/// If the tested widget is not in a [WizardPage], you can use the static
/// [LangTester.context] property to specify the appropriate context to use.
///
/// For example:
/// ```dart
/// void main() {
///   setUpAll(() => LangTester.context = MyWidget);
/// }
/// ```
extension LangTester on WidgetTester {
  static Type context = WizardPage;

  AppLocalizations get lang {
    final widget = element(find.byType(context).first);
    return AppLocalizations.of(widget);
  }

  UbuntuLocalizations get ulang {
    final view = element(find.byType(context).first);
    return UbuntuLocalizations.of(view);
  }
}
