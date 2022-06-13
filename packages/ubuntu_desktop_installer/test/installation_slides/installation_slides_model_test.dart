import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages/installation_slides/installation_slides_model.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_test/mocks.dart';

import 'installation_slides_model_test.mocks.dart';

// ignore_for_file: type=lint

@GenerateMocks([JournalService])
void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  final methodChannel = MethodChannel('window_manager');

  setUp(() {
    methodChannel.setMockMethodCallHandler((_) async {});
  });

  test('client status query loop', () async {
    final client = MockSubiquityClient();
    final journal = MockJournalService();
    final model = InstallationSlidesModel(client, journal);

    ApplicationState? currentState;
    for (final nextState in ApplicationState.values) {
      when(client.status(current: currentState)).thenAnswer(
        (_) async => testStatus(nextState),
      );
      currentState = nextState;
    }

    final stateChanges = StreamController<ApplicationState?>();
    model.addListener(() => stateChanges.add(model.state));

    // initializing the model queries the initial client status, and then runs
    // the client status query loop until it reaches DONE
    await model.init();
    verify(client.status(current: null)).called(1);

    final expectedStateChanges = ApplicationState.values.where((state) {
      return state != ApplicationState.ERROR &&
          state != ApplicationState.EXITED;
    });
    await expectLater(stateChanges.stream, emitsInOrder(expectedStateChanges));
  });

  test('state values', () async {
    final client = MockSubiquityClient();
    ApplicationState? currentState;
    for (final nextState in ApplicationState.values) {
      when(client.status(current: currentState)).thenAnswer(
        (_) async => testStatus(nextState),
      );
      currentState = nextState;
    }

    final journal = MockJournalService();
    final model = InstallationSlidesModel(client, journal);

    expect(model.state, isNull);
    expect(model.isPreparing, isFalse);
    expect(model.isInstalling, isFalse);
    expect(model.isDone, isFalse);

    Future<void> waitForState(ApplicationState state) async {
      final completer = Completer();
      model.addListener(() {
        if (model.state == state) {
          completer.complete();
        }
      });
      await expectLater(completer.future, completes);
    }

    await model.init();

    expect(model.state, ApplicationState.STARTING_UP);
    expect(model.isPreparing, isTrue);
    expect(model.isInstalling, isFalse);
    expect(model.isDone, isFalse);

    await waitForState(ApplicationState.RUNNING);
    expect(model.isPreparing, isFalse);
    expect(model.isInstalling, isTrue);
    expect(model.isDone, isFalse);

    await waitForState(ApplicationState.DONE);
    expect(model.isPreparing, isFalse);
    expect(model.isInstalling, isFalse);
    expect(model.isDone, isTrue);
  });

  test('error state', () async {
    final client = MockSubiquityClient();
    when(client.status()).thenAnswer(
      (_) async => testStatus(ApplicationState.ERROR),
    );
    when(client.status(current: ApplicationState.ERROR)).thenAnswer(
      (_) async => testStatus(ApplicationState.ERROR),
    );

    final journal = MockJournalService();
    final model = InstallationSlidesModel(client, journal);

    expect(model.hasError, isFalse);

    await model.init();

    expect(model.hasError, isTrue);
  });

  test('reboot', () async {
    var windowClosed = false;
    methodChannel.setMockMethodCallHandler((call) async {
      expect(call.method, equals('close'));
      windowClosed = true;
    });

    final client = MockSubiquityClient();
    final journal = MockJournalService();
    final model = InstallationSlidesModel(client, journal);

    await model.reboot(immediate: true);
    verify(client.reboot(immediate: true)).called(1);
    expect(windowClosed, isTrue);
  });

  test('log visibility', () async {
    final model = InstallationSlidesModel(
      MockSubiquityClient(),
      MockJournalService(),
    );
    expect(model.isLogVisible, isFalse);

    var wasNotified = 0;
    model.addListener(() => ++wasNotified);

    model.toggleLogVisibility();
    expect(model.isLogVisible, isTrue);
    expect(wasNotified, equals(1));

    model.toggleLogVisibility();
    expect(model.isLogVisible, isFalse);
    expect(wasNotified, equals(2));
  });

  test('installation steps', () async {
    final client = MockSubiquityClient();
    when(client.status(current: anyNamed('current'))).thenAnswer(
      (_) async => testStatus(ApplicationState.RUNNING),
    );

    final journal = MockJournalService();
    final model = InstallationSlidesModel(client, journal);
    expect(model.installationStep, equals(-1));
    expect(model.installationStepCount, equals(5));

    await model.init();
    expect(model.installationStep, equals(0));

    when(client.status(current: anyNamed('current'))).thenAnswer(
      (_) async => testStatus(ApplicationState.POST_RUNNING),
    );

    await model.init();
    expect(model.installationStep, equals(2));
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
