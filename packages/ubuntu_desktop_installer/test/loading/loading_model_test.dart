import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/loading/loading_model.dart';
import 'package:ubuntu_desktop_installer/services/app_service.dart';

import 'loading_model_test.mocks.dart';

@GenerateMocks([AppService])
void main() {
  test('load', () async {
    final service = MockAppService();

    final model = LoadingModel(service);
    await model.init();

    verify(service.load()).called(1);
  });
}
