import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/pages/source/source_model.dart';
import 'package:ubuntu_desktop_installer/pages/source/source_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_wizard/utils.dart';
import 'package:yaru_test/yaru_test.dart';

import '../test_utils.dart';
import 'source_page_test.mocks.dart';

@GenerateMocks([SourceModel, TelemetryService])
void main() {
  SourceModel buildModel({
    String? sourceId,
    bool? installDrivers,
    bool? installCodecs,
    bool? onBattery,
    bool? isOnline,
    bool? hasEnoughDiskSpace,
  }) {
    final model = MockSourceModel();
    when(model.sources).thenReturn([
      const SourceSelection(
        id: kMinimalSourceId,
        name: '',
        description: '',
        size: 0,
        variant: 'desktop',
        isDefault: false,
      ),
      const SourceSelection(
        id: kNormalSourceId,
        name: '',
        description: '',
        size: 0,
        variant: 'desktop',
        isDefault: true,
      ),
    ]);
    when(model.sourceId).thenReturn(sourceId ?? kNormalSourceId);
    when(model.installDrivers).thenReturn(installDrivers ?? false);
    when(model.installCodecs).thenReturn(installCodecs ?? false);
    when(model.onBattery).thenReturn(onBattery ?? false);
    when(model.isOnline).thenReturn(isOnline ?? true);
    when(model.hasEnoughDiskSpace).thenReturn(hasEnoughDiskSpace ?? true);
    return model;
  }

  Widget buildPage(SourceModel model) {
    registerMockService<SubiquityClient>(MockSubiquityClient());
    registerMockService<TelemetryService>(MockTelemetryService());

    return ProviderScope(
      overrides: [sourceModelProvider.overrideWith((_) => model)],
      child: const SourcePage(),
    );
  }

  testWidgets('source id', (tester) async {
    final model = buildModel(sourceId: kNormalSourceId);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(find.radio(kNormalSourceId), isChecked);
    expect(find.radio(kMinimalSourceId), isNotChecked);

    when(model.sourceId).thenReturn('ubuntu-desktop-minimal');

    await tester.tap(find.radio(kMinimalSourceId));

    verify(model.setSourceId('ubuntu-desktop-minimal')).called(1);
  });

  testWidgets('install drivers', (tester) async {
    final model = buildModel(installDrivers: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final checkbox = find.checkButton(tester.lang.installDriversTitle);
    expect(checkbox, findsOneWidget);
    expect(checkbox, isChecked);

    when(model.installDrivers).thenReturn(false);

    await tester.tap(checkbox);

    verify(model.setInstallDrivers(false)).called(1);
  });

  testWidgets('install codecs', (tester) async {
    final model = buildModel(installCodecs: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final checkbox = find.checkButton(tester.lang.installCodecsTitle);
    expect(checkbox, findsOneWidget);
    expect(checkbox, isChecked);

    when(model.installCodecs).thenReturn(false);

    await tester.tap(checkbox);

    verify(model.setInstallCodecs(false)).called(1);
  });

  testWidgets('on battery', (tester) async {
    final model = buildModel(onBattery: true);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));
    await tester.pumpAndSettle();

    final warning = find.byType(Html);
    final theme = Theme.of(tester.element(find.byType(Scaffold)));
    expect(warning, findsOneWidget);
    expect(
      tester.widget<Html>(warning).data,
      equals(tester.lang.onBatteryWarning(theme.colorScheme.error.toHex())),
    );
  });

  testWidgets('not on battery', (tester) async {
    final model = buildModel(onBattery: false);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(find.byType(Html), findsNothing);
  });

  testWidgets('offline', (tester) async {
    final model = buildModel(isOnline: false);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(find.text(tester.lang.offlineWarning), findsNothing);

    final checkbox = find.checkButton(tester.lang.installCodecsTitle);
    expect(checkbox, findsOneWidget);
    expect(checkbox, isDisabled);

    final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
    await gesture.addPointer();
    addTearDown(gesture.removePointer);
    await gesture.moveTo(tester.getCenter(checkbox));
    await tester.pump();

    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    expect(find.text(tester.lang.offlineWarning), findsOneWidget);
  });

  testWidgets('continue on the next page', (tester) async {
    final model = buildModel(sourceId: kNormalSourceId);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final nextButton = find.button(tester.ulang.nextLabel);
    expect(nextButton, findsOneWidget);
    await tester.tap(nextButton);
    await tester.pumpAndSettle();

    verify(model.save()).called(1);
    expect(find.text('Next page'), findsOneWidget);
  });
}
