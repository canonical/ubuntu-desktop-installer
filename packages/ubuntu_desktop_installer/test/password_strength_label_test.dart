import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/utils/password.dart';
import 'package:ubuntu_desktop_installer/widgets/password_strength_label.dart';
import 'package:ubuntu_desktop_installer/widgets/theme.dart';

void main() {
  testWidgets('weak password', (tester) async {
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: Builder(builder: (context) {
        return PasswordStrengthLabel(strength: PasswordStrength.weak);
      }),
    ));

    final context = tester.element(find.byType(PasswordStrengthLabel));

    final text = AppLocalizations.of(context)!.weakPassword;
    expect(find.text(text), findsOneWidget);

    final widget = tester.widget<Text>(find.text(text));
    expect(widget.style?.color, isNotNull);
    expect(widget.style!.color, equals(Theme.of(context).errorColor));
  });

  testWidgets('moderate password', (tester) async {
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: Builder(builder: (context) {
        return PasswordStrengthLabel(strength: PasswordStrength.moderate);
      }),
    ));

    final context = tester.element(find.byType(PasswordStrengthLabel));
    final text = AppLocalizations.of(context)!.moderatePassword;
    expect(find.text(text), findsOneWidget);

    final widget = tester.widget<Text>(find.text(text));
    expect(widget.style?.color, isNull);
  });

  testWidgets('strong password', (tester) async {
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: Builder(builder: (context) {
        return PasswordStrengthLabel(strength: PasswordStrength.strong);
      }),
    ));

    final context = tester.element(find.byType(PasswordStrengthLabel));

    final text = AppLocalizations.of(context)!.strongPassword;
    expect(find.text(text), findsOneWidget);

    final widget = tester.widget<Text>(find.text(text));
    expect(widget.style?.color, isNotNull);
    expect(widget.style!.color, equals(Theme.of(context).successColor));
  });
}
