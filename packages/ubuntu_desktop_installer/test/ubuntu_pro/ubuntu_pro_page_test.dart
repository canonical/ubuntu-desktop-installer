import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/pages/ubuntu_pro/ubuntu_pro_model.dart';
import 'package:ubuntu_desktop_installer/pages/ubuntu_pro/ubuntu_pro_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:ubuntu_wizard/widgets.dart';

import '../widget_tester_extensions.dart';
import 'ubuntu_pro_model_test.mocks.dart';
import 'ubuntu_pro_page_test.mocks.dart';

MockUbuntuProModel buildModel({
  UbuntuProMode? mode,
  bool? isOnline,
  bool? isAttached,
  bool? isAttaching,
  bool? hasError,
  bool? hasValidToken,
  String? token,
}) {
  final model = MockUbuntuProModel();
  when(model.isOnline).thenReturn(isOnline ?? true);
  when(model.mode).thenReturn(mode ?? UbuntuProMode.skip);
  when(model.isAttached).thenReturn(isAttached ?? false);
  when(model.isAttaching).thenReturn(isAttaching ?? false);
  when(model.isEnabled).thenReturn(mode == UbuntuProMode.enable);
  when(model.hasError).thenReturn(hasError ?? false);
  when(model.hasValidToken).thenReturn(hasValidToken ?? false);
  when(model.token).thenReturn(token ?? '');
  return model;
}

@GenerateMocks([UbuntuProModel, UrlLauncher])
void main() {
  Widget buildPage(UbuntuProModel model) {
    return ChangeNotifierProvider<UbuntuProModel>.value(
      value: model,
      child: const UbuntuProPage(),
    );
  }

  testWidgets('init', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    verify(model.init()).called(1);
  });

  testWidgets('attach', (tester) async {
    final model = buildModel(mode: UbuntuProMode.enable, hasValidToken: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final attachButton =
        find.widgetWithText(OutlinedButton, tester.lang.ubuntuProAttach);
    expect(attachButton, findsOneWidget);

    await tester.tap(attachButton);
    verify(model.attach()).called(1);
  });

  testWidgets('continue', (tester) async {
    final model = buildModel(isAttached: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final continueButton =
        find.widgetWithText(OutlinedButton, tester.ulang.continueAction);
    expect(continueButton, findsOneWidget);

    await tester.tap(continueButton);
    verify(model.save()).called(1);
  });

  testWidgets('skip', (tester) async {
    final model = buildModel(mode: UbuntuProMode.skip);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final attachButton =
        find.widgetWithText(OutlinedButton, tester.lang.ubuntuProAttach);
    final continueButton =
        find.widgetWithText(OutlinedButton, tester.ulang.continueAction);

    expect(attachButton, findsNothing);
    expect(continueButton, findsOneWidget);
    expect(tester.widget<OutlinedButton>(continueButton).enabled, isTrue);
  });

  testWidgets('attaching', (tester) async {
    final model = buildModel(mode: UbuntuProMode.enable, isAttaching: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final attachButton =
        find.widgetWithText(OutlinedButton, tester.lang.ubuntuProAttach);
    final continueButton =
        find.widgetWithText(OutlinedButton, tester.ulang.continueAction);

    expect(attachButton, findsOneWidget);
    expect(continueButton, findsNothing);
    expect(tester.widget<OutlinedButton>(attachButton).enabled, isFalse);
  });

  testWidgets('mode', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final enableOption = find.widgetWithText(
      RadioButton<UbuntuProMode>,
      tester.lang.ubuntuProEnable,
      skipOffstage: false,
    );
    await tester.ensureVisible(enableOption);
    await tester.pump();
    expect(enableOption, findsOneWidget);
    await tester.tap(enableOption);
    await tester.pump();
    verify(model.mode = UbuntuProMode.enable).called(isPositive); // tap + focus

    final skipOption = find.widgetWithText(
      RadioButton<UbuntuProMode>,
      tester.lang.ubuntuProSkip,
      skipOffstage: false,
    );
    await tester.ensureVisible(skipOption);
    await tester.pump();
    expect(skipOption, findsOneWidget);
    await tester.tap(skipOption);
    await tester.pump();
    verify(model.mode = UbuntuProMode.skip).called(1);
  });

  testWidgets('focus', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final textField = tester.widget<TextField>(find.byType(TextField));
    expect(textField.focusNode!.hasFocus, isFalse);

    textField.focusNode!.requestFocus();
    await tester.pump();
    verify(model.mode = UbuntuProMode.enable).called(1);

    textField.focusNode!.unfocus();
    await tester.pump();
    verifyNever(model.mode = UbuntuProMode.enable);
  });

  testWidgets('tap token field', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    await tester.tap(find.byType(TextField));
    await tester.pump();
    verify(model.mode = UbuntuProMode.enable).called(1);
  });

  testWidgets('tap link', (tester) async {
    final urlLauncher = MockUrlLauncher();
    when(urlLauncher.launchUrl(any)).thenAnswer((_) async => true);
    registerMockService<UrlLauncher>(urlLauncher);

    await tester.pumpWidget(tester.buildApp((_) => buildPage(buildModel())));
    await tester.tapLink('ubuntu.com/pro');

    // TODO: ua -> pro?
    verify(urlLauncher.launchUrl('https://ubuntu.com/advantage')).called(1);
  });

  testWidgets('creates a model', (tester) async {
    final client = MockUbuntuProClient();
    when(client.daemonVersion).thenReturn('');
    when(client.connect()).thenAnswer((_) async {});
    registerMockService<UbuntuProClient>(client);

    final network = MockNetworkService();
    when(network.isConnected).thenReturn(true);
    when(network.propertiesChanged).thenAnswer((_) => Stream.empty());
    registerMockService<NetworkService>(network);

    await tester.pumpWidget(tester.buildApp(UbuntuProPage.create));

    final page = find.byType(UbuntuProPage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model = Provider.of<UbuntuProModel>(context, listen: false);
    expect(model, isNotNull);
  });
}
