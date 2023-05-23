import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/secure_boot/secure_boot_model.dart';
import 'package:ubuntu_wizard/widgets.dart';
import 'package:yaru_test/yaru_test.dart';

import '../test_utils.dart';
import 'test_secure_boot.dart';

void main() {
  testWidgets('security key input', (tester) async {
    final model = buildSecureBootModel(
      secureBootMode: SecureBootMode.turnOff,
      securityKey: 'key',
      confirmKey: 'key',
      areTextFieldsEnabled: true,
    );
    await tester.pumpWidget(tester.buildApp((_) => buildSecureBootPage(model)));

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
    final model = buildSecureBootModel(areTextFieldsEnabled: false);
    await tester.pumpWidget(tester.buildApp((_) => buildSecureBootPage(model)));

    final fields = find.byType(ValidatedFormField);
    expect(fields, findsNWidgets(2));
    expect(fields.first, isDisabled);
    expect(fields.last, isDisabled);
  });

  testWidgets('empty security key', (tester) async {
    final model = buildSecureBootModel(securityKey: '');
    await tester.pumpWidget(tester.buildApp((_) => buildSecureBootPage(model)));

    expect(find.byType(SuccessIcon), findsNothing);
  });

  testWidgets('don\'t install', (tester) async {
    final model =
        buildSecureBootModel(secureBootMode: SecureBootMode.dontInstall);
    await tester.pumpWidget(tester.buildApp((_) => buildSecureBootPage(model)));

    expect(find.radio(SecureBootMode.turnOff), isNotChecked);
    expect(find.radio(SecureBootMode.dontInstall), isChecked);
  });

  testWidgets('valid input', (tester) async {
    final model = buildSecureBootModel(isFormValid: true);
    await tester.pumpWidget(tester.buildApp((_) => buildSecureBootPage(model)));

    expect(find.button(tester.ulang.nextLabel), isEnabled);
  });

  testWidgets('invalid input', (tester) async {
    final model = buildSecureBootModel(isFormValid: false);
    await tester.pumpWidget(tester.buildApp((_) => buildSecureBootPage(model)));

    expect(find.button(tester.ulang.nextLabel), isDisabled);
  });
}
