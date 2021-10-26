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

@GenerateMocks([JournalService])
void main() async {
  test('client status query loop', () async {
    final client = MockSubiquityClient();
    final journal = MockJournalService();
    final model = InstallationSlidesModel(client, journal);

    ApplicationState? currentState;
    for (final nextState in ApplicationState.values) {
      when(client.status(current: currentState)).thenAnswer(
        (_) async => ApplicationStatus(state: nextState),
      );
      currentState = nextState;
    }

    final stateChanges = StreamController<ApplicationState>();
    model.addListener(() => stateChanges.add(model.state));

    // initializing the model queries the initial client status, and then runs
    // the client status query loop until it reaches DONE
    await model.init();
    verify(client.status(current: null)).called(1);

    final expectedStateChanges = ApplicationState.values.where((state) {
      return state != ApplicationState.UNKNOWN &&
          state != ApplicationState.ERROR;
    });
    await expectLater(stateChanges.stream, emitsInOrder(expectedStateChanges));
  });

  test('state values', () async {
    final client = MockSubiquityClient();
    ApplicationState? currentState;
    for (final nextState in ApplicationState.values) {
      when(client.status(current: currentState)).thenAnswer(
        (_) async => ApplicationStatus(state: nextState),
      );
      currentState = nextState;
    }

    final journal = MockJournalService();
    final model = InstallationSlidesModel(client, journal);

    expect(model.state, equals(ApplicationState.UNKNOWN));
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

    await waitForState(ApplicationState.STARTING_UP);
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
      (_) async => ApplicationStatus(state: ApplicationState.ERROR),
    );
    when(client.status(current: ApplicationState.ERROR)).thenAnswer(
      (_) async => ApplicationStatus(state: ApplicationState.ERROR),
    );

    final journal = MockJournalService();
    final model = InstallationSlidesModel(client, journal);

    expect(model.hasError, isFalse);

    await model.init();

    expect(model.hasError, isTrue);
  });

  test('reboot', () async {
    TestWidgetsFlutterBinding.ensureInitialized();

    var windowClosed = false;
    final methodChannel = MethodChannel('ubuntu_wizard');
    methodChannel.setMockMethodCallHandler((call) {
      expect(call.method, equals('closeWindow'));
      windowClosed = true;
    });

    final client = MockSubiquityClient();
    final journal = MockJournalService();
    final model = InstallationSlidesModel(client, journal);

    await model.reboot(immediate: true);
    verify(client.reboot(immediate: true)).called(1);
    expect(windowClosed, isTrue);
  });

  test('installation steps', () async {
    final client = MockSubiquityClient();
    when(client.status(current: anyNamed('current'))).thenAnswer(
      (_) async => ApplicationStatus(state: ApplicationState.RUNNING),
    );

    final journal = MockJournalService();
    final model = InstallationSlidesModel(client, journal);
    expect(model.installationStep, equals(-1));
    expect(model.installationStepCount, equals(5));

    await model.init();
    expect(model.installationStep, equals(0));

    when(client.status(current: anyNamed('current'))).thenAnswer(
      (_) async => ApplicationStatus(state: ApplicationState.POST_RUNNING),
    );

    await model.init();
    expect(model.installationStep, equals(2));
  });
}
