import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/l10n.dart';
import 'package:ubuntu_desktop_installer/pages/updates_other_software/updates_other_software_model.dart';
import 'package:ubuntu_desktop_installer/pages/updates_other_software/updates_other_software_page.dart';
import 'package:ubuntu_test/mocks.dart';
import 'package:ubuntu_test/utils.dart';
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
    final client = MockSubiquityClient();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UpdateOtherSoftwareModel>.value(value: model),
        Provider<SubiquityClient>.value(value: client),
      ],
      child: UpdatesOtherSoftwarePage(),
    );
  }

  Widget buildApp(WidgetTester tester, UpdateOtherSoftwareModel model) {
    return MaterialApp(
      localizationsDelegates: localizationsDelegates,
      home: Wizard(
        routes: {
          '/': (_) => buildPage(model),
          '/next': (_) => Text('Next page'),
        },
      ),
    );
  }

  testWidgets('installation mode', (tester) async {
    final model = buildModel(installationMode: InstallationMode.normal);
    await tester.pumpWidget(buildApp(tester, model));

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

  // https://github.com/canonical/ubuntu-desktop-installer/issues/373
  // testWidgets('install third-party software', (tester) async {
  //   final model = buildModel(installThirdParty: true);
  //   await tester.pumpWidget(buildApp(tester, model));

  //   final installThirdPartyTile = find.widgetWithText(
  //     CheckButton,
  //     tester.lang.installThirdPartyTitle,
  //   );
  //   expect(installThirdPartyTile, findsOneWidget);

  //   expect(tester.widget<CheckButton>(installThirdPartyTile).value, isTrue);

  //   when(model.installThirdParty).thenReturn(false);

  //   await tester.tap(installThirdPartyTile);

  //   verify(model.setInstallThirdParty(false)).called(1);
  // });

  testWidgets('continue on the next page', (tester) async {
    final model = buildModel(installationMode: InstallationMode.normal);
    await tester.pumpWidget(buildApp(tester, model));

    final continueButton = find.widgetWithText(
      OutlinedButton,
      tester.ulang.continueAction,
    );
    expect(continueButton, findsOneWidget);
    await tester.tap(continueButton);
    await tester.pumpAndSettle();

    verify(model.selectInstallationSource()).called(1);
    expect(find.text('Next page'), findsOneWidget);
  });

  testWidgets('creates a model', (tester) async {
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: localizationsDelegates,
      home: Provider<SubiquityClient>(
        create: (_) => MockSubiquityClient(),
        child: Wizard(
          routes: {'/': UpdatesOtherSoftwarePage.create},
          onNext: (settings) => '/',
        ),
      ),
    ));

    final page = find.byType(UpdatesOtherSoftwarePage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model = Provider.of<UpdateOtherSoftwareModel>(context, listen: false);
    expect(model, isNotNull);
  });
}
