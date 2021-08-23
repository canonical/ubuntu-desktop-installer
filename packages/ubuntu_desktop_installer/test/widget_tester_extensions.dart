import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/widgets.dart';

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
    return AppLocalizations.of(view)!;
  }
}

/// An extension on [WidgetTester] that provides a [typeOf] method for finding
/// widgets by generic types.
///
/// [CommonFinders.byType] does not support generic types. The [typeOf] method
/// is a workaround for this.
///
/// ```dart
/// import 'widget_tester_extensions.dart';
///
/// void main() {
///   Widget buildApp(WidgetTester tester) { [...] }
///
///   testWidgets('test description', (tester) async {
///     await tester.pumpWidget(buildApp(tester));
///
///     expect(find.byTypeOf<Radio<int>>(), findsOneWidget);
///   });
/// }
/// ```
extension TypeOfFinder on CommonFinders {
  Finder byTypeOf<T>() => byType(_typeOf<T>());
}

Type _typeOf<T>() => T;
