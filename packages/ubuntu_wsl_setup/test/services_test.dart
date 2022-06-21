import 'dart:io';

import 'package:ubuntu_wsl_setup/services/tcp_helpers.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('ensures range is respected', () async {
    // The broader the range, more quickly we should exit the loop.
    const lower = 50000;
    const higher = 60000;
    final socket = await TcpHelperService.getRandomPortSocket(
      lower: lower,
      higher: higher,
    );
    addTearDown(socket!.close);
    expect(socket.port, inExclusiveRange(lower, higher));
  });

  test('wont attempt forever', () async {
    IOOverrides.runZoned(
      () async {
        const lower = 50000;
        const higher = 51000;
        final socket = await TcpHelperService.getRandomPortSocket(
          lower: lower,
          higher: higher,
          maxAttempts: 3,
        );
        //extra precaution in case test fails.
        addTearDown(() => socket?.close());
        expect(socket, isNull);
      },
      //we'll never get a socket.
      serverSocketBind: (p0, p1,
              {backlog = 0, shared = false, v6Only = false}) =>
          throw const SocketException('under test'),
    );
  });
  test('assert in the ephemeral range', () async {
    // The range below is forbidden (outside of the ephemeral port range).
    const lower = 80;
    const higher = 88;
    ServerSocket? socket;
    Future<void> closure() async {
      socket = await TcpHelperService.getRandomPortSocket(
        lower: lower,
        higher: higher,
        maxAttempts: 3,
      );
    }

    //extra precaution in case test fails.
    addTearDown(() => socket?.close());
    expectLater(closure(), throwsAssertionError);
  });
}
