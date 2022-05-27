import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wsl_setup/pages/applying_changes/applying_changes_model.dart';

import 'applying_changes_model_test.mocks.dart';

@GenerateMocks([IOSink, SubiquityStatusMonitor])
void main() {
  test('The happy path calls back', () async {
    final last = testStatus(ApplicationState.DONE);
    final statuses = <ApplicationStatus>[
      testStatus(ApplicationState.WAITING),
      testStatus(ApplicationState.RUNNING),
      testStatus(ApplicationState.POST_RUNNING),
      last,
    ];
    final monitor = MockSubiquityStatusMonitor();
    when(monitor.onStatusChanged)
        .thenAnswer((realInvocation) => Stream.fromIterable(statuses));
    final model = ApplyingChangesModel(monitor);
    var calledBack = false;
    model.init(onDoneTransition: () => calledBack = true);
    // Forces the stream to emit.
    await expectLater(monitor.onStatusChanged, emitsThrough(last));
    await expectLater(calledBack, isTrue);
  });
  test('Never calls back more than once', () async {
    final last = testStatus(ApplicationState.DONE);
    final statuses = <ApplicationStatus>[
      testStatus(ApplicationState.WAITING),
      testStatus(ApplicationState.RUNNING),
      testStatus(ApplicationState.POST_RUNNING),
      last,
      last,
      last,
    ];
    final monitor = MockSubiquityStatusMonitor();
    when(monitor.onStatusChanged)
        .thenAnswer((realInvocation) => Stream.fromIterable(statuses));
    final model = ApplyingChangesModel(monitor);
    var calledBackCount = 0;
    model.init(onDoneTransition: () => calledBackCount++);
    // Forces the stream to emit.
    await expectLater(monitor.onStatusChanged, emitsThrough(last));
    await expectLater(calledBackCount, 1);
  });
  test('Error should also call back', () async {
    final last = testStatus(ApplicationState.ERROR);
    final statuses = <ApplicationStatus>[
      testStatus(ApplicationState.WAITING),
      testStatus(ApplicationState.RUNNING),
      testStatus(ApplicationState.POST_RUNNING),
      last,
    ];
    final monitor = MockSubiquityStatusMonitor();
    when(monitor.onStatusChanged)
        .thenAnswer((realInvocation) => Stream.fromIterable(statuses));
    final model = ApplyingChangesModel(monitor);
    var calledBack = false;
    model.init(onDoneTransition: () => calledBack = true);
    // Forces the stream to emit.
    await expectLater(monitor.onStatusChanged, emitsThrough(last));
    await expectLater(calledBack, isTrue);
  });
  test('Would never call back if subiquity never finishes or crashes',
      () async {
    final last = testStatus(ApplicationState.POST_RUNNING);
    final statuses = <ApplicationStatus>[
      testStatus(ApplicationState.WAITING),
      testStatus(ApplicationState.POST_WAIT),
      testStatus(ApplicationState.RUNNING),
      last,
    ];
    final monitor = MockSubiquityStatusMonitor();
    when(monitor.onStatusChanged)
        .thenAnswer((_) => Stream.fromIterable(statuses));
    final model = ApplyingChangesModel(monitor);
    var calledBack = false;
    model.init(onDoneTransition: () => calledBack = true);
    // Forces the stream to emit.
    await expectLater(monitor.onStatusChanged, emitsThrough(last));
    await expectLater(calledBack, isFalse);
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
