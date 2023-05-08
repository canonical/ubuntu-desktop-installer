import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages/active_directory/active_directory_dialogs.dart';
import 'package:ubuntu_desktop_installer/pages/active_directory/active_directory_l10n.dart';
import 'package:ubuntu_desktop_installer/pages/active_directory/active_directory_model.dart';
import 'package:ubuntu_desktop_installer/pages/active_directory/active_directory_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:ubuntu_wizard/utils.dart';

import '../test_utils.dart';
import 'active_directory_page_test.mocks.dart';

final domainNameValidationVariant = ValueVariant(
    AdDomainNameValidation.values.toSet()
      ..remove(AdDomainNameValidation.REALM_NOT_FOUND));
final adminNameValidationVariant =
    ValueVariant(AdAdminNameValidation.values.toSet());
final passwordValidationVariant =
    ValueVariant(AdPasswordValidation.values.toSet());

@GenerateMocks([ActiveDirectoryModel, UrlLauncher])
void main() {
  ActiveDirectoryModel buildModel({
    bool? isValid,
    String? domainName,
    String? adminName,
    String? password,
    List<AdDomainNameValidation>? domainNameValidation,
    AdAdminNameValidation? adminNameValidation,
    AdPasswordValidation? passwordValidation,
    AdJoinResult? joinResult,
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
    when(model.getJoinResult())
        .thenAnswer((_) async => joinResult ?? AdJoinResult.OK);
    return model;
  }

  Widget buildPage(ActiveDirectoryModel model) {
    return ProviderScope(
      overrides: [ActiveDirectoryPage.modelProvider.overrideWith((_) => model)],
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
    expect(find.textField('ubuntu.com'), findsOneWidget);
    expect(find.textField('admin'), findsOneWidget);
    expect(find.textField('password'), findsOneWidget);
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

    final textField = find.textField('ubuntu.com');
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

    final textField = find.textField('admin');
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

    await tester.enterText(find.textField('password'), 'ubuntu');
    verify(model.setPassword('ubuntu')).called(1);

    await tester.pump();
    if (error.isNotEmpty) {
      expect(find.text(error), findsOneWidget);
    }
  }, variant: passwordValidationVariant);

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

  testWidgets('save AD connection info', (tester) async {
    final model = buildModel(isValid: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final nextButton = find.button(tester.ulang.nextLabel);
    expect(nextButton, findsOneWidget);

    await tester.tap(nextButton);
    verify(model.save()).called(1);

    verify(model.getJoinResult()).called(1);
    await tester.pumpAndSettle();
    expect(find.byType(ActiveDirectoryErrorDialog), findsNothing);
  });

  testWidgets('AD join error', (tester) async {
    final model =
        buildModel(isValid: true, joinResult: AdJoinResult.JOIN_ERROR);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final nextButton = find.button(tester.ulang.nextLabel);
    expect(nextButton, findsOneWidget);

    await tester.tap(nextButton);
    verify(model.save()).called(1);

    verify(model.getJoinResult()).called(1);
    await tester.pumpAndSettle();
    expect(find.byType(ActiveDirectoryErrorDialog), findsOneWidget);

    final urlLauncher = MockUrlLauncher();
    when(urlLauncher.launchUrl('https://help.ubuntu.com/activedirectory'))
        .thenAnswer((_) async => true);
    registerMockService<UrlLauncher>(urlLauncher);

    await tester.tapLink('help.ubuntu.com/activedirectory');

    verify(urlLauncher.launchUrl('https://help.ubuntu.com/activedirectory'))
        .called(1);
  });
}
