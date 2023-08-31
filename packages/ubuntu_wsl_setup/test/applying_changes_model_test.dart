import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_wsl_setup/pages/applying_changes/applying_changes_model.dart';

void main() {
  test('The happy path calls back', () async {
    final last = testStatus(ApplicationState.DONE);
    final statuses = <ApplicationStatus>[
      testStatus(ApplicationState.WAITING),
      testStatus(ApplicationState.RUNNING),
      last,
    ];
    final client = MockSubiquityClient();
    final monitor = MockSubiquityStatusMonitor();
    when(monitor.onStatusChanged)
        .thenAnswer((realInvocation) => Stream.fromIterable(statuses));
    when(monitor.status).thenAnswer((_) => statuses[0]);
    final model = ApplyingChangesModel(client, monitor);
    model.init();
    // Forces the stream to emit.
    await expectLater(monitor.onStatusChanged, emitsThrough(last));
    verify(client.reboot(immediate: false)).called(greaterThanOrEqualTo(1));
  });
  test('Never calls back more than once', () async {
    final last = testStatus(ApplicationState.DONE);
    final statuses = <ApplicationStatus>[
      testStatus(ApplicationState.WAITING),
      testStatus(ApplicationState.RUNNING),
      last,
      last,
      last,
    ];
    final client = MockSubiquityClient();
    final monitor = MockSubiquityStatusMonitor();
    when(monitor.onStatusChanged)
        .thenAnswer((realInvocation) => Stream.fromIterable(statuses));
    when(monitor.status).thenAnswer((_) => statuses[0]);
    final model = ApplyingChangesModel(client, monitor);
    model.init();
    // Forces the stream to emit.
    await expectLater(monitor.onStatusChanged, emitsThrough(last));
    verify(client.reboot(immediate: false)).called(1);
  });
  test('Error should also call back', () async {
    final last = testStatus(ApplicationState.ERROR);
    final statuses = <ApplicationStatus>[
      testStatus(ApplicationState.WAITING),
      testStatus(ApplicationState.RUNNING),
      last,
    ];
    final monitor = MockSubiquityStatusMonitor();
    when(monitor.onStatusChanged)
        .thenAnswer((realInvocation) => Stream.fromIterable(statuses));
    when(monitor.status).thenAnswer((_) => statuses[0]);
    final client = MockSubiquityClient();
    final model = ApplyingChangesModel(client, monitor);

    model.init();
    // Forces the stream to emit.
    await expectLater(monitor.onStatusChanged, emitsThrough(last));
    verify(client.reboot(immediate: false)).called(1);
  });
  test('Would never call back if subiquity never finishes or crashes',
      () async {
    final last = testStatus(ApplicationState.RUNNING);
    final statuses = <ApplicationStatus>[
      testStatus(ApplicationState.WAITING),
      testStatus(ApplicationState.RUNNING),
      last,
    ];
    final client = MockSubiquityClient();
    final monitor = MockSubiquityStatusMonitor();
    when(monitor.onStatusChanged)
        .thenAnswer((_) => Stream.fromIterable(statuses));
    when(monitor.status).thenAnswer((_) => statuses[0]);
    final model = ApplyingChangesModel(client, monitor);
    model.init();
    // Forces the stream to emit.
    await expectLater(monitor.onStatusChanged, emitsThrough(last));
    verifyNever(client.reboot(immediate: false));
  });
  test('skip listening if already DONE', () async {
    final done = testStatus(ApplicationState.DONE);
    final client = MockSubiquityClient();
    final monitor = MockSubiquityStatusMonitor();
    when(monitor.status).thenAnswer((_) => done);
    when(monitor.onStatusChanged).thenAnswer((_) => const Stream.empty());
    final model = ApplyingChangesModel(client, monitor);
    model.init();

    verify(client.reboot(immediate: false)).called(1);
    verifyNever(monitor.onStatusChanged);
  });
}

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
