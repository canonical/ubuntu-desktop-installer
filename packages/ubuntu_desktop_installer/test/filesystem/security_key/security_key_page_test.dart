import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/filesystem/security_key/security_key_model.dart';
import 'package:ubuntu_desktop_installer/pages/filesystem/security_key/security_key_page.dart';
import 'package:ubuntu_test/ubuntu_test.dart';
import 'package:yaru_test/yaru_test.dart';

import '../../test_utils.dart';
import 'security_key_page_test.mocks.dart';

@GenerateMocks([SecurityKeyModel])
void main() {
  SecurityKeyModel buildModel({
    bool? isValid,
    String? securityKey,
    String? confirmedSecurityKey,
    bool? showSecurityKey,
  }) {
    final model = MockSecurityKeyModel();
    when(model.isValid).thenReturn(isValid ?? false);
    when(model.securityKey).thenReturn(securityKey ?? '');
    when(model.confirmedSecurityKey).thenReturn(confirmedSecurityKey ?? '');
    when(model.showSecurityKey).thenReturn(showSecurityKey ?? false);
    return model;
  }

  Widget buildPage(SecurityKeyModel model) {
    return ProviderScope(
      overrides: [securityKeyModelProvider.overrideWith((_) => model)],
      child: const SecurityKeyPage(),
    );
  }

  testWidgets('security key input', (tester) async {
    final model = buildModel(securityKey: 'foo');
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final textField = find.textField('foo');
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'bar');
    verify(model.securityKey = 'bar').called(1);
  });

  testWidgets('security key confirmation', (tester) async {
    final model = buildModel(securityKey: 'foo', confirmedSecurityKey: 'foo');
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final textFields = find.textField('foo');
    expect(textFields, findsNWidgets(2));
    await tester.enterText(textFields.first, 'bar');
    verify(model.securityKey = 'bar').called(1);
    await tester.enterText(textFields.last, 'bar');
    verify(model.confirmedSecurityKey = 'bar').called(1);
  });

  testWidgets('valid input', (tester) async {
    final model = buildModel(isValid: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(find.button(find.nextLabel), isEnabled);
  });

  testWidgets('invalid input', (tester) async {
    final model = buildModel(isValid: false);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(find.button(find.nextLabel), isDisabled);
  });

  testWidgets('show security key', (tester) async {
    final model = buildModel(showSecurityKey: false);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final showSecurityKeyButton =
        find.checkButton(find.al10n((l10n) => l10n.showSecurityKey));
    expect(showSecurityKeyButton, findsOneWidget);

    await tester.tap(showSecurityKeyButton);
    verify(model.showSecurityKey = true).called(1);
  });

  testWidgets('save security key', (tester) async {
    final model = buildModel(isValid: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    await tester.tapNext();
    verify(model.saveSecurityKey()).called(1);
  });
}
