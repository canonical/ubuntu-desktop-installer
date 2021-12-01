import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/connect_model.dart';
import 'package:ubuntu_desktop_installer/pages/connect_to_internet/connect_to_internet_model.dart';

import 'connect_to_internet_model_test.mocks.dart';
import 'connect_to_internet_page_test.mocks.dart';

@GenerateMocks([ConnectModel])
void main() {
  test('no model selected', () {
    final service = MockNetworkService();
    final model = ConnectToInternetModel(service);
    expect(model.connectMode, equals(ConnectMode.none));
    expect(model.canContinue, isFalse);
    expect(model.canConnect, isFalse);
    expect(model.isBusy, isFalse);
  });

  test('selected model', () {
    final service = MockNetworkService();
    final model = ConnectToInternetModel(service);
    expect(model.connectMode, equals(ConnectMode.none));

    final wifi = MockConnectModel();
    when(wifi.connectMode).thenReturn(ConnectMode.wifi);
    model.addConnectMode(wifi);
    model.selectConnectMode(ConnectMode.wifi);
    expect(model.connectMode, equals(ConnectMode.wifi));

    when(wifi.canContinue).thenReturn(true);
    expect(model.canContinue, isTrue);

    when(wifi.canConnect).thenReturn(true);
    expect(model.canConnect, isTrue);

    when(wifi.isBusy).thenReturn(true);
    expect(model.isBusy, isTrue);

    when(wifi.onSelected()).thenAnswer((_) async {});
    model.init();
    verify(wifi.onSelected());

    when(wifi.connect()).thenAnswer((_) async {});
    model.connect();
    verify(wifi.connect());
  });

  test('preferred model', () {
    final service = MockNetworkService();
    final ethernet = MockConnectModel();
    when(ethernet.connectMode).thenReturn(ConnectMode.ethernet);
    final wifi = MockConnectModel();
    when(wifi.connectMode).thenReturn(ConnectMode.wifi);
    final none = MockConnectModel();
    when(none.connectMode).thenReturn(ConnectMode.none);

    final model = ConnectToInternetModel(service);
    model.addConnectMode(ethernet);
    model.addConnectMode(wifi);
    model.addConnectMode(none);
    expect(model.connectMode, equals(ConnectMode.none));

    when(ethernet.isActive).thenReturn(true);
    when(wifi.isActive).thenReturn(true);
    when(none.isActive).thenReturn(false);

    model.selectConnectMode();
    expect(model.connectMode, equals(ConnectMode.ethernet));

    when(ethernet.isActive).thenReturn(false);
    when(wifi.isActive).thenReturn(true);
    when(none.isActive).thenReturn(false);

    model.selectConnectMode();
    expect(model.connectMode, equals(ConnectMode.wifi));

    when(ethernet.isActive).thenReturn(false);
    when(wifi.isActive).thenReturn(false);
    when(none.isActive).thenReturn(false);

    model.selectConnectMode();
    expect(model.connectMode, equals(ConnectMode.none));
  });
}
