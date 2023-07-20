import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_bootstrap/l10n.dart';
import 'package:ubuntu_bootstrap/pages/source/source_page.dart';
import 'package:ubuntu_test/ubuntu_test.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_test/yaru_test.dart';

import 'test_source.dart';

void main() {
  testWidgets('source id', (tester) async {
    final model = buildSourceModel(sourceId: kNormalSourceId);
    await tester.pumpWidget(tester.buildApp((_) => buildSourcePage(model)));

    expect(find.radio(kNormalSourceId), isChecked);
    expect(find.radio(kMinimalSourceId), isNotChecked);

    when(model.sourceId).thenReturn('ubuntu-desktop-minimal');

    await tester.tap(find.radio(kMinimalSourceId));

    verify(model.setSourceId('ubuntu-desktop-minimal')).called(1);
  });

  testWidgets('install drivers', (tester) async {
    final model = buildSourceModel(installDrivers: true);
    await tester.pumpWidget(tester.buildApp((_) => buildSourcePage(model)));

    final context = tester.element(find.byType(SourcePage));
    final l10n = UbuntuBootstrapLocalizations.of(context);

    final checkbox = find.checkButton(l10n.installDriversTitle);
    expect(checkbox, findsOneWidget);
    expect(checkbox, isChecked);

    when(model.installDrivers).thenReturn(false);

    await tester.tap(checkbox);

    verify(model.setInstallDrivers(false)).called(1);
  });

  testWidgets('install codecs', (tester) async {
    final model = buildSourceModel(installCodecs: true);
    await tester.pumpWidget(tester.buildApp((_) => buildSourcePage(model)));

    final context = tester.element(find.byType(SourcePage));
    final l10n = UbuntuBootstrapLocalizations.of(context);

    final checkbox = find.checkButton(l10n.installCodecsTitle);
    expect(checkbox, findsOneWidget);
    expect(checkbox, isChecked);

    when(model.installCodecs).thenReturn(false);

    await tester.tap(checkbox);

    verify(model.setInstallCodecs(false)).called(1);
  });

  testWidgets('on battery', (tester) async {
    final model = buildSourceModel(onBattery: true);
    await tester.pumpWidget(tester.buildApp((_) => buildSourcePage(model)));
    await tester.pumpAndSettle();

    final context = tester.element(find.byType(SourcePage));
    final l10n = UbuntuBootstrapLocalizations.of(context);

    final warning = find.byType(Html);
    final theme = Theme.of(tester.element(find.byType(Scaffold)));
    expect(warning, findsOneWidget);
    expect(
      tester.widget<Html>(warning).data,
      equals(l10n.onBatteryWarning(theme.colorScheme.error.toHex())),
    );
  });

  testWidgets('not on battery', (tester) async {
    final model = buildSourceModel(onBattery: false);
    await tester.pumpWidget(tester.buildApp((_) => buildSourcePage(model)));

    expect(find.byType(Html), findsNothing);
  });

  testWidgets('offline', (tester) async {
    final model = buildSourceModel(isOnline: false);
    await tester.pumpWidget(tester.buildApp((_) => buildSourcePage(model)));

    final context = tester.element(find.byType(SourcePage));
    final l10n = UbuntuBootstrapLocalizations.of(context);

    expect(find.text(l10n.offlineWarning), findsNothing);

    final checkbox = find.checkButton(l10n.installCodecsTitle);
    expect(checkbox, findsOneWidget);
    expect(checkbox, isDisabled);

    final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
    await gesture.addPointer();
    addTearDown(gesture.removePointer);
    await gesture.moveTo(tester.getCenter(checkbox));
    await tester.pump();

    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    expect(find.text(l10n.offlineWarning), findsOneWidget);
  });

  testWidgets('continue on the next page', (tester) async {
    final model = buildSourceModel(sourceId: kNormalSourceId);
    await tester.pumpWidget(tester.buildApp((_) => buildSourcePage(model)));

    await tester.tapNext();
    await tester.pumpAndSettle();

    verify(model.save()).called(1);
    expect(find.text('Next page'), findsOneWidget);
  });
}
