import 'package:ubuntu_wsl_setup/services/tcp_helpers.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('ensures range is respected', () async {
    // The broader the range, more quickly we should exit the loop.
    const lower = 50000;
    const higher = 60000;
    final socket = await getSocketHolder(lower: lower, higher: higher);
    addTearDown(socket!.close);
    expect(socket.port, inExclusiveRange(lower, higher));
  });

  test('wont attempt forever', () async {
    // The range below is forbidden (outside of the ephemeral port range).
    const lower = 80;
    const higher = 88;
    final socket = await getSocketHolder(
      lower: lower,
      higher: higher,
      maxAttempts: 3,
    );
    //extra precaution in case test fails.
    addTearDown(() => socket?.close());
    expect(socket, isNull);
  });
}
