library ubuntu_test;

import 'package:flutter_test/flutter_test.dart';
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
extension LangTester on WidgetTester {
  static late Type type;

  AppLocalizations get lang {
    final view = element(find.byType(type));
    return AppLocalizations.of(view);
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
