import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_bootstrap/l10n.dart';
import 'package:ubuntu_bootstrap/pages/storage/security_key/security_key_model.dart';
import 'package:ubuntu_bootstrap/pages/storage/security_key/security_key_page.dart';
import 'package:ubuntu_test/ubuntu_test.dart';
import 'package:yaru_test/yaru_test.dart';

import 'test_security_key.dart';

void main() {
  Widget buildPage(SecurityKeyModel model) {
    return ProviderScope(
      overrides: [securityKeyModelProvider.overrideWith((_) => model)],
      child: const SecurityKeyPage(),
    );
  }

  testWidgets('security key input', (tester) async {
    final model = buildSecurityKeyModel(securityKey: 'foo');
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final textField = find.textField('foo');
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'bar');
    verify(model.securityKey = 'bar').called(1);
  });

  testWidgets('security key confirmation', (tester) async {
    final model =
        buildSecurityKeyModel(securityKey: 'foo', confirmedSecurityKey: 'foo');
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final textFields = find.textField('foo');
    expect(textFields, findsNWidgets(2));
    await tester.enterText(textFields.first, 'bar');
    verify(model.securityKey = 'bar').called(1);
    await tester.enterText(textFields.last, 'bar');
    verify(model.confirmedSecurityKey = 'bar').called(1);
  });

  testWidgets('valid input', (tester) async {
    final model = buildSecurityKeyModel(isValid: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(find.button(find.nextLabel), isEnabled);
  });

  testWidgets('invalid input', (tester) async {
    final model = buildSecurityKeyModel(isValid: false);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(find.button(find.nextLabel), isDisabled);
  });

  testWidgets('show security key', (tester) async {
    final model = buildSecurityKeyModel(showSecurityKey: false);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final context = tester.element(find.byType(SecurityKeyPage));
    final l10n = AppLocalizations.of(context);

    final showSecurityKeyButton = find.checkButton(l10n.showSecurityKey);
    expect(showSecurityKeyButton, findsOneWidget);

    await tester.tap(showSecurityKeyButton);
    verify(model.showSecurityKey = true).called(1);
  });

  testWidgets('save security key', (tester) async {
    final model = buildSecurityKeyModel(isValid: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    await tester.tapNext();
    verify(model.saveSecurityKey()).called(1);
  });
}
