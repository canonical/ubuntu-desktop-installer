import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_provision/src/theme/theme_model.dart';

import 'test_theme.mocks.dart';
export '../test_utils.dart';
export 'test_theme.mocks.dart';

@GenerateMocks([ThemeModel])
ThemeModel buildThemeModel() {
  final model = MockThemeModel();
  when(model.init()).thenAnswer((_) async => true);
  return model;
}
