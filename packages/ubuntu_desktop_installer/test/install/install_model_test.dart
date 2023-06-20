import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/pages/install/install_model.dart';
import 'package:ubuntu_desktop_installer/services.dart';

import 'test_install.dart';

void main() async {
  test('product info', () {
    final product = MockProductService();
    when(product.getProductInfo())
        .thenReturn(ProductInfo(name: 'Ubuntu', version: '24.04 LTS'));

    final model = InstallModel(
      MockSubiquityClient(),
      MockJournalService(),
      product,
      MockSessionService(),
    );
    expect(model.productInfo.name, 'Ubuntu');
    expect(model.productInfo.version, '24.04 LTS');
  });

  test('client status query loop', () async {
    final client = MockSubiquityClient();
    final journal = MockJournalService();
    when(journal.start(['log', 'event'], output: JournalOutput.short))
        .thenAnswer((_) => const Stream.empty());
    when(journal.start(['event'], output: JournalOutput.cat))
        .thenAnswer((_) => const Stream.empty());
    final product = MockProductService();
    final session = MockSessionService();
    final model = InstallModel(client, journal, product, session);

    ApplicationState? currentState;
    for (final nextState in ApplicationState.values) {
      when(client.getStatus(current: currentState)).thenAnswer(
        (_) async => testStatus(nextState),
      );
      currentState = nextState;
    }

    final stateChanges = StreamController<ApplicationState?>();
    model.addListener(() => stateChanges.add(model.state));

    // initializing the model queries the initial client status, and then runs
    // the client status query loop until it reaches DONE
    await model.init();
    verify(client.getStatus(current: null)).called(1);

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
      when(client.getStatus(current: currentState)).thenAnswer(
        (_) async => testStatus(nextState),
      );
      currentState = nextState;
    }

    final journal = MockJournalService();
    when(journal.start(['log', 'event'], output: JournalOutput.short))
        .thenAnswer((_) => const Stream.empty());
    when(journal.start(['event'], output: JournalOutput.cat))
        .thenAnswer((_) => const Stream.empty());

    final product = MockProductService();

    final session = MockSessionService();
    final model = InstallModel(client, journal, product, session);

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
    when(client.getStatus()).thenAnswer(
      (_) async => testStatus(ApplicationState.ERROR),
    );
    when(client.getStatus(current: ApplicationState.ERROR)).thenAnswer(
      (_) async => testStatus(ApplicationState.ERROR),
    );

    final journal = MockJournalService();
    when(journal.start(['log', 'event'], output: JournalOutput.short))
        .thenAnswer((_) => const Stream.empty());
    when(journal.start(['event'], output: JournalOutput.cat))
        .thenAnswer((_) => const Stream.empty());

    final product = MockProductService();

    final session = MockSessionService();
    final model = InstallModel(client, journal, product, session);

    expect(model.hasError, isFalse);

    await model.init();

    expect(model.hasError, isTrue);
  });

  test('log visibility', () async {
    final model = InstallModel(
      MockSubiquityClient(),
      MockJournalService(),
      MockProductService(),
      MockSessionService(),
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

  test('reboot', () async {
    final client = MockSubiquityClient();
    final session = MockSessionService();
    final model = InstallModel(
      client,
      MockJournalService(),
      MockProductService(),
      session,
    );

    await model.reboot();
    verify(session.reboot(immediate: false)).called(1);
  });

  test('events', () async {
    final events = StreamController<String>(sync: true);

    final journal = MockJournalService();
    when(journal.start(['log', 'event'], output: JournalOutput.short))
        .thenAnswer((_) => const Stream.empty());
    when(journal.start(['event'], output: JournalOutput.cat))
        .thenAnswer((_) => events.stream);

    final client = MockSubiquityClient();
    when(client.getStatus()).thenAnswer(
      (_) async => testStatus(ApplicationState.RUNNING),
    );
    when(client.getStatus(current: ApplicationState.RUNNING)).thenAnswer(
      (_) async => testStatus(ApplicationState.RUNNING),
    );

    final product = MockProductService();

    final session = MockSessionService();
    final model = InstallModel(client, journal, product, session);

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
