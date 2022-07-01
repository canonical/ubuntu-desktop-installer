import 'dart:io';

import 'package:args/args.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_server.dart';
import 'package:ubuntu_wsl_setup/routes.dart';
import 'package:ubuntu_wsl_setup/services/platform_capabilities.dart';
import 'package:ubuntu_wsl_setup/services/tcp_socket.dart';
import 'package:ubuntu_wsl_setup/services/journal.dart';
import 'package:flutter_test/flutter_test.dart';

import 'services_test.mocks.dart';

// Groups small tests that would otherwise lead to various small files spread
// in the test directory.
@GenerateMocks([ArgResults, ServerSocket])
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

  group('ubuntu wsl capabilities', () {
    test('defaults', () async {
      final cap = LinuxCapabilities();
      expect(cap.languagesLackingSupport, isNotEmpty);
      expect(cap.requireSlides, isFalse);
      expect(cap.defaultRoute, Routes.selectLanguage);
      final server = await cap.subiquityServer(ServerMode.DRY_RUN);
      expect(server?.endpoint, isNotNull);
      expect(server?.endpoint.port, equals(0));
      expect(server?.process?.command, contains('python'));
    });
  });
  group('win capabilities', () {
    test('defaults', () async {
      final cap = WinCapabilities();
      expect(cap.languagesLackingSupport, isEmpty);
      expect(cap.requireSlides, isTrue);
      expect(cap.defaultRoute, Routes.installationSlides);
    });
    test('reconfigure cli', () async {
      final options = MockArgResults();
      when(options['reconfigure']).thenReturn(true);
      when(options['distro-name']).thenReturn('Ubuntu-Preview');
      final cap = WinCapabilities(options: options);
      expect(cap.languagesLackingSupport, isEmpty);
      expect(cap.requireSlides, isFalse);
    });
    test('no tcp socket', () async {
      IOOverrides.runZoned(
        () async {
          final cap = WinCapabilities();
          expect(await cap.subiquityServer(ServerMode.DRY_RUN), isNull);
        },
        //we'll never get a socket.
        serverSocketBind: (p0, p1,
                {backlog = 0, shared = false, v6Only = false}) =>
            throw const SocketException('under test'),
      );
    });
    test('with tcp socket', () async {
      final socket = MockServerSocket();
      when(socket.port).thenReturn(51432);
      when(socket.close()).thenAnswer((_) async => socket);
      IOOverrides.runZoned(
        () async {
          final cap = WinCapabilities();
          final server = await cap.subiquityServer(ServerMode.DRY_RUN);
          expect(server, isNotNull);
          expect(server!.process!.command, contains('wsl'));
          expect(server.process!.args, contains(contains('--tcp-port')));
        },
        serverSocketBind: (p0, p1,
                {backlog = 0, shared = false, v6Only = false}) async =>
            socket,
      );
    });
  });
}
