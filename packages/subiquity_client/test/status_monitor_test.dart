import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/src/endpoint.dart';
import 'package:subiquity_client/src/status_monitor.dart';
import 'package:subiquity_client/src/types.dart';
import 'package:test/test.dart';

import 'status_monitor_test.mocks.dart';

final noStatus = Uri.http('localhost', 'meta/status', {});
final wasWaiting = Uri.http('localhost', 'meta/status', {'cur': '"WAITING"'});
final wasRunning = Uri.http('localhost', 'meta/status', {'cur': '"RUNNING"'});
final wasDone = Uri.http('localhost', 'meta/status', {'cur': '"DONE"'});

ApplicationStatus testStatus(ApplicationState state) {
  return ApplicationStatus(
    state: state,
    cloudInitOk: null,
    confirmingTty: '',
    echoSyslogId: '',
    error: null,
    eventSyslogId: '',
    interactive: null,
    logSyslogId: '',
  );
}

final isWaiting = testStatus(ApplicationState.WAITING);
final isRunning = testStatus(ApplicationState.RUNNING);
final isDone = testStatus(ApplicationState.DONE);

@GenerateMocks([HttpClient, HttpClientRequest, HttpClientResponse])
void main() {
  final addr = Endpoint.unix('/tmp/subiquity.sock');
  group('start', () {
    test('before listen', () async {
      final client = createMockClient();
      final monitor = SubiquityStatusMonitor(client);

      // start first
      await monitor.start(addr);
      expect(monitor.status, equals(isWaiting));
      verify(client.openUrl('GET', noStatus)).called(1);

      // then listen
      await expectLater(
          monitor.onStatusChanged, emitsInOrder([isRunning, isDone]));
      verify(client.openUrl('GET', wasWaiting)).called(1);
      verify(client.openUrl('GET', wasRunning)).called(1);
      verify(client.openUrl('GET', wasDone)).called(1);
    });

    test('after listen', () async {
      final client = createMockClient();
      final monitor = SubiquityStatusMonitor(client);

      // listen first
      final statuses = <ApplicationStatus?>[];
      monitor.onStatusChanged.listen(statuses.add);

      // then start
      await monitor.start(addr);
      expect(monitor.status, equals(isWaiting));
      verify(client.openUrl('GET', noStatus)).called(1);

      await expectLater(
          monitor.onStatusChanged, emitsInOrder([isRunning, isDone]));
      verify(client.openUrl('GET', wasWaiting)).called(1);
      verify(client.openUrl('GET', wasRunning)).called(1);
      verify(client.openUrl('GET', wasDone)).called(1);
      expect(statuses, equals([isWaiting, isRunning, isDone]));
    });
  });

  test('stop', () async {
    final client = createMockClient();
    final monitor = SubiquityStatusMonitor(client);

    await monitor.start(addr);
    expect(monitor.status, equals(isWaiting));
    await expectLater(monitor.onStatusChanged, emits(isRunning));
    verify(client.openUrl('GET', any)).called(isPositive);

    // no changes after stop
    await monitor.stop();
    await expectLater(monitor.onStatusChanged, neverEmits(isDone));
    verifyNever(client.openUrl('GET', any));
  });

  test('error', () async {
    final client = MockHttpClient();
    when(client.openUrl('GET', noStatus))
        .thenAnswer((_) async => statusResponse(isWaiting));
    when(client.openUrl('GET', wasWaiting))
        .thenAnswer((_) async => statusResponse(isRunning));
    when(client.openUrl('GET', wasRunning))
        .thenAnswer((_) async => errorResponse());

    final monitor = SubiquityStatusMonitor(client);

    await monitor.start(addr);
    expect(monitor.status, equals(isWaiting));
    await expectLater(
        monitor.onStatusChanged, emitsInOrder([isRunning, isNull]));
  });
}

// null -> waiting -> running -> done
MockHttpClient createMockClient() {
  final client = MockHttpClient();
  when(client.openUrl('GET', noStatus))
      .thenAnswer((_) async => statusResponse(isWaiting));
  when(client.openUrl('GET', wasWaiting))
      .thenAnswer((_) async => statusResponse(isRunning));
  when(client.openUrl('GET', wasRunning))
      .thenAnswer((_) async => statusResponse(isDone));
  when(client.openUrl('GET', wasDone)).thenAnswer((_) async => neverResponse());
  return client;
}

HttpClientRequest statusResponse(ApplicationStatus status) {
  return mockResponse(200, jsonEncode(status.toJson()));
}

HttpClientRequest errorResponse([String error = '']) {
  return mockResponse(500, error);
}

HttpClientRequest mockResponse(int statusCode, String data) {
  final response = MockHttpClientResponse();
  when(response.statusCode).thenReturn(statusCode);
  when(response.transform(utf8.decoder)).thenAnswer((_) => Stream.value(data));

  final request = MockHttpClientRequest();
  when(request.close()).thenAnswer((_) async => response);
  return request;
}

Future<HttpClientRequest> neverResponse() {
  return Completer<HttpClientRequest>().future;
}
