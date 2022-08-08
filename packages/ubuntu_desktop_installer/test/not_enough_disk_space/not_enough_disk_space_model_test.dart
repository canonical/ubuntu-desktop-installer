import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/not_enough_disk_space/not_enough_disk_space_model.dart';
import 'package:ubuntu_desktop_installer/services.dart';

import 'not_enough_disk_space_model_test.mocks.dart';

@GenerateMocks([DiskStorageService])
void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('service', () {
    final service = MockDiskStorageService();
    when(service.hasMultipleDisks).thenReturn(true);
    when(service.installMinimumSize).thenReturn(123);
    when(service.largestDiskSize).thenReturn(456);

    final model = NotEnoughDiskSpaceModel(service);
    expect(model.hasMultipleDisks, isTrue);
    expect(model.installMinimumSize, 123);
    expect(model.largestDiskSize, 456);
  });

  test('quit', () {
    final service = MockDiskStorageService();
    when(service.installMinimumSize).thenReturn(123);
    when(service.largestDiskSize).thenReturn(456);

    var windowClosed = false;
    const methodChannel = MethodChannel('window_manager');
    methodChannel.setMockMethodCallHandler((call) async {
      expect(call.method, equals('close'));
      windowClosed = true;
    });

    final model = NotEnoughDiskSpaceModel(service);
    model.quit();
    expect(windowClosed, isTrue);
  });
}
