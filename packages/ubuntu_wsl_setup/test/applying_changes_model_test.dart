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
    const last = ApplicationStatus(state: ApplicationState.DONE);
    const statuses = <ApplicationStatus>[
      ApplicationStatus(state: ApplicationState.WAITING),
      ApplicationStatus(state: ApplicationState.RUNNING),
      ApplicationStatus(state: ApplicationState.POST_RUNNING),
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
    const last = ApplicationStatus(state: ApplicationState.DONE);
    const statuses = <ApplicationStatus>[
      ApplicationStatus(state: ApplicationState.WAITING),
      ApplicationStatus(state: ApplicationState.RUNNING),
      ApplicationStatus(state: ApplicationState.POST_RUNNING),
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
    const last = ApplicationStatus(state: ApplicationState.ERROR);
    const statuses = <ApplicationStatus>[
      ApplicationStatus(state: ApplicationState.WAITING),
      ApplicationStatus(state: ApplicationState.RUNNING),
      ApplicationStatus(state: ApplicationState.POST_RUNNING),
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
    const last = ApplicationStatus(state: ApplicationState.POST_RUNNING);
    const statuses = <ApplicationStatus>[
      ApplicationStatus(state: ApplicationState.WAITING),
      ApplicationStatus(state: ApplicationState.POST_WAIT),
      ApplicationStatus(state: ApplicationState.RUNNING),
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
