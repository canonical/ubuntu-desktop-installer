import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/pages/choose_security_key/choose_security_key_model.dart';
import 'package:ubuntu_desktop_installer/pages/choose_security_key/choose_security_key_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import '../test_utils.dart';
import 'choose_security_key_model_test.mocks.dart';
import 'choose_security_key_page_test.mocks.dart';

// ignore_for_file: type=lint

@GenerateMocks([ChooseSecurityKeyModel])
void main() {
  ChooseSecurityKeyModel buildModel({
    bool? isValid,
    String? securityKey,
    String? confirmedSecurityKey,
    bool? showSecurityKey,
  }) {
    final model = MockChooseSecurityKeyModel();
    when(model.isValid).thenReturn(isValid ?? false);
    when(model.securityKey).thenReturn(securityKey ?? '');
    when(model.confirmedSecurityKey).thenReturn(confirmedSecurityKey ?? '');
    when(model.showSecurityKey).thenReturn(showSecurityKey ?? false);
    return model;
  }

  Widget buildPage(ChooseSecurityKeyModel model) {
    return ChangeNotifierProvider<ChooseSecurityKeyModel>.value(
      value: model,
      child: ChooseSecurityKeyPage(),
    );
  }

  testWidgets('security key input', (tester) async {
    final model = buildModel(securityKey: 'foo');
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final textField = find.widgetWithText(TextField, 'foo');
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'bar');
    verify(model.securityKey = 'bar').called(1);
  });

  testWidgets('security key confirmation', (tester) async {
    final model = buildModel(securityKey: 'foo', confirmedSecurityKey: 'foo');
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final textFields = find.widgetWithText(TextField, 'foo');
    expect(textFields, findsNWidgets(2));
    await tester.enterText(textFields.first, 'bar');
    verify(model.securityKey = 'bar').called(1);
    await tester.enterText(textFields.last, 'bar');
    verify(model.confirmedSecurityKey = 'bar').called(1);
  });

  testWidgets('valid input', (tester) async {
    final model = buildModel(isValid: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final continueButton = find.widgetWithText(
      OutlinedButton,
      tester.ulang.continueAction,
    );
    expect(tester.widget<OutlinedButton>(continueButton).enabled, isTrue);
  });

  testWidgets('invalid input', (tester) async {
    final model = buildModel(isValid: false);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final continueButton = find.widgetWithText(
      OutlinedButton,
      tester.ulang.continueAction,
    );
    expect(tester.widget<OutlinedButton>(continueButton).enabled, isFalse);
  });

  testWidgets('show security key', (tester) async {
    final model = buildModel(showSecurityKey: false);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final showSecurityKeyButton =
        find.widgetWithText(YaruCheckButton, tester.lang.showSecurityKey);
    expect(showSecurityKeyButton, findsOneWidget);

    await tester.tap(showSecurityKeyButton);
    verify(model.showSecurityKey = true).called(1);
  });

  testWidgets('save security key', (tester) async {
    final model = buildModel(isValid: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final continueButton = find.widgetWithText(
      OutlinedButton,
      tester.ulang.continueAction,
    );
    expect(continueButton, findsOneWidget);

    await tester.tap(continueButton);
    verify(model.saveSecurityKey()).called(1);
  });

  testWidgets('creates a model', (tester) async {
    final service = MockDiskStorageService();
    when(service.securityKey).thenReturn(null);
    registerMockService<DiskStorageService>(service);

    await tester.pumpWidget(tester.buildApp(ChooseSecurityKeyPage.create));

    final page = find.byType(ChooseSecurityKeyPage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model = Provider.of<ChooseSecurityKeyModel>(context, listen: false);
    expect(model, isNotNull);
  });
}
