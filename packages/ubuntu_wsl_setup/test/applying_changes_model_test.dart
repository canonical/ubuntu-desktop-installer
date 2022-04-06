import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_wsl_setup/pages/applying_changes/applying_changes_model.dart';

import 'applying_changes_model_test.mocks.dart';

@GenerateMocks([IOSink, SubiquityStatusMonitor])
void main() {
  test('The happy path', () async {
    const statuses = <ApplicationStatus>[
      ApplicationStatus(state: ApplicationState.WAITING),
      ApplicationStatus(state: ApplicationState.RUNNING),
      ApplicationStatus(state: ApplicationState.POST_RUNNING),
      ApplicationStatus(state: ApplicationState.DONE),
    ];
    final monitor = MockSubiquityStatusMonitor();
    when(monitor.onStatusChanged)
        .thenAnswer((realInvocation) => Stream.fromIterable(statuses));
    final model = ApplyingChangesModel(monitor);
    expect(model.isInstalling(), emitsInOrder([true, true, true, false]));
  });
  test('Error should not block', () async {
    const statuses = <ApplicationStatus>[
      ApplicationStatus(state: ApplicationState.WAITING),
      ApplicationStatus(state: ApplicationState.RUNNING),
      ApplicationStatus(state: ApplicationState.POST_RUNNING),
      ApplicationStatus(state: ApplicationState.ERROR),
    ];
    final monitor = MockSubiquityStatusMonitor();
    when(monitor.onStatusChanged)
        .thenAnswer((realInvocation) => Stream.fromIterable(statuses));
    final model = ApplyingChangesModel(monitor);
    expect(model.isInstalling(), emitsInOrder([true, true, true, false]));
  });
  test('Would loop forever if subiquity never finish or crash', () async {
    const statuses = <ApplicationStatus>[
      ApplicationStatus(state: ApplicationState.WAITING),
      ApplicationStatus(state: ApplicationState.POST_WAIT),
      ApplicationStatus(state: ApplicationState.RUNNING),
      ApplicationStatus(state: ApplicationState.POST_RUNNING),
    ];
    final monitor = MockSubiquityStatusMonitor();
    when(monitor.onStatusChanged)
        .thenAnswer((realInvocation) => Stream.fromIterable(statuses));
    final model = ApplyingChangesModel(monitor);
    expect(model.isInstalling(), neverEmits(false));
  });
}
