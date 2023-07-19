import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_bootstrap/pages/loading/loading_model.dart';

import 'test_loading.dart';

void main() {
  test('load', () async {
    final service = MockInstallerService();

    final model = LoadingModel(service);
    await model.init();

    verify(service.load()).called(1);
  });
}
