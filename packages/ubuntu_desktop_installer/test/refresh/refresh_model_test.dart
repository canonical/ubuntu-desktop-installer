import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/refresh/refresh_model.dart';
import 'package:ubuntu_desktop_installer/services.dart';

import 'refresh_state_test.dart';
import 'refresh_model_test.mocks.dart';

@GenerateMocks([RefreshService])
void main() async {
  test('state listener', () async {
    final controller = StreamController<RefreshState>(sync: true);

    final service = MockRefreshService();
    when(service.state).thenReturn(checking);
    when(service.stateChanged).thenAnswer((_) => controller.stream);
    when(service.check()).thenAnswer((_) async => checking);

    final model = RefreshModel(service);
    expect(model.state, equals(checking));

    await model.init();
    expect(controller.hasListener, isTrue);
    verify(model.check()).called(1);

    when(service.state).thenReturn(done);
    controller.add(done);
    expect(model.state, equals(done));

    model.dispose();
    expect(controller.hasListener, isFalse);
  });

  test('refresh', () async {
    final service = MockRefreshService();

    final model = RefreshModel(service);
    await model.refresh();
    verify(service.refresh()).called(1);
  });
}
