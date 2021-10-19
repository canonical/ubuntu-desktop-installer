import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages/configure_secure_boot/configure_secure_boot_model.dart';
import 'package:ubuntu_desktop_installer/pages/configure_secure_boot/configure_secure_boot_page.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';

import 'configure_secure_boot_page_test.mocks.dart';
import 'widget_tester_extensions.dart';

@GenerateMocks([ConfigureSecureBootModel])
void main() {
  ConfigureSecureBootModel buildModel({
    bool? isFormValid,
    bool? isConfirmationKeyValid,
    bool? areTextFieldsEnabled,
    String? securityKey,
    String? confirmKey,
    SecureBootMode? secureBootMode,
  }) {
    final model = MockConfigureSecureBootModel();
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

  Widget buildPage(ConfigureSecureBootModel model) {
    return ChangeNotifierProvider<ConfigureSecureBootModel>.value(
      value: model,
      child: ConfigureSecureBootPage(),
    );
  }

  Widget buildApp(WidgetTester tester, ConfigureSecureBootModel model) {
    tester.binding.window.devicePixelRatioTestValue = 1;
    tester.binding.window.physicalSizeTestValue = Size(960, 680);
    return MaterialApp(
      localizationsDelegates: localizationsDelegates,
      home: Wizard(
        routes: {'/': (_) => buildPage(model)},
        onNext: (settings) => '/',
      ),
    );
  }

  testWidgets('security key input', (tester) async {
    final model = buildModel(
      secureBootMode: SecureBootMode.turnOff,
      securityKey: 'key',
      confirmKey: 'key',
      areTextFieldsEnabled: true,
    );
    await tester.pumpWidget(buildApp(tester, model));

    final fields = find.widgetWithText(ValidatedFormField, 'key');
    expect(fields, findsNWidgets(2));
    expect(tester.widget<ValidatedFormField>(fields.first).enabled, isTrue);
    expect(tester.widget<ValidatedFormField>(fields.last).enabled, isTrue);

    final radios = find.byTypeOf<RadioButton<SecureBootMode>>();
    expect(radios, findsNWidgets(2));
    expect(tester.widget<RadioButton<SecureBootMode>>(radios.first).groupValue,
        equals(SecureBootMode.turnOff));
    expect(tester.widget<RadioButton<SecureBootMode>>(radios.first).groupValue,
        equals(SecureBootMode.turnOff));

    expect(find.byType(SuccessIcon), findsNWidgets(2));

    await tester.enterText(fields.first, 'ubuntu');
    verify(model.setSecurityKey('ubuntu')).called(1);

    await tester.enterText(fields.last, 'ubuntu');
    verify(model.setConfirmKey('ubuntu')).called(1);
  });

  testWidgets('disabled input fields', (tester) async {
    final model = buildModel(areTextFieldsEnabled: false);
    await tester.pumpWidget(buildApp(tester, model));

    final fields = find.byType(ValidatedFormField);
    expect(fields, findsNWidgets(2));
    expect(tester.widget<ValidatedFormField>(fields.first).enabled, isFalse);
    expect(tester.widget<ValidatedFormField>(fields.last).enabled, isFalse);
  });

  testWidgets('empty security key', (tester) async {
    final model = buildModel(securityKey: '');
    await tester.pumpWidget(buildApp(tester, model));

    expect(find.byType(SuccessIcon), findsNothing);
  });

  testWidgets('don\'t install', (tester) async {
    final model = buildModel(secureBootMode: SecureBootMode.dontInstall);
    await tester.pumpWidget(buildApp(tester, model));

    final radios = find.byTypeOf<RadioButton<SecureBootMode>>();
    expect(radios, findsNWidgets(2));
    expect(tester.widget<RadioButton<SecureBootMode>>(radios.first).groupValue,
        equals(SecureBootMode.dontInstall));
    expect(tester.widget<RadioButton<SecureBootMode>>(radios.first).groupValue,
        equals(SecureBootMode.dontInstall));
  });

  testWidgets('valid input', (tester) async {
    final model = buildModel(isFormValid: true);
    await tester.pumpWidget(buildApp(tester, model));

    final continueButton = find.widgetWithText(
      OutlinedButton,
      tester.ulang.continueAction,
    );
    expect(tester.widget<OutlinedButton>(continueButton).enabled, isTrue);
  });

  testWidgets('invalid input', (tester) async {
    final model = buildModel(isFormValid: false);
    await tester.pumpWidget(buildApp(tester, model));

    final continueButton = find.widgetWithText(
      OutlinedButton,
      tester.ulang.continueAction,
    );
    expect(tester.widget<OutlinedButton>(continueButton).enabled, isFalse);
  });
}
