import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_test/mocks.dart';
import 'package:ubuntu_wsl_setup/pages/configuration_ui/configuration_ui_model.dart';

void main() {
  test('load UI configuration', () async {
    const conf = WSLConfigurationAdvanced(
      interopGuiintegration: true,
      interopAudiointegration: true,
      interopAdvancedipdetection: true,
      motdWSLnewsenabled: false,
      automountEnabled: false,
      automountMountfstab: false,
    );

    final client = MockSubiquityClient();
    when(client.wslConfigurationAdvanced()).thenAnswer((_) async => conf);

    final model = ConfigurationUIModel(client);
    await model.loadConfiguration();
    verify(client.wslConfigurationAdvanced()).called(1);

    expect(model.interopGuiintegration, equals(conf.interopGuiintegration));
    expect(model.interopAudiointegration, equals(conf.interopAudiointegration));
    expect(model.advancedIPDetection, equals(conf.interopAdvancedipdetection));
    expect(model.motdWSLnewsenabled, equals(conf.motdWSLnewsenabled));
  });

  test('save UI configuration', () async {
    TestWidgetsFlutterBinding.ensureInitialized();

    final client = MockSubiquityClient();

    final model = ConfigurationUIModel(client);
    model.interopGuiintegration = true;
    model.interopAudiointegration = true;
    model.advancedIPDetection = true;
    model.motdWSLnewsenabled = false;
    model.automountEnabled = false;
    model.automountMountfstab = false;

    final conf = WSLConfigurationAdvanced(
      interopGuiintegration: true,
      interopAudiointegration: true,
      interopAdvancedipdetection: true,
      motdWSLnewsenabled: false,
      automountEnabled: false,
      automountMountfstab: false,
    );

    var windowClosed = false;
    final methodChannel = MethodChannel('ubuntu_wizard');
    methodChannel.setMockMethodCallHandler((call) {
      expect(call.method, equals('closeWindow'));
      windowClosed = true;
    });

    await model.saveConfiguration();
    verify(client.setWslConfigurationAdvanced(conf)).called(1);
    expect(windowClosed, isTrue);
  });

  test('notify changes', () {
    final model = ConfigurationUIModel(MockSubiquityClient());

    var wasNotified = false;
    model.addListener(() => wasNotified = true);

    wasNotified = false;
    expect(model.interopGuiintegration, isFalse);
    model.interopGuiintegration = true;
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.interopAudiointegration, isFalse);
    model.interopAudiointegration = true;
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.advancedIPDetection, isFalse);
    model.advancedIPDetection = true;
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.motdWSLnewsenabled, isTrue);
    model.motdWSLnewsenabled = false;
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.automountEnabled, isTrue);
    model.automountEnabled = false;
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.automountMountfstab, isTrue);
    model.automountMountfstab = false;
    expect(wasNotified, isTrue);
  });

  test('validation', () {
    final model = ConfigurationUIModel(MockSubiquityClient());
    expect(model.isValid, isTrue);
  });
}
