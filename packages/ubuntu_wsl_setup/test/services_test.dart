import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_wsl_setup/services/journal.dart';
import 'package:ubuntu_wsl_setup/services/tcp_socket.dart';

// Groups small tests that would otherwise lead to various small files spread
// in the test directory.
void main() {
  test('ensures range is respected', () async {
    // The broader the range, more quickly we should exit the loop.
    const lower = 50000;
    const higher = 60000;
    final service = TcpSocketService();
    final socket = await service.getRandomPortSocket(
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
        final service = TcpSocketService();
        final socket = await service.getRandomPortSocket(
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
      final service = TcpSocketService();
      socket = await service.getRandomPortSocket(
        lower: lower,
        higher: higher,
        maxAttempts: 3,
      );
    }

    //extra precaution in case test fails.
    addTearDown(() => socket?.close());
    expectLater(closure(), throwsAssertionError);
  });

  test('journal service always broadcast', () async {
    const stdInMsgs = ['This', 'is', 'a test\n', 'and', 'nothing else'];
    final service = JournalService(source: Stream.fromIterable(stdInMsgs));
    final sub1 = service.stream.listen((event) {});
    final sub2 = service.stream.listen((event) {});
    addTearDown(() {
      sub1.cancel();
      sub2.cancel();
      service.close();
    });
    // Having other listeners should not break this service.
    await expectLater(service.stream, emitsThrough(stdInMsgs.last));
  });

  test('decode', () async {
    const aTest = 'A test';
    final stream =
        Stream.fromIterable([aTest]).transform(systemEncoding.encoder);

    final service = JournalService(source: decode(stream));
    final sub1 = service.stream.listen((event) {});
    addTearDown(() {
      sub1.cancel();
      service.close();
    });
    // Having other listeners should not break this service.
    await expectLater(service.stream, emits(aTest));
  });
}
