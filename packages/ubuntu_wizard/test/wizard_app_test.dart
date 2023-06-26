import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_localizations/ubuntu_localizations.dart';
import 'package:ubuntu_wizard/ubuntu_wizard.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

void main() {
  testWidgets('app structure', (tester) async {
    await tester.pumpWidget(const WizardApp(
      localizationsDelegates: UbuntuLocalizations.localizationsDelegates,
      supportedLocales: UbuntuLocalizations.supportedLocales,
      home: Text('home'),
    ));

    expect(find.byType(YaruTheme), findsOneWidget);
    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(YaruWindowTitleBar), findsOneWidget);
  });
}
