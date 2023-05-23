import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/loading/loading_model.dart';

import 'test_loading.dart';

void main() {
  test('load', () async {
    final service = MockAppService();

    final model = LoadingModel(service);
    await model.init();

    verify(service.load()).called(1);
  });
}
