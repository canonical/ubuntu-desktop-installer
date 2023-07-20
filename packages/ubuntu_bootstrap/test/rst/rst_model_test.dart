import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_bootstrap/pages/rst/rst_model.dart';

void main() async {
  test('has rst', () async {
    final client = MockSubiquityClient();
    final model = RstModel(client);

    when(client.hasRst()).thenAnswer((_) async => true);
    expect(await model.hasRst(), isTrue);

    when(client.hasRst()).thenAnswer((_) async => false);
    expect(await model.hasRst(), isFalse);
  });

  test('reboot', () async {
    final client = MockSubiquityClient();
    final model = RstModel(client);

    await model.reboot();
    verify(client.reboot(immediate: true)).called(1);
  });
}
