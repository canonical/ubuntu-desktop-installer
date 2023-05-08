import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/source/not_enough_disk_space/not_enough_disk_space_model.dart';
import 'package:ubuntu_desktop_installer/pages/source/not_enough_disk_space/not_enough_disk_space_page.dart';
import 'package:ubuntu_test/utils.dart';
import 'package:yaru_window_test/yaru_window_test.dart';

import '../../test_utils.dart';
import 'not_enough_disk_space_page_test.mocks.dart';

@GenerateMocks([NotEnoughDiskSpaceModel])
void main() {
  setUpAll(YaruTestWindow.ensureInitialized);

  NotEnoughDiskSpaceModel buildModel({
    bool hasMultipleDisks = false,
    int largestDiskSize = 0,
    int installMinimumSize = 0,
  }) {
    final model = MockNotEnoughDiskSpaceModel();
    when(model.hasMultipleDisks).thenReturn(hasMultipleDisks);
    when(model.largestDiskSize).thenReturn(largestDiskSize);
    when(model.installMinimumSize).thenReturn(installMinimumSize);
    return model;
  }

  Widget buildPage(NotEnoughDiskSpaceModel model) {
    return ProviderScope(
      overrides: [
        NotEnoughDiskSpacePage.modelProvider.overrideWith((_) => model),
      ],
      child: const NotEnoughDiskSpacePage(),
    );
  }

  testWidgets('minimum size', (tester) async {
    final model = buildModel(installMinimumSize: 123456);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(find.text(tester.lang.notEnoughDiskSpaceUbuntu('Ubuntu')),
        findsOneWidget);
    expect(find.text(filesize(123456)), findsOneWidget);
  });

  testWidgets('one disk', (tester) async {
    final model = buildModel(
        hasMultipleDisks: false,
        largestDiskSize: 123456,
        installMinimumSize: 654321);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(find.text(tester.lang.notEnoughDiskSpaceUbuntu('Ubuntu')),
        findsOneWidget);
    expect(find.text(filesize(123456)), findsOneWidget);
    expect(find.text(filesize(654321)), findsOneWidget);
  });

  testWidgets('multiple disks', (tester) async {
    final model = buildModel(
        hasMultipleDisks: true,
        largestDiskSize: 123456,
        installMinimumSize: 654321);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(find.text(tester.lang.notEnoughDiskSpaceUbuntu('Ubuntu')),
        findsOneWidget);
    expect(find.text(filesize(123456)), findsOneWidget);
    expect(find.text(filesize(654321)), findsOneWidget);
  });

  testWidgets('quit', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final button = find.button(tester.lang.quitButtonText);
    expect(button, findsOneWidget);

    final windowClosed = YaruTestWindow.waitForClosed();

    await tester.tap(button);

    await expectLater(windowClosed, completes);
  });
}
