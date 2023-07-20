import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_bootstrap/l10n.dart';
import 'package:ubuntu_bootstrap/pages/source/not_enough_disk_space/not_enough_disk_space_model.dart';
import 'package:ubuntu_bootstrap/pages/source/not_enough_disk_space/not_enough_disk_space_page.dart';
import 'package:yaru_test/yaru_test.dart';

import 'test_not_enough_disk_space.dart';

void main() {
  setUpAll(YaruTestWindow.ensureInitialized);

  Widget buildPage(NotEnoughDiskSpaceModel model) {
    return ProviderScope(
      overrides: [
        notEnoughDiskSpaceModelProvider.overrideWith((_) => model),
      ],
      child: const NotEnoughDiskSpacePage(),
    );
  }

  testWidgets('not enough disk space', (tester) async {
    final model = buildNotEnoughDiskSpaceModel(
        largestDiskSize: 123456, installMinimumSize: 654321);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final context = tester.element(find.byType(NotEnoughDiskSpacePage));
    final l10n = UbuntuBootstrapLocalizations.of(context);

    expect(find.text(l10n.notEnoughDiskSpaceUbuntu('Ubuntu')), findsOneWidget);
    expect(find.text(context.formatByteSize(123456)), findsOneWidget);
    expect(find.text(context.formatByteSize(654321)), findsOneWidget);
  });

  testWidgets('quit', (tester) async {
    final model = buildNotEnoughDiskSpaceModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final context = tester.element(find.byType(NotEnoughDiskSpacePage));
    final l10n = UbuntuBootstrapLocalizations.of(context);

    final button = find.button(l10n.quitButtonText);
    expect(button, findsOneWidget);

    final windowClosed = YaruTestWindow.waitForClosed();

    await tester.tap(button);

    await expectLater(windowClosed, completes);
  });
}
