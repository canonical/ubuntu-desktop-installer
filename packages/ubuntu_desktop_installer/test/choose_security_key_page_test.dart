import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages/choose_security_key/choose_security_key_model.dart';
import 'package:ubuntu_desktop_installer/pages/choose_security_key/choose_security_key_page.dart';
import 'package:ubuntu_test/mocks.dart';
import 'package:ubuntu_wizard/l10n.dart';
import 'package:ubuntu_wizard/widgets.dart';

import 'choose_security_key_page_test.mocks.dart';
import 'widget_tester_extensions.dart';

@GenerateMocks([ChooseSecurityKeyModel])
void main() {
  ChooseSecurityKeyModel buildModel({
    bool? isValid,
    String? securityKey,
    String? confirmedSecurityKey,
  }) {
    final model = MockChooseSecurityKeyModel();
    when(model.isValid).thenReturn(isValid ?? false);
    when(model.securityKey).thenReturn(securityKey ?? '');
    when(model.confirmedSecurityKey).thenReturn(confirmedSecurityKey ?? '');
    return model;
  }

  Widget buildPage(ChooseSecurityKeyModel model) {
    return ChangeNotifierProvider<ChooseSecurityKeyModel>.value(
      value: model,
      child: ChooseSecurityKeyPage(),
    );
  }

  Widget buildApp(WidgetTester tester, ChooseSecurityKeyModel model) {
    tester.binding.window.devicePixelRatioTestValue = 1;
    tester.binding.window.physicalSizeTestValue = Size(960, 680);
    return MaterialApp(
      localizationsDelegates: [
        ...AppLocalizations.localizationsDelegates,
        ...UbuntuLocalizations.localizationsDelegates,
      ],
      home: Wizard(
        routes: {
          '/': (_) => buildPage(model),
          '/next': (_) => const Text('Next'),
        },
      ),
    );
  }

  testWidgets('security key input', (tester) async {
    final model = buildModel(securityKey: 'foo');
    await tester.pumpWidget(buildApp(tester, model));

    final textField = find.widgetWithText(TextField, 'foo');
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'bar');
    verify(model.securityKey = 'bar').called(1);
  });

  testWidgets('security key confirmation', (tester) async {
    final model = buildModel(securityKey: 'foo', confirmedSecurityKey: 'foo');
    await tester.pumpWidget(buildApp(tester, model));

    final textFields = find.widgetWithText(TextField, 'foo');
    expect(textFields, findsNWidgets(2));
    await tester.enterText(textFields.first, 'bar');
    verify(model.securityKey = 'bar').called(1);
    await tester.enterText(textFields.last, 'bar');
    verify(model.confirmedSecurityKey = 'bar').called(1);
  });

  testWidgets('valid input', (tester) async {
    final model = buildModel(isValid: true);
    await tester.pumpWidget(buildApp(tester, model));

    final continueButton = find.widgetWithText(
      OutlinedButton,
      tester.ulang.continueAction,
    );
    expect(tester.widget<OutlinedButton>(continueButton).enabled, isTrue);
  });

  testWidgets('invalid input', (tester) async {
    final model = buildModel(isValid: false);
    await tester.pumpWidget(buildApp(tester, model));

    final continueButton = find.widgetWithText(
      OutlinedButton,
      tester.ulang.continueAction,
    );
    expect(tester.widget<OutlinedButton>(continueButton).enabled, isFalse);
  });

  testWidgets('load and save security key', (tester) async {
    final model = buildModel(isValid: true);
    await tester.pumpWidget(buildApp(tester, model));

    verify(model.loadSecurityKey()).called(1);
    verifyNever(model.saveSecurityKey());

    final continueButton = find.widgetWithText(
      OutlinedButton,
      tester.ulang.continueAction,
    );
    expect(continueButton, findsOneWidget);

    await tester.tap(continueButton);
    verify(model.saveSecurityKey()).called(1);
  });

  testWidgets('creates a model', (tester) async {
    final client = MockSubiquityClient();
    when(client.identity()).thenAnswer((_) async => IdentityData());

    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: localizationsDelegates,
      home: Provider<SubiquityClient>.value(
        value: client,
        child: Wizard(routes: {'/': ChooseSecurityKeyPage.create}),
      ),
    ));

    final page = find.byType(ChooseSecurityKeyPage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model = Provider.of<ChooseSecurityKeyModel>(context, listen: false);
    expect(model, isNotNull);
  });
}
