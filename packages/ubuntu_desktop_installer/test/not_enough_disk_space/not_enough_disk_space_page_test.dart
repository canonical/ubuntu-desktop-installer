import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_desktop_installer/pages/not_enough_disk_space/not_enough_disk_space_model.dart';
import 'package:ubuntu_desktop_installer/pages/not_enough_disk_space/not_enough_disk_space_page.dart';
import 'package:ubuntu_desktop_installer/services.dart';

import '../test_utils.dart';
import 'not_enough_disk_space_model_test.mocks.dart';
import 'not_enough_disk_space_page_test.mocks.dart';

@GenerateMocks([NotEnoughDiskSpaceModel])
void main() {
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
    return ChangeNotifierProvider<NotEnoughDiskSpaceModel>.value(
      value: model,
      child: const NotEnoughDiskSpacePage(),
    );
  }

  testWidgets('minimum size', (tester) async {
    final model = buildModel(installMinimumSize: 123456);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(
        find.text(
            tester.lang.notEnoughDiskSpaceHeader(filesize(123456), 'Ubuntu')),
        findsOneWidget);
  });

  testWidgets('one disk', (tester) async {
    final model = buildModel(hasMultipleDisks: false, largestDiskSize: 123456);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(find.text(tester.lang.notEnoughDiskSpaceHasOnly(filesize(123456))),
        findsOneWidget);
  });

  testWidgets('multiple disks', (tester) async {
    final model = buildModel(hasMultipleDisks: true, largestDiskSize: 123456);
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    expect(
        find.text(tester.lang.notEnoughDiskSpaceBiggestDisk(filesize(123456))),
        findsOneWidget);
  });

  testWidgets('quit', (tester) async {
    final model = buildModel();
    await tester.pumpWidget(tester.buildApp((_) => buildPage(model)));

    final button =
        find.widgetWithText(FilledButton, tester.lang.quitButtonText);
    expect(button, findsOneWidget);

    var windowClosed = false;
    const methodChannel = MethodChannel('yaru_window');
    methodChannel.setMockMethodCallHandler((call) async {
      expect(call.method, equals('close'));
      windowClosed = true;
    });

    await tester.tap(button);

    expect(windowClosed, isTrue);
  });

  testWidgets('creates a model', (tester) async {
    final storage = MockDiskStorageService();
    when(storage.largestDiskSize).thenReturn(0);
    when(storage.installMinimumSize).thenReturn(0);
    when(storage.hasMultipleDisks).thenReturn(false);
    registerMockService<DiskStorageService>(storage);

    await tester.pumpWidget(tester.buildApp(NotEnoughDiskSpacePage.create));

    final page = find.byType(NotEnoughDiskSpacePage);
    expect(page, findsOneWidget);

    final context = tester.element(page);
    final model = Provider.of<NotEnoughDiskSpaceModel>(context, listen: false);
    expect(model, isNotNull);
  });
}
