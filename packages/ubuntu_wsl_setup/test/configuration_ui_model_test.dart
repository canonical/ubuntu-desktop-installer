import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_wsl_setup/pages/configuration_ui/configuration_ui_model.dart';

// ignore_for_file: type=lint

void main() {
  test('load UI configuration', () async {
    const conf = WSLConfigurationAdvanced(
      interopEnabled: true,
      interopAppendwindowspath: true,
      automountEnabled: false,
      automountMountfstab: false,
    );

    final client = MockSubiquityClient();
    when(client.wslConfigurationAdvanced()).thenAnswer((_) async => conf);

    final model = ConfigurationUIModel(client);
    await model.loadConfiguration();
    verify(client.wslConfigurationAdvanced()).called(1);

    expect(model.interopEnabled, equals(conf.interopEnabled));
    expect(
        model.interopAppendwindowspath, equals(conf.interopAppendwindowspath));
    expect(model.automountEnabled, equals(conf.automountEnabled));
    expect(model.automountMountfstab, equals(conf.automountMountfstab));
  });

  test('save UI configuration', () async {
    final client = MockSubiquityClient();

    final model = ConfigurationUIModel(client);
    model.interopEnabled = true;
    model.interopAppendwindowspath = true;
    model.automountEnabled = false;
    model.automountMountfstab = false;

    final conf = WSLConfigurationAdvanced(
      interopEnabled: true,
      interopAppendwindowspath: true,
      automountEnabled: false,
      automountMountfstab: false,
    );

    await model.saveConfiguration();
    verify(client.setWslConfigurationAdvanced(conf)).called(1);
  });

  test('notify changes', () {
    final model = ConfigurationUIModel(MockSubiquityClient());

    var wasNotified = false;
    model.addListener(() => wasNotified = true);

    wasNotified = false;
    expect(model.interopEnabled, isTrue);
    model.interopEnabled = false;
    expect(wasNotified, isTrue);

    wasNotified = false;
    expect(model.interopAppendwindowspath, isTrue);
    model.interopAppendwindowspath = false;
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
