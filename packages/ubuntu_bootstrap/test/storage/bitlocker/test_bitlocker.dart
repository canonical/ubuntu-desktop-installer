import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_bootstrap/pages/storage/bitlocker/bitlocker_model.dart';

import 'test_bitlocker.mocks.dart';
export '../../test_utils.dart';
export 'test_bitlocker.mocks.dart';

@GenerateMocks([BitLockerModel])
BitLockerModel buildBitLockerModel({bool? hasBitLocker}) {
  final model = MockBitLockerModel();
  when(model.init()).thenAnswer((_) async => hasBitLocker ?? false);
  return model;
}
