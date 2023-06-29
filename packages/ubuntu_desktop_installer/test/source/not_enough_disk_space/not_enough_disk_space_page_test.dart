import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/pages/source/not_enough_disk_space/not_enough_disk_space_model.dart';
import 'package:ubuntu_desktop_installer/pages/source/not_enough_disk_space/not_enough_disk_space_page.dart';
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

    expect(find.text(tester.lang.notEnoughDiskSpaceUbuntu('Ubuntu')),
        findsOneWidget);
    expect(find.text(filesize(123456)), findsOneWidget);
    expect(find.text(filesize(654321)), findsOneWidget);
  });

  testWidgets('quit', (tester) async {
    final model = buildNotEnoughDiskSpaceModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final button = find.button(tester.lang.quitButtonText);
    expect(button, findsOneWidget);

    final windowClosed = YaruTestWindow.waitForClosed();

    await tester.tap(button);

    await expectLater(windowClosed, completes);
  });
}
