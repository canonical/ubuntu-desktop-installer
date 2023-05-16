import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/secure_boot/secure_boot_model.dart';
import 'package:ubuntu_desktop_installer/pages/secure_boot/secure_boot_page.dart';
import 'package:ubuntu_test/ubuntu_test.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_test/yaru_test.dart';

import '../test_utils.dart';
import 'secure_boot_page_test.mocks.dart';

@GenerateMocks([SecureBootModel])
void main() {
  SecureBootModel buildModel({
    bool? isFormValid,
    bool? isConfirmationKeyValid,
    bool? areTextFieldsEnabled,
    String? securityKey,
    String? confirmKey,
    SecureBootMode? secureBootMode,
  }) {
    final model = MockSecureBootModel();
    when(model.isFormValid).thenReturn(isFormValid ?? false);
    when(model.isConfirmationKeyValid)
        .thenReturn(isConfirmationKeyValid ?? true);
    when(model.areTextFieldsEnabled).thenReturn(areTextFieldsEnabled ?? true);
    when(model.secureBootMode)
        .thenReturn(secureBootMode ?? SecureBootMode.turnOff);
    when(model.securityKey).thenReturn(securityKey ?? '');
    when(model.confirmKey).thenReturn(confirmKey ?? '');
    return model;
  }

  Widget buildPage(SecureBootModel model) {
    return ProviderScope(
      overrides: [secureBootModelProvider.overrideWith((_) => model)],
      child: const SecureBootPage(),
    );
  }

  testWidgets('security key input', (tester) async {
    final model = buildModel(
      secureBootMode: SecureBootMode.turnOff,
      securityKey: 'key',
      confirmKey: 'key',
      areTextFieldsEnabled: true,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final fields = find.widgetWithText(ValidatedFormField, 'key');
    expect(fields, findsNWidgets(2));
    expect(fields.first, isEnabled);
    expect(fields.last, isEnabled);

    expect(find.radio(SecureBootMode.turnOff), isChecked);
    expect(find.radio(SecureBootMode.dontInstall), isNotChecked);

    expect(find.byType(SuccessIcon), findsNWidgets(2));

    await tester.enterText(fields.first, 'ubuntu');
    verify(model.setSecurityKey('ubuntu')).called(1);

    await tester.enterText(fields.last, 'ubuntu');
    verify(model.setConfirmKey('ubuntu')).called(1);
  });

  testWidgets('disabled input fields', (tester) async {
    final model = buildModel(areTextFieldsEnabled: false);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final fields = find.byType(ValidatedFormField);
    expect(fields, findsNWidgets(2));
    expect(fields.first, isDisabled);
    expect(fields.last, isDisabled);
  });

  testWidgets('empty security key', (tester) async {
    final model = buildModel(securityKey: '');
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(find.byType(SuccessIcon), findsNothing);
  });

  testWidgets('don\'t install', (tester) async {
    final model = buildModel(secureBootMode: SecureBootMode.dontInstall);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(find.radio(SecureBootMode.turnOff), isNotChecked);
    expect(find.radio(SecureBootMode.dontInstall), isChecked);
  });

  testWidgets('valid input', (tester) async {
    final model = buildModel(isFormValid: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(find.button(find.nextLabel), isEnabled);
  });

  testWidgets('invalid input', (tester) async {
    final model = buildModel(isFormValid: false);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(find.button(find.nextLabel), isDisabled);
  });
}
