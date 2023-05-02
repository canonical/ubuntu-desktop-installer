import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:subiquity_test/subiquity_test.dart';
import 'package:ubuntu_desktop_installer/pages/installation_complete/installation_complete_model.dart';
import 'package:ubuntu_desktop_installer/services/product_service.dart';

import 'installation_complete_model_test.mocks.dart';

@GenerateMocks([ProductService])
void main() async {
  test('reboot', () async {
    final client = MockSubiquityClient();
    final model = InstallationCompleteModel(client, MockProductService());

    await model.reboot();
    verify(client.reboot(immediate: false)).called(1);
  });
}
