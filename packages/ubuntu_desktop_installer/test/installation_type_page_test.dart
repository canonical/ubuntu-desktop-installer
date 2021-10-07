import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages/installation_type/installation_type_model.dart';
import 'package:ubuntu_desktop_installer/pages/installation_type/installation_type_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/mocks.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';

import 'installation_type_page_test.mocks.dart';
import 'widget_tester_extensions.dart';

@GenerateMocks([InstallationTypeModel])
void main() {
  InstallationTypeModel buildModel({
    InstallationType? installationType,
    AdvancedFeature? advancedFeature,
    bool? encryption,
    String? productInfo,
    String? existingOS,
  }) {
    final model = MockInstallationTypeModel();
    when(model.installationType)
        .thenReturn(installationType ?? InstallationType.erase);
    when(model.advancedFeature)
        .thenReturn(advancedFeature ?? AdvancedFeature.none);
    when(model.encryption).thenReturn(encryption ?? false);
    when(model.productInfo).thenReturn(productInfo ?? '');
    when(model.existingOS).thenReturn(existingOS);
    return model;
  }

  Widget buildPage(InstallationTypeModel model) {
    return ChangeNotifierProvider<InstallationTypeModel>.value(
      value: model,
      child: InstallationTypePage(),
    );
  }

  Widget buildApp(InstallationTypeModel model) {
    return MaterialApp(
      localizationsDelegates: localizationsDelegates,
      home: Wizard(
        routes: {'/': (_) => buildPage(model)},
        onNext: (settings) => '/',
      ),
    );
  }

  testWidgets('reinstall', (tester) async {
    final model = buildModel(existingOS: 'Ubuntu 18.04 LTS');
    await tester.pumpWidget(buildApp(model));

    final radio = find.widgetWithText(typeOf<RadioButton<InstallationType>>(),
        tester.lang.installationTypeReinstall('Ubuntu 18.04 LTS'));
    expect(radio, findsOneWidget);
    await tester.tap(radio);
    verify(model.installationType = InstallationType.reinstall).called(1);
  });

  testWidgets('alongside', (tester) async {
    final model = buildModel(
      productInfo: 'Ubuntu 21.10',
      existingOS: 'Ubuntu 18.04 LTS',
    );
    await tester.pumpWidget(buildApp(model));

    final radio = find.widgetWithText(
        typeOf<RadioButton<InstallationType>>(),
        tester.lang
            .installationTypeAlongside('Ubuntu 21.10', 'Ubuntu 18.04 LTS'));
    expect(radio, findsOneWidget);
    await tester.tap(radio);
    verify(model.installationType = InstallationType.alongside).called(1);
  });

  testWidgets('erase', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(buildApp(model));

    final radio = find.widgetWithText(typeOf<RadioButton<InstallationType>>(),
        tester.lang.installationTypeErase);
    expect(radio, findsOneWidget);
    await tester.tap(radio);
    verify(model.installationType = InstallationType.erase).called(1);
  });

  testWidgets('manual', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(buildApp(model));

    final radio = find.widgetWithText(typeOf<RadioButton<InstallationType>>(),
        tester.lang.installationTypeManual);
    expect(radio, findsOneWidget);
    await tester.tap(radio);
    verify(model.installationType = InstallationType.manual).called(1);
  });

  // https://github.com/canonical/ubuntu-desktop-installer/issues/373
  // testWidgets('advanced features', (tester) async {
  //   final model = buildModel();
  //   await tester.pumpWidget(buildApp(model));

  //   final button = find.widgetWithText(
  //       OutlinedButton, tester.lang.installationTypeAdvancedLabel);
  //   expect(button, findsOneWidget);
  //   await tester.tap(button);
  //   await tester.pumpAndSettle();

  //   expect(find.byType(AlertDialog), findsOneWidget);
  // });

  testWidgets('creates a model', (tester) async {
    final client = MockSubiquityClient();
    when(client.isOpen).thenAnswer((_) async => true);
    when(client.getGuidedStorage(true))
        .thenAnswer((_) async => GuidedStorageResponse());

    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: localizationsDelegates,
      home: MultiProvider(
        providers: [
          Provider<SubiquityClient>.value(value: client),
          Provider(create: (_) => DiskStorageService(client)),
        ],
        child: Wizard(
          routes: {'/': InstallationTypePage.create},
          onNext: (settings) => '/',
        ),
      ),
    ));

    final page = find.byType(InstallationTypePage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model = Provider.of<InstallationTypeModel>(context, listen: false);
    expect(model, isNotNull);
  });
}
