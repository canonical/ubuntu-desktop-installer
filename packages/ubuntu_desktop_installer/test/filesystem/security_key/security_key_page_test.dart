import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/pages/filesystem/security_key/security_key_model.dart';
import 'package:ubuntu_desktop_installer/pages/filesystem/security_key/security_key_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/utils.dart';

import '../../test_utils.dart';
import 'security_key_model_test.mocks.dart';
import 'security_key_page_test.mocks.dart';

// ignore_for_file: type=lint

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
    return ChangeNotifierProvider<SecurityKeyModel>.value(
      value: model,
      child: SecurityKeyPage(),
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

    expect(find.button(tester.ulang.nextLabel), isEnabled);
  });

  testWidgets('invalid input', (tester) async {
    final model = buildModel(isValid: false);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(find.button(tester.ulang.nextLabel), isDisabled);
  });

  testWidgets('show security key', (tester) async {
    final model = buildModel(showSecurityKey: false);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final showSecurityKeyButton = find.checkButton(tester.lang.showSecurityKey);
    expect(showSecurityKeyButton, findsOneWidget);

    await tester.tap(showSecurityKeyButton);
    verify(model.showSecurityKey = true).called(1);
  });

  testWidgets('save security key', (tester) async {
    final model = buildModel(isValid: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final nextButton = find.button(tester.ulang.nextLabel);
    expect(nextButton, findsOneWidget);

    await tester.tap(nextButton);
    verify(model.saveSecurityKey()).called(1);
  });

  testWidgets('creates a model', (tester) async {
    final service = MockDiskStorageService();
    when(service.securityKey).thenReturn(null);
    registerMockService<DiskStorageService>(service);

    await tester.pumpWidget(tester.buildApp(SecurityKeyPage.create));

    final page = find.byType(SecurityKeyPage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model = Provider.of<SecurityKeyModel>(context, listen: false);
    expect(model, isNotNull);
  });
}
