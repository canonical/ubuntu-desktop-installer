import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_bootstrap/pages/storage/bitlocker/bitlocker_model.dart';

import '../../test_utils.dart';

void main() async {
  test('init', () async {
    final session = MockSessionService();
    final storage = MockStorageService();
    final model = BitLockerModel(session, storage);

    when(storage.hasBitLocker()).thenAnswer((_) async => true);
    expect(await model.init(), isTrue);

    when(storage.hasBitLocker()).thenAnswer((_) async => false);
    expect(await model.init(), isFalse);
  });

  test('reboot', () async {
    final session = MockSessionService();
    final storage = MockStorageService();
    final model = BitLockerModel(session, storage);

    await model.reboot();
    verify(session.reboot(immediate: true)).called(1);
  });
}
