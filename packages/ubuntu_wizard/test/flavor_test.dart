import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_localizations/ubuntu_localizations.dart';
import 'package:ubuntu_wizard/widgets.dart';

void main() {
  testWidgets('data class', (tester) async {
    final flavor1 = FlavorData(
      name: 'Test Flavor 1',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
    );
    expect(flavor1, equals(flavor1));
    expect(flavor1.toString(), startsWith('FlavorData'));
    expect(flavor1.toString(), contains('Test Flavor 1'));

    final flavor2 = FlavorData(
      name: 'Test Flavor 2',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      localizationsDelegates: GlobalUbuntuLocalizations.delegates,
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
          localizationsDelegates: GlobalUbuntuLocalizations.delegates,
        ),
        child: Builder(builder: (_) => const MaterialApp()),
      ),
    );

    final context = tester.element(find.byType(MaterialApp));
    final flavor = Flavor.of(context);
    expect(flavor.name, equals('Test Flavor'));
    expect(flavor.theme, equals(ThemeData.light()));
    expect(flavor.darkTheme, equals(ThemeData.dark()));
    expect(flavor.localizationsDelegates,
        equals(GlobalUbuntuLocalizations.delegates));
  });

  testWidgets('copy flavor data', (tester) async {
    final flavor = FlavorData(
      name: 'Test Flavor',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
    );

    final copy = flavor.copyWith();
    expect(copy, equals(flavor));
    expect(copy.hashCode, equals(flavor.hashCode));

    final namedFlavor = flavor.copyWith(name: 'New Flavor');
    expect(namedFlavor, isNot(equals(flavor)));
    expect(namedFlavor.hashCode, isNot(equals(flavor.hashCode)));
    expect(namedFlavor.name, equals('New Flavor'));
    expect(namedFlavor.theme, equals(flavor.theme));
    expect(namedFlavor.darkTheme, equals(flavor.darkTheme));
    expect(namedFlavor.localizationsDelegates,
        equals(flavor.localizationsDelegates));

    final themedFlavor = flavor.copyWith(
      theme: flavor.darkTheme,
      darkTheme: flavor.theme,
    );
    expect(themedFlavor, isNot(equals(flavor)));
    expect(themedFlavor, isNot(equals(namedFlavor)));
    expect(themedFlavor.hashCode, isNot(equals(flavor.hashCode)));
    expect(themedFlavor.name, equals(flavor.name));
    expect(themedFlavor.theme, equals(flavor.darkTheme));
    expect(themedFlavor.darkTheme, equals(flavor.theme));
    expect(themedFlavor.localizationsDelegates,
        equals(flavor.localizationsDelegates));

    final localizedFlavor = flavor.copyWith(
      localizationsDelegates: GlobalUbuntuLocalizations.delegates,
    );
    expect(localizedFlavor, isNot(equals(flavor)));
    expect(localizedFlavor.hashCode, isNot(equals(flavor.hashCode)));
    expect(localizedFlavor, isNot(equals(namedFlavor)));
    expect(localizedFlavor, isNot(equals(themedFlavor)));
    expect(localizedFlavor.name, equals(flavor.name));
    expect(localizedFlavor.theme, equals(flavor.theme));
    expect(localizedFlavor.darkTheme, equals(flavor.darkTheme));
    expect(localizedFlavor.localizationsDelegates,
        equals(GlobalUbuntuLocalizations.delegates));
  });
}
