import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/connect_model.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/connect_to_internet_model.dart';

import 'connect_to_internet_model_test.mocks.dart';

@GenerateMocks([ConnectModel])
void main() {
  test('no model selected', () {
    final model = ConnectToInternetModel();
    expect(model.connectMode, isNull);
    expect(model.canContinue, isFalse);
    expect(model.canConnect, isFalse);
    expect(model.isBusy, isFalse);
  });

  test('selected model', () {
    final model = ConnectToInternetModel();
    final mock = MockConnectModel();
    model.select(mock);

    when(mock.connectMode).thenReturn(ConnectMode.none);
    expect(model.connectMode, equals(ConnectMode.none));

    when(mock.canContinue).thenReturn(true);
    expect(model.canContinue, isTrue);

    when(mock.canConnect).thenReturn(true);
    expect(model.canConnect, isTrue);

    when(mock.isBusy).thenReturn(true);
    expect(model.isBusy, isTrue);

    when(mock.init()).thenAnswer((_) {});
    model.init();
    verify(mock.init());

    when(mock.connect()).thenAnswer((_) async {});
    model.connect();
    verify(mock.connect());
  });
}
