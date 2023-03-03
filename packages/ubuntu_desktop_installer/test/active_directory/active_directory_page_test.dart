import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages/active_directory/active_directory_l10n.dart';
import 'package:ubuntu_desktop_installer/pages/active_directory/active_directory_model.dart';
import 'package:ubuntu_desktop_installer/pages/active_directory/active_directory_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/mocks.dart';

import '../test_utils.dart';
import 'active_directory_page_test.mocks.dart';

final domainNameValidationVariant = ValueVariant(
    AdDomainNameValidation.values.toSet()
      ..remove(AdDomainNameValidation.REALM_NOT_FOUND));
final adminNameValidationVariant =
    ValueVariant(AdAdminNameValidation.values.toSet());
final passwordValidationVariant =
    ValueVariant(AdPasswordValidation.values.toSet());

@GenerateMocks([ActiveDirectoryModel])
void main() {
  ActiveDirectoryModel buildModel({
    bool? isValid,
    String? domainName,
    String? adminName,
    String? password,
    List<AdDomainNameValidation>? domainNameValidation,
    AdAdminNameValidation? adminNameValidation,
    AdPasswordValidation? passwordValidation,
  }) {
    final model = MockActiveDirectoryModel();
    when(model.isValid).thenReturn(isValid ?? false);
    when(model.domainName).thenReturn(domainName ?? '');
    when(model.adminName).thenReturn(adminName ?? '');
    when(model.password).thenReturn(password ?? '');
    when(model.domainNameValidation)
        .thenReturn(domainNameValidation ?? [AdDomainNameValidation.OK]);
    when(model.adminNameValidation)
        .thenReturn(adminNameValidation ?? AdAdminNameValidation.OK);
    when(model.passwordValidation)
        .thenReturn(passwordValidation ?? AdPasswordValidation.OK);
    return model;
  }

  Widget buildPage(ActiveDirectoryModel model) {
    return ChangeNotifierProvider<ActiveDirectoryModel>.value(
      value: model,
      child: const ActiveDirectoryPage(),
    );
  }

  testWidgets('init AD connection info', (tester) async {
    final model = buildModel(
      domainName: 'ubuntu.com',
      adminName: 'admin',
      password: 'password',
    );
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    verify(model.init()).called(1);
    expect(find.widgetWithText(TextField, 'ubuntu.com'), findsOneWidget);
    expect(find.widgetWithText(TextField, 'admin'), findsOneWidget);
    expect(find.widgetWithText(TextField, 'password'), findsOneWidget);
  });

  testWidgets('domain name input', (tester) async {
    final validation = domainNameValidationVariant.currentValue!;
    final model = buildModel(
      domainName: 'ubuntu.com',
      domainNameValidation: [validation],
    );

    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));
    final error = validation.localize(tester.lang);
    if (error.isNotEmpty) {
      expect(find.text(error), findsNothing);
    }

    final textField = find.widgetWithText(TextField, 'ubuntu.com');
    expect(textField, findsOneWidget);

    await tester.enterText(textField, '...');
    verify(model.setDomainName('...')).called(1);

    await tester.pump();
    if (error.isNotEmpty) {
      expect(find.text(error), findsOneWidget);
    }
  }, variant: domainNameValidationVariant);

  testWidgets('admin name input', (tester) async {
    final validation = adminNameValidationVariant.currentValue!;
    final model =
        buildModel(adminName: 'admin', adminNameValidation: validation);

    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));
    final error = validation.localize(tester.lang);
    if (error.isNotEmpty) {
      expect(find.text(validation.localize(tester.lang)), findsNothing);
    }

    final textField = find.widgetWithText(TextField, 'admin');
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'ubuntu');
    verify(model.setAdminName('ubuntu')).called(1);

    await tester.pump();
    if (error.isNotEmpty) {
      expect(find.text(error), findsOneWidget);
    }
  }, variant: adminNameValidationVariant);

  testWidgets('password input', (tester) async {
    final validation = passwordValidationVariant.currentValue!;
    final model =
        buildModel(password: 'password', passwordValidation: validation);

    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));
    final error = validation.localize(tester.lang);
    if (error.isNotEmpty) {
      expect(find.text(error), findsNothing);
    }

    await tester.enterText(
        find.widgetWithText(TextField, 'password'), 'ubuntu');
    verify(model.setPassword('ubuntu')).called(1);

    await tester.pump();
    if (error.isNotEmpty) {
      expect(find.text(error), findsOneWidget);
    }
  }, variant: passwordValidationVariant);

  testWidgets('valid input', (tester) async {
    final model = buildModel(isValid: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final continueButton = find.widgetWithText(
      FilledButton,
      tester.ulang.continueAction,
    );
    expect(tester.widget<ButtonStyleButton>(continueButton).enabled, isTrue);
  });

  testWidgets('invalid input', (tester) async {
    final model = buildModel(isValid: false);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final continueButton = find.widgetWithText(
      FilledButton,
      tester.ulang.continueAction,
    );
    expect(tester.widget<ButtonStyleButton>(continueButton).enabled, isFalse);
  });

  testWidgets('save AD connection info', (tester) async {
    final model = buildModel(isValid: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final continueButton = find.widgetWithText(
      FilledButton,
      tester.ulang.continueAction,
    );
    expect(continueButton, findsOneWidget);

    await tester.tap(continueButton);
    verify(model.save()).called(1);
  });

  testWidgets('creates a model', (tester) async {
    final client = MockSubiquityClient();
    when(client.getActiveDirectory())
        .thenAnswer((_) async => const ADConnectionInfo());
    when(client.checkActiveDirectoryDomainName(any))
        .thenAnswer((_) async => [AdDomainNameValidation.OK]);
    when(client.checkActiveDirectoryAdminName(any))
        .thenAnswer((_) async => AdAdminNameValidation.OK);
    when(client.checkActiveDirectoryPassword(any))
        .thenAnswer((_) async => AdPasswordValidation.OK);
    registerMockService<SubiquityClient>(client);

    await tester.pumpWidget(tester.buildApp(ActiveDirectoryPage.create));

    final page = find.byType(ActiveDirectoryPage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    expect(context.read<ActiveDirectoryModel>, returnsNormally);
  });
}
