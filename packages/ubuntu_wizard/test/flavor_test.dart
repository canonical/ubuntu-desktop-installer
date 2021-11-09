import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_wizard/widgets.dart';

void main() {
  testWidgets('data class', (tester) async {
    final flavor1 = FlavorData(
      name: 'Test Flavor 1',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      package: 'test_package_1',
    );
    expect(flavor1, equals(flavor1));
    expect(flavor1.toString(), startsWith('FlavorData'));
    expect(flavor1.toString(), contains('Test Flavor 1'));
    expect(flavor1.toString(), contains('test_package_1'));

    final flavor2 = FlavorData(
      name: 'Test Flavor 2',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      package: 'test_package_2',
    );
    expect(flavor2, isNot(equals(flavor1)));
  });

  testWidgets('access flavor data', (tester) async {
    await tester.pumpWidget(
      Flavor(
        data: FlavorData(
          name: 'Test Flavor',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          package: 'test_package',
        ),
        child: Builder(builder: (_) => MaterialApp()),
      ),
    );

    final context = tester.element(find.byType(MaterialApp));
    final flavor = Flavor.of(context);
    expect(flavor.name, equals('Test Flavor'));
    expect(flavor.theme, equals(ThemeData.light()));
    expect(flavor.darkTheme, equals(ThemeData.dark()));
    expect(flavor.package, equals('test_package'));
  });

  testWidgets('copy flavor data', (tester) async {
    final flavor = FlavorData(
      name: 'Test Flavor',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      package: 'test_package',
    );

    final namedFlavor = flavor.copyWith(name: 'New Flavor');
    expect(namedFlavor, isNot(equals(flavor)));
    expect(namedFlavor.name, equals('New Flavor'));
    expect(namedFlavor.theme, equals(flavor.theme));
    expect(namedFlavor.darkTheme, equals(flavor.darkTheme));
    expect(namedFlavor.package, equals(flavor.package));

    final themedFlavor = flavor.copyWith(
      theme: flavor.darkTheme,
      darkTheme: flavor.theme,
    );
    expect(themedFlavor, isNot(equals(flavor)));
    expect(themedFlavor, isNot(equals(namedFlavor)));
    expect(themedFlavor.name, equals(flavor.name));
    expect(themedFlavor.theme, equals(flavor.darkTheme));
    expect(themedFlavor.darkTheme, equals(flavor.theme));
    expect(themedFlavor.package, equals(flavor.package));
  });
}
