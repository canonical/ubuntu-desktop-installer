import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/source/not_enough_disk_space/not_enough_disk_space_model.dart';
import 'package:ubuntu_desktop_installer/services.dart';

import 'not_enough_disk_space_model_test.mocks.dart';

@GenerateMocks([StorageService])
void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('service', () {
    final service = MockStorageService();
    when(service.hasMultipleDisks).thenReturn(true);
    when(service.installMinimumSize).thenReturn(123);
    when(service.largestDiskSize).thenReturn(456);

    final model = NotEnoughDiskSpaceModel(service);
    expect(model.hasMultipleDisks, isTrue);
    expect(model.installMinimumSize, 123);
    expect(model.largestDiskSize, 456);
  });
}
