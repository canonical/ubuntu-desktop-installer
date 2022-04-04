import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/src/http_unix_client.dart';
import 'package:subiquity_client/src/status_monitor.dart';
import 'package:subiquity_client/src/types.dart';
import 'package:test/test.dart';

import 'status_monitor_test.mocks.dart';

final noStatus = Uri.http('localhost', 'meta/status', {});
final wasWaiting = Uri.http('localhost', 'meta/status', {'cur': '"WAITING"'});
final wasRunning = Uri.http('localhost', 'meta/status', {'cur': '"RUNNING"'});
final wasDone = Uri.http('localhost', 'meta/status', {'cur': '"DONE"'});

const isWaiting = ApplicationStatus(state: ApplicationState.WAITING);
const isRunning = ApplicationStatus(state: ApplicationState.RUNNING);
const isDone = ApplicationStatus(state: ApplicationState.DONE);

@GenerateMocks([HttpUnixClient])
void main() {
  group('start', () {
    test('before listen', () async {
      final client = createMockClient();
      final monitor = SubiquityStatusMonitor(client);

      // start first
      await monitor.start('/tmp/subiquity.sock');
      expect(monitor.status, equals(isWaiting));
      verify(client.send(argThat(isRequest(noStatus)))).called(1);

      // then listen
      await expectLater(
          monitor.onStatusChanged, emitsInOrder([isRunning, isDone]));
      verify(client.send(argThat(isRequest(wasWaiting)))).called(1);
      verify(client.send(argThat(isRequest(wasRunning)))).called(1);
      verify(client.send(argThat(isRequest(wasDone)))).called(1);
    });

    test('after listen', () async {
      final client = createMockClient();
      final monitor = SubiquityStatusMonitor(client);

      // listen first
      final statuses = <ApplicationStatus?>[];
      monitor.onStatusChanged.listen(statuses.add);

      // then start
      await monitor.start('/tmp/subiquity.sock');
      expect(monitor.status, equals(isWaiting));
      verify(client.send(argThat(isRequest(noStatus)))).called(1);

      await expectLater(
          monitor.onStatusChanged, emitsInOrder([isRunning, isDone]));
      verify(client.send(argThat(isRequest(wasWaiting)))).called(1);
      verify(client.send(argThat(isRequest(wasRunning)))).called(1);
      verify(client.send(argThat(isRequest(wasDone)))).called(1);
      expect(statuses, equals([isWaiting, isRunning, isDone]));
    });
  });

  test('stop', () async {
    final client = createMockClient();
    final monitor = SubiquityStatusMonitor(client);

    await monitor.start('/tmp/subiquity.sock');
    expect(monitor.status, equals(isWaiting));
    await expectLater(monitor.onStatusChanged, emits(isRunning));
    verify(client.send(any)).called(isPositive);

    // no changes after stop
    await monitor.stop();
    await expectLater(monitor.onStatusChanged, neverEmits(isDone));
    verifyNever(client.send(any));
  });

  test('error', () async {
    final client = MockHttpUnixClient();
    when(client.send(argThat(isRequest(noStatus))))
        .thenAnswer((_) async => statusResponse(isWaiting));
    when(client.send(argThat(isRequest(wasWaiting))))
        .thenAnswer((_) async => statusResponse(isRunning));
    when(client.send(argThat(isRequest(wasRunning))))
        .thenAnswer((_) async => errorResponse());

    final monitor = SubiquityStatusMonitor(client);

    await monitor.start('/tmp/subiquity.sock');
    expect(monitor.status, equals(isWaiting));
    await expectLater(
        monitor.onStatusChanged, emitsInOrder([isRunning, isNull]));
  });
}

// null -> waiting -> running -> done
MockHttpUnixClient createMockClient() {
  final client = MockHttpUnixClient();
  when(client.send(argThat(isRequest(noStatus))))
      .thenAnswer((_) async => statusResponse(isWaiting));
  when(client.send(argThat(isRequest(wasWaiting))))
      .thenAnswer((_) async => statusResponse(isRunning));
  when(client.send(argThat(isRequest(wasRunning))))
      .thenAnswer((_) async => statusResponse(isDone));
  when(client.send(argThat(isRequest(wasDone))))
      .thenAnswer((_) async => neverResponse());
  return client;
}

StreamedResponse statusResponse(ApplicationStatus status) {
  final data = jsonEncode(status.toJson()).codeUnits;
  return StreamedResponse(Stream.value(data), 200);
}

StreamedResponse errorResponse([String error = '']) {
  return StreamedResponse(Stream.value(error.codeUnits), 500);
}

Future<StreamedResponse> neverResponse() {
  return Completer<StreamedResponse>().future;
}

class RequestMatcher extends Matcher {
  const RequestMatcher(this.url);
  final Uri url;
  @override
  bool matches(covariant Request request, Map matchState) => request.url == url;
  @override
  Description describe(Description description) => description.add('$url');
}

Matcher isRequest(Uri expected) => RequestMatcher(expected);
