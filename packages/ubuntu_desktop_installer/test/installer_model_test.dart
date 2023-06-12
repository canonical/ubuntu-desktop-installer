import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/installer/installer_model.dart';

void main() {
  test('interactive sections', () async {
    final client = MockSubiquityClient();
    when(client.getInteractiveSections()).thenAnswer((_) async => ['a', 'b']);
    when(client.monitorStatus()).thenAnswer((_) => const Stream.empty());

    final model = InstallerModel(client);
    await model.init();

    expect(model.hasRoute('a'), isTrue);
    expect(model.hasRoute('b'), isTrue);
    expect(model.hasRoute('c'), isFalse);
  });

  test('no interactive sections', () async {
    final client = MockSubiquityClient();
    when(client.getInteractiveSections()).thenAnswer((_) async => null);
    when(client.monitorStatus()).thenAnswer((_) => const Stream.empty());

    final model = InstallerModel(client);
    await model.init();

    expect(model.hasRoute('a'), isTrue);
    expect(model.hasRoute('b'), isTrue);
    expect(model.hasRoute('c'), isTrue);
  });
}
