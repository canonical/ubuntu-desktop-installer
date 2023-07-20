import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_bootstrap/pages/source/not_enough_disk_space/not_enough_disk_space_model.dart';

import 'test_not_enough_disk_space.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('service', () async {
    final service = MockStorageService();
    when(service.installMinimumSize).thenReturn(123);
    when(service.largestDiskSize).thenReturn(456);

    final model = NotEnoughDiskSpaceModel(service);
    expect(model.installMinimumSize, 123);
    expect(model.largestDiskSize, 456);
    expect(await model.init(), isFalse);

    when(service.largestDiskSize).thenReturn(456);
    when(service.installMinimumSize).thenReturn(789);
    expect(await model.init(), isTrue);
  });
}
