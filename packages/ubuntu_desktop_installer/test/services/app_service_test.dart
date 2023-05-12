import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/services/app_service.dart';
import 'package:ubuntu_desktop_installer/services/storage_service.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

import 'app_service_test.mocks.dart';

@GenerateMocks([StorageService])
void main() {
  group('subiquity', () {
    test('init interactive', () async {
      final storage = MockStorageService();
      registerMockService<StorageService>(storage);

      final client = MockSubiquityClient();
      when(client.monitorStatus()).thenAnswer(
        (_) => Stream.fromIterable([
          fakeApplicationStatus(ApplicationState.STARTING_UP),
          fakeApplicationStatus(ApplicationState.CLOUD_INIT_WAIT),
          fakeApplicationStatus(ApplicationState.EARLY_COMMANDS),
          fakeApplicationStatus(ApplicationState.WAITING, interactive: true),
        ]),
      );
      when(client.getSource()).thenAnswer(
        (_) async => const SourceSelectionAndSetting(
          currentId: '',
          sources: [
            SourceSelection(
              id: 'minimal',
              name: '',
              description: '',
              isDefault: false,
              size: 123,
              variant: '',
            ),
            SourceSelection(
              id: 'normal',
              name: '',
              description: '',
              isDefault: true,
              size: 456,
              variant: '',
            ),
          ],
          searchDrivers: false,
        ),
      );

      final service = InstallerAppService(client);
      await service.init();

      verify(client.getSource()).called(1);
      verify(client.setSource('normal')).called(1);
      verify(client.markConfigured(any)).called(1);
      verify(storage.init()).called(1);
    });

    test('init non-interactive', () async {
      final storage = MockStorageService();
      registerMockService<StorageService>(storage);

      final client = MockSubiquityClient();
      when(client.monitorStatus()).thenAnswer(
        (_) => Stream.fromIterable([
          fakeApplicationStatus(ApplicationState.STARTING_UP),
          fakeApplicationStatus(ApplicationState.CLOUD_INIT_WAIT),
          fakeApplicationStatus(ApplicationState.EARLY_COMMANDS),
          fakeApplicationStatus(ApplicationState.WAITING, interactive: false),
          fakeApplicationStatus(ApplicationState.RUNNING),
        ]),
      );

      final service = InstallerAppService(client);
      await service.init();

      verifyNever(client.getSource());
      verifyNever(client.setSource(any));
      verifyNever(client.markConfigured(any));
      verifyNever(storage.init());
    });

    test('load interactive', () async {
      final client = MockSubiquityClient();
      when(client.monitorStatus()).thenAnswer(
        (_) => Stream.fromIterable([
          fakeApplicationStatus(ApplicationState.STARTING_UP),
          fakeApplicationStatus(ApplicationState.CLOUD_INIT_WAIT),
          fakeApplicationStatus(ApplicationState.EARLY_COMMANDS),
          fakeApplicationStatus(ApplicationState.WAITING, interactive: true),
        ]),
      );

      final service = InstallerAppService(client);
      await expectLater(service.load(), completes);

      verify(client.monitorStatus()).called(1);
    });

    test('load non-interactive', () async {
      final client = MockSubiquityClient();
      when(client.monitorStatus()).thenAnswer(
        (_) => Stream.fromIterable([
          fakeApplicationStatus(ApplicationState.STARTING_UP),
          fakeApplicationStatus(ApplicationState.CLOUD_INIT_WAIT),
          fakeApplicationStatus(ApplicationState.EARLY_COMMANDS),
          fakeApplicationStatus(ApplicationState.WAITING, interactive: false),
          fakeApplicationStatus(ApplicationState.RUNNING),
        ]),
      );

      final service = InstallerAppService(client);
      await expectLater(service.load(), completes);

      verify(client.monitorStatus()).called(1);
    });

    test('load waiting', () async {
      final controller = StreamController<ApplicationStatus>();

      final client = MockSubiquityClient();
      when(client.monitorStatus()).thenAnswer((_) => controller.stream);

      final service = InstallerAppService(client);
      controller.add(fakeApplicationStatus(ApplicationState.STARTING_UP));

      await expectLater(service.load(), doesNotComplete);

      verify(client.monitorStatus()).called(1);
    });

    test('load error', () async {
      final client = MockSubiquityClient();
      when(client.monitorStatus()).thenAnswer(
        (_) => Stream.fromIterable([
          fakeApplicationStatus(ApplicationState.ERROR),
        ]),
      );

      final service = InstallerAppService(client);
      await expectLater(service.load(), completes);

      verify(client.monitorStatus()).called(1);
    });
  });
}
