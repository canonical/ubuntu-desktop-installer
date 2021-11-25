import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/pages/configure_active_directory/configure_active_directory_model.dart';
import 'package:ubuntu_desktop_installer/pages/configure_active_directory/configure_active_directory_page.dart';

import 'configure_active_directory_page_test.mocks.dart';
import 'widget_tester_extensions.dart';

@GenerateMocks([ConfigureActiveDirectoryModel])
void main() {
  ConfigureActiveDirectoryModel buildModel({
    bool? isValid,
    String? domain,
    String? admin,
    String? password,
  }) {
    final model = MockConfigureActiveDirectoryModel();
    when(model.isValid).thenReturn(isValid ?? false);
    when(model.domain).thenReturn(domain ?? '');
    when(model.admin).thenReturn(admin ?? '');
    when(model.password).thenReturn(password ?? '');
    return model;
  }

  Widget buildPage(ConfigureActiveDirectoryModel model) {
    return ChangeNotifierProvider<ConfigureActiveDirectoryModel>.value(
      value: model,
      child: ConfigureActiveDirectoryPage(),
    );
  }

  testWidgets('load and save credentials', (tester) async {
    final model = buildModel(isValid: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    verify(model.load()).called(1);

    final continueButton = find.widgetWithText(
      OutlinedButton,
      tester.ulang.continueAction,
    );
    expect(continueButton, findsOneWidget);

    await tester.tap(continueButton);
    verify(model.save()).called(1);
  });

  testWidgets('domain input', (tester) async {
    final model = buildModel(domain: 'domain');
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final textField = find.widgetWithText(TextField, 'domain');
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'ubuntu');
    verify(model.domain = 'ubuntu').called(1);
  });

  testWidgets('admin input', (tester) async {
    final model = buildModel(admin: 'admin');
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final textField = find.widgetWithText(TextField, 'admin');
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'ubuntu');
    verify(model.admin = 'ubuntu').called(1);
  });

  testWidgets('password input', (tester) async {
    final model = buildModel(password: 'password');
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final textField = find.widgetWithText(TextField, 'password');
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'ubuntu');
    verify(model.password = 'ubuntu').called(1);
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

  testWidgets('test connection', (tester) async {
    final model = buildModel(isValid: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final testButton = find.widgetWithText(
      OutlinedButton,
      tester.lang.configureActiveDirectoryTestConnection,
    );
    expect(testButton, findsOneWidget);

    await tester.tap(testButton);
    verify(model.testConnection()).called(1);
  });

  testWidgets('creates a model', (tester) async {
    await tester.pumpWidget(
      tester.buildApp(ConfigureActiveDirectoryPage.create),
    );

    final page = find.byType(ConfigureActiveDirectoryPage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model =
        Provider.of<ConfigureActiveDirectoryModel>(context, listen: false);
    expect(model, isNotNull);
  });
}
