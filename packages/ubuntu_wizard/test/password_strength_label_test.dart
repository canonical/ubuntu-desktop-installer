import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_localizations/ubuntu_localizations.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru/yaru.dart';

void main() {
  testWidgets('weak password', (tester) async {
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: UbuntuLocalizations.localizationsDelegates,
      home: Builder(builder: (context) {
        return const PasswordStrengthLabel(strength: PasswordStrength.weak);
      }),
    ));

    final context = tester.element(find.byType(PasswordStrengthLabel));

    final text = UbuntuLocalizations.of(context).weakPassword;
    expect(find.text(text), findsOneWidget);

    final widget = tester.widget<Text>(find.text(text));
    expect(widget.style?.color, isNotNull);
    expect(widget.style!.color, equals(Theme.of(context).colorScheme.error));
  });

  testWidgets('fair password', (tester) async {
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: UbuntuLocalizations.localizationsDelegates,
      home: Builder(builder: (context) {
        return const PasswordStrengthLabel(strength: PasswordStrength.fair);
      }),
    ));

    final context = tester.element(find.byType(PasswordStrengthLabel));
    final text = UbuntuLocalizations.of(context).fairPassword;
    expect(find.text(text), findsOneWidget);

    final widget = tester.widget<Text>(find.text(text));
    expect(widget.style?.color, isNull);
  });

  testWidgets('good password', (tester) async {
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: UbuntuLocalizations.localizationsDelegates,
      home: Builder(builder: (context) {
        return const PasswordStrengthLabel(strength: PasswordStrength.good);
      }),
    ));

    final context = tester.element(find.byType(PasswordStrengthLabel));
    final text = UbuntuLocalizations.of(context).goodPassword;
    expect(find.text(text), findsOneWidget);

    final widget = tester.widget<Text>(find.text(text));
    expect(widget.style?.color, isNull);
  });

  testWidgets('strong password', (tester) async {
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: UbuntuLocalizations.localizationsDelegates,
      home: Builder(builder: (context) {
        return const PasswordStrengthLabel(strength: PasswordStrength.strong);
      }),
    ));

    final context = tester.element(find.byType(PasswordStrengthLabel));

    final text = UbuntuLocalizations.of(context).strongPassword;
    expect(find.text(text), findsOneWidget);

    final widget = tester.widget<Text>(find.text(text));
    expect(widget.style?.color, isNotNull);
    expect(widget.style!.color, equals(Theme.of(context).successColor));
  });
}
