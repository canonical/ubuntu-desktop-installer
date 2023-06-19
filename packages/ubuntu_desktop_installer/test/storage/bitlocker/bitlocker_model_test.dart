import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/storage/bitlocker/bitlocker_model.dart';

import '../../test_utils.dart';

void main() async {
  test('reboot', () async {
    final session = MockSessionService();
    final model = BitLockerModel(session);

    await model.reboot();
    verify(session.reboot(immediate: true)).called(1);
  });
}
