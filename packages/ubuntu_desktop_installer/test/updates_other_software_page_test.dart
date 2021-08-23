import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages/updates_other_software/updates_other_software_model.dart';
import 'package:ubuntu_desktop_installer/pages/updates_other_software/updates_other_software_page.dart';
import 'package:ubuntu_wizard/widgets.dart';

import 'updates_other_software_page_test.mocks.dart';
import 'widget_tester_extensions.dart';

@GenerateMocks([UpdateOtherSoftwareModel])
void main() {
  UpdateOtherSoftwareModel buildModel({
    InstallationMode? installationMode,
    bool? installThirdParty,
  }) {
    final model = MockUpdateOtherSoftwareModel();
    when(model.installationMode)
        .thenReturn(installationMode ?? InstallationMode.normal);
    when(model.installThirdParty).thenReturn(installThirdParty ?? false);
    return model;
  }

  Widget buildPage(UpdateOtherSoftwareModel model) {
    return ChangeNotifierProvider<UpdateOtherSoftwareModel>.value(
      value: model,
      child: UpdatesOtherSoftwarePage(),
    );
  }

  Widget buildApp(WidgetTester tester, UpdateOtherSoftwareModel model) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: Wizard(
        routes: {'/': (_) => buildPage(model)},
        onNext: (settings) => '/',
      ),
    );
  }

  testWidgets('installation mode', (tester) async {
    final model = buildModel(installationMode: InstallationMode.normal);
    await tester.pumpWidget(buildApp(tester, model));

    Type typeOf<T>() => T;

    final normalInstallationTile = find.widgetWithText(
      typeOf<RadioButton<InstallationMode>>(),
      tester.lang.normalInstallationTitle,
    );
    expect(normalInstallationTile, findsOneWidget);

    final minimalInstallationTile = find.widgetWithText(
      typeOf<RadioButton<InstallationMode>>(),
      tester.lang.minimalInstallationTitle,
    );
    expect(minimalInstallationTile, findsOneWidget);

    expect(
      tester
          .widget<RadioButton<InstallationMode>>(normalInstallationTile)
          .groupValue,
      InstallationMode.normal,
    );
    expect(
      tester
          .widget<RadioButton<InstallationMode>>(minimalInstallationTile)
          .groupValue,
      InstallationMode.normal,
    );

    when(model.installationMode).thenReturn(InstallationMode.minimal);

    await tester.tap(minimalInstallationTile);

    verify(model.setInstallationMode(InstallationMode.minimal)).called(1);
  });

  testWidgets('install third-party software', (tester) async {
    final model = buildModel(installThirdParty: true);
    await tester.pumpWidget(buildApp(tester, model));

    Type typeOf<T>() => T;

    final installThirdPartyTile = find.widgetWithText(
      typeOf<CheckButton>(),
      tester.lang.installThirdPartyTitle,
    );
    expect(installThirdPartyTile, findsOneWidget);

    expect(tester.widget<CheckButton>(installThirdPartyTile).value, isTrue);

    when(model.installThirdParty).thenReturn(false);

    await tester.tap(installThirdPartyTile);

    verify(model.setInstallThirdParty(false)).called(1);
  });

  testWidgets('creates a model', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: Wizard(
          routes: {'/': UpdatesOtherSoftwarePage.create},
          onNext: (settings) => '/',
        ),
      ),
    );

    final page = find.byType(UpdatesOtherSoftwarePage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model = Provider.of<UpdateOtherSoftwareModel>(context, listen: false);
    expect(model, isNotNull);
  });
}
