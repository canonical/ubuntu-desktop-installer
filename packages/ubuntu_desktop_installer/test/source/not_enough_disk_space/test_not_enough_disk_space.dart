import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/source/not_enough_disk_space/not_enough_disk_space_model.dart';

import 'test_not_enough_disk_space.mocks.dart';
export '../../test_utils.dart';
export 'test_not_enough_disk_space.mocks.dart';

@GenerateMocks([NotEnoughDiskSpaceModel])
NotEnoughDiskSpaceModel buildNotEnoughDiskSpaceModel({
  int largestDiskSize = 0,
  int installMinimumSize = 0,
  bool? hasEnoughDiskSpace,
}) {
  final model = MockNotEnoughDiskSpaceModel();
  when(model.largestDiskSize).thenReturn(largestDiskSize);
  when(model.installMinimumSize).thenReturn(installMinimumSize);
  when(model.init()).thenAnswer((_) async => hasEnoughDiskSpace == false);
  return model;
}
