import 'dart:async';

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
  test('client status query loop', () async {
    final client = MockSubiquityClient();
    final journal = MockJournalService();
    when(journal.start('log', output: JournalOutput.short))
        .thenAnswer((_) => Stream.empty());
    when(journal.start('event', output: JournalOutput.cat))
        .thenAnswer((_) => Stream.empty());
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
    when(journal.start('log', output: JournalOutput.short))
        .thenAnswer((_) => Stream.empty());
    when(journal.start('event', output: JournalOutput.cat))
        .thenAnswer((_) => Stream.empty());

    final model = InstallationSlidesModel(client, journal);

    expect(model.state, isNull);
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
    expect(model.isInstalling, isFalse);
    expect(model.isDone, isFalse);

    await waitForState(ApplicationState.RUNNING);
    expect(model.isInstalling, isTrue);
    expect(model.isDone, isFalse);

    await waitForState(ApplicationState.DONE);
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
    when(journal.start('log', output: JournalOutput.short))
        .thenAnswer((_) => Stream.empty());
    when(journal.start('event', output: JournalOutput.cat))
        .thenAnswer((_) => Stream.empty());

    final model = InstallationSlidesModel(client, journal);

    expect(model.hasError, isFalse);

    await model.init();

    expect(model.hasError, isTrue);
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

  test('events', () async {
    final events = StreamController<String>(sync: true);

    final journal = MockJournalService();
    when(journal.start('log', output: JournalOutput.short))
        .thenAnswer((_) => Stream.empty());
    when(journal.start('event', output: JournalOutput.cat))
        .thenAnswer((_) => events.stream);

    final client = MockSubiquityClient();
    when(client.status()).thenAnswer(
      (_) async => testStatus(ApplicationState.RUNNING),
    );
    when(client.status(current: ApplicationState.RUNNING)).thenAnswer(
      (_) async => testStatus(ApplicationState.RUNNING),
    );

    final model = InstallationSlidesModel(client, journal);

    expect(model.event.action, InstallationAction.none);

    await model.init();

    events.add('installing system');
    expect(model.event.action, InstallationAction.installingSystem);
    expect(model.event.description, isNull);

    events.add('  installing some package');
    expect(model.event.action, InstallationAction.installingSystem);
    expect(model.event.description, 'installing some package');

    events.add('  doing something else');
    expect(model.event.action, InstallationAction.installingSystem);
    expect(model.event.description, 'doing something else');

    events.add('final system configuration');
    expect(model.event.action, InstallationAction.configuringSystem);
    expect(model.event.description, isNull);

    events.add('  subiquity/Install/install/curtin_install: installing system');
    expect(model.event.action, InstallationAction.installingSystem);
    expect(model.event.description, isNull);

    events.add(
        '    subiquity/Install/install/curtin_install/run: executing curtin install initial step');
    expect(model.event.action, InstallationAction.installingSystem);
    expect(model.event.description, 'executing curtin install initial step');
  });
}

ApplicationStatus testStatus(ApplicationState state) {
  return ApplicationStatus(
    state: state,
    cloudInitOk: null,
    confirmingTty: '',
    echoSyslogId: '',
    error: null,
    eventSyslogId: 'event',
    interactive: null,
    logSyslogId: 'log',
  );
}
