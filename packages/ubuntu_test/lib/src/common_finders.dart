import 'package:flutter_test/flutter_test.dart';

/// An extension on [CommonFinders] that provides a [byTypeOf] method for
/// finding widgets by generic types.
///
/// [CommonFinders.byType] does not support generic types. The [byTypeOf] method
/// is a workaround for this.
///
/// ```dart
/// import 'package:ubuntu_test/ubuntu_test.dart';
///
/// void main() {
///   testWidgets('test description', (tester) async {
///     await tester.pumpWidget(...);
///
///     expect(find.byTypeOf<Radio<int>>(), findsOneWidget);
///   });
/// }
/// ```
extension TypeOfFinder on CommonFinders {
  /// Matches widgets by generic type `T`.
  Finder byTypeOf<T>() => byType(typeOf<T>());
}

/// Returns the type of generic type `T`.
Type typeOf<T>() => T;
