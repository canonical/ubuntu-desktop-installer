import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_test/mocks.dart';
import 'package:ubuntu_wsl_setup/pages/setup_complete/setup_complete_model.dart';

void main() {
  test('init model', () async {
    const identity = IdentityData(username: 'ubuntu');

    final client = MockSubiquityClient();
    when(client.identity()).thenAnswer((_) async => identity);

    final model = SetupCompleteModel(client);
    await model.init();
    verify(client.identity()).called(1);

    expect(model.username, equals(identity.username));
  });

  test('reboot', () async {
    final client = MockSubiquityClient();
    final model = SetupCompleteModel(client);

    var exited = false;
    await model.reboot(exit: (_) => exited = true);
    verify(client.reboot()).called(1);
    expect(exited, isTrue);
  });

  test('notify changes', () async {
    const identity = IdentityData(username: 'ubuntu');

    final client = MockSubiquityClient();
    when(client.identity()).thenAnswer((_) async => identity);

    final model = SetupCompleteModel(client);

    var wasNotified = false;
    model.addListener(() => wasNotified = true);

    await model.init();

    expect(model.username, equals('ubuntu'));
    expect(wasNotified, isTrue);
  });
}
