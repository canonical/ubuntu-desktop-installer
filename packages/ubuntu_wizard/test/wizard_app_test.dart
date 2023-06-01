import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_localizations/ubuntu_localizations.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru/yaru.dart';

void main() {
  testWidgets('app structure', (tester) async {
    await tester.pumpWidget(WizardApp(
      appName: 'wizard_app_test',
      localizationsDelegates: UbuntuLocalizations.localizationsDelegates,
      supportedLocales: UbuntuLocalizations.supportedLocales,
      home: const Text('home'),
    ));

    expect(find.byType(InheritedLocale), findsOneWidget);
    expect(find.byType(Flavor), findsOneWidget);
    expect(find.byType(YaruTheme), findsOneWidget);
    expect(find.byType(MaterialApp), findsOneWidget);

    final widget = tester.widget<WizardApp>(find.byType(WizardApp));
    expect(widget.appName, equals('wizard_app_test'));
    expect(widget.flavor.name, equals('Ubuntu'));
  });
}
