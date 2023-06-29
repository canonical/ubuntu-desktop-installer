import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_wsl_setup/app_model.dart';
import 'package:ubuntu_wsl_setup/pages/installation_slides/installation_slides_model.dart';

void main() {
  const stdinMsg = ['Hello', 'world', 'this is a test'];

  test('all non-null prevents listening', () async {
    // This behavior enables preventing the slide show from being displayed
    // at all if the server is up and running during model init.
    var mustCall = false;
    final journal = Stream.fromIterable(stdinMsg);
    final monitor = MockSubiquityStatusMonitor();
    when(monitor.status).thenAnswer(
      (_) => testStatus(ApplicationState.WAITING),
    );
    final model = InstallationSlidesModel(journal: journal, monitor: monitor);
    addTearDown(model.dispose);
    model.init(
      current: const AppModel(variant: Variant.WSL_SETUP),
      onServerUp: () => mustCall = true,
    );
    verify(monitor.status);
    verifyNever(monitor.onStatusChanged);
    expect(mustCall, isTrue);
  });
  test('never calls back without variant', () async {
    // that should be associated with some error somewhere else, like in the
    // launcher, so we can detect it instead of displaying slides forever.
    var neverCalls = false;
    final journal = Stream.fromIterable(stdinMsg);
    final monitor = MockSubiquityStatusMonitor();
    when(monitor.status).thenAnswer((_) => null);
    when(monitor.onStatusChanged)
        .thenAnswer((_) => Stream.fromIterable([null]));
    final model = InstallationSlidesModel(journal: journal, monitor: monitor);
    addTearDown(model.dispose);
    model.appModel = const AppModel();
    model.init(onServerUp: () => neverCalls = true);
    verify(monitor.status);
    verify(monitor.onStatusChanged);
    expect(neverCalls, isFalse);
  });
  test('never calls back if server never ready', () async {
    // that should be associated with some error somewhere else, like in the
    // launcher, so we can detect it instead of displaying slides forever.
    var neverCalls = false;
    final journal = Stream.fromIterable(stdinMsg);
    final monitor = MockSubiquityStatusMonitor();
    when(monitor.status).thenAnswer((_) => null);
    when(monitor.onStatusChanged)
        .thenAnswer((_) => Stream.fromIterable([null]));
    final model = InstallationSlidesModel(journal: journal, monitor: monitor);
    addTearDown(model.dispose);
    model.appModel = const AppModel(variant: Variant.WSL_SETUP);
    model.init(onServerUp: () => neverCalls = true);
    verify(monitor.status);
    verify(monitor.onStatusChanged);
    expect(neverCalls, isFalse);
  });
  test('has error due launcher', () async {
    var neverCalls = false;
    const errorMsg = 'Error: file not found';
    final journal =
        Stream.fromIterable(stdinMsg + [errorMsg]).asBroadcastStream();
    final monitor = MockSubiquityStatusMonitor();
    when(monitor.status).thenAnswer((_) => null);
    when(monitor.onStatusChanged)
        .thenAnswer((_) => Stream.fromIterable([null]));
    final model = InstallationSlidesModel(journal: journal, monitor: monitor);
    addTearDown(model.dispose);
    model.init(onServerUp: () => neverCalls = true);
    await expectLater(journal, emitsThrough(errorMsg));
    await expectLater(model.hasError, isTrue);
    verify(monitor.status);
    verify(monitor.onStatusChanged);
    expect(neverCalls, isFalse);
  });
  test('has error due server', () async {
    var neverCall = false;
    final journal = Stream.fromIterable(stdinMsg).asBroadcastStream();
    final monitor = MockSubiquityStatusMonitor();
    final status = testStatus(ApplicationState.ERROR);
    when(monitor.status).thenAnswer((_) => null);
    when(monitor.onStatusChanged).thenAnswer(
      (_) => Stream.fromIterable([null, status]),
    );
    final model = InstallationSlidesModel(journal: journal, monitor: monitor);
    addTearDown(model.dispose);
    model.init(onServerUp: () => neverCall = true);
    await expectLater(journal, emitsThrough(stdinMsg.last));
    verify(monitor.status);
    verify(monitor.onStatusChanged);
    expect(neverCall, isFalse);
    await expectLater(model.hasError, isTrue);
  });
  test('proceedToSetup is terminal', () async {
    var mustCallOnce = 0;
    const journal = Stream<String>.empty();
    final monitor = MockSubiquityStatusMonitor();
    final status = testStatus(ApplicationState.WAITING);
    when(monitor.status).thenAnswer((_) => null);
    when(monitor.onStatusChanged).thenAnswer(
      (_) => Stream.fromIterable([
        null,
        testStatus(ApplicationState.DONE),
        null,
        status,
      ]),
    );
    final model = InstallationSlidesModel(journal: journal, monitor: monitor);
    addTearDown(model.dispose);
    model.appModel = const AppModel(variant: Variant.WSL_SETUP);
    model.init(onServerUp: () => mustCallOnce++);
    await expectLater(monitor.onStatusChanged, emitsThrough(status));
    verify(monitor.status);
    expect(mustCallOnce, equals(1));
  });
  test('is registering', () async {
    var neverCalls = false;
    final journal = Stream.fromIterable(stdinMsg).asBroadcastStream();
    final monitor = MockSubiquityStatusMonitor();
    when(monitor.status).thenAnswer((_) => null);
    when(monitor.onStatusChanged)
        .thenAnswer((_) => Stream.fromIterable([null]));
    final model = InstallationSlidesModel(journal: journal, monitor: monitor);
    addTearDown(model.dispose);
    model.appModel = const AppModel(variant: Variant.WSL_SETUP);
    model.init(onServerUp: () => neverCalls = true);
    await expectLater(journal, emitsThrough(stdinMsg.last));
    await expectLater(model.isRegistering, isTrue);
    verify(monitor.status);
    verify(monitor.onStatusChanged);
    expect(neverCalls, isFalse);
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
