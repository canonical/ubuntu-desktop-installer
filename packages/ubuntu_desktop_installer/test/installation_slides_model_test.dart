import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/pages/installation_slides/installation_slides_model.dart';

import 'installation_slides_model_test.mocks.dart';

@GenerateMocks([SubiquityClient])
void main() async {
  test('status', () async {
    final client = MockSubiquityClient();
    when(client.status()).thenAnswer(
      (_) async => ApplicationStatus(state: ApplicationState.RUNNING),
    );
    when(client.status(current: ApplicationState.RUNNING)).thenAnswer(
      (_) async => ApplicationStatus(state: ApplicationState.DONE),
    );

    final model = InstallationSlidesModel(client);

    expect(model.isDone, isFalse);
    expect(model.isUnknown, isTrue);
    expect(model.isInstalling, isTrue);

    await model.init();

    expect(model.isDone, isFalse);
    expect(model.isUnknown, isFalse);
    expect(model.isInstalling, isTrue);
    verify(client.status(current: null)).called(1);

    final wasNotified = Completer<bool>();
    model.addListener(() => wasNotified.complete(true));
    await expectLater(wasNotified.future, completes);

    expect(model.isDone, isTrue);
    expect(model.isUnknown, isFalse);
    expect(model.isInstalling, isFalse);
  });

  test('error', () async {
    final client = MockSubiquityClient();
    when(client.status()).thenAnswer(
      (_) async => ApplicationStatus(state: ApplicationState.ERROR),
    );
    when(client.status(current: ApplicationState.ERROR)).thenAnswer(
      (_) async => ApplicationStatus(state: ApplicationState.ERROR),
    );

    final model = InstallationSlidesModel(client);

    expect(model.hasError, isFalse);

    await model.init();

    expect(model.hasError, isTrue);
  });

  test('reboot', () async {
    final client = MockSubiquityClient();
    when(client.reboot()).thenAnswer((_) async => null);

    final model = InstallationSlidesModel(client);
    await model.reboot();
    verify(client.reboot()).called(1);
  });

  test('steps', () async {
    final client = MockSubiquityClient();
    when(client.status(current: anyNamed('current'))).thenAnswer(
      (_) async => ApplicationStatus(state: ApplicationState.RUNNING),
    );

    final model = InstallationSlidesModel(client);
    await model.init();

    expect(model.currentStep, equals(4));
    expect(model.totalSteps, equals(9));
  });
}
