import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/network/connect_model.dart';
import 'package:ubuntu_desktop_installer/pages/network/network_model.dart';

import 'network_model_test.mocks.dart';
import 'network_page_test.mocks.dart';

@GenerateMocks([ConnectModel])
void main() {
  test('connects the service', () async {
    final service = MockNetworkService();
    final model = NetworkModel(service);
    await model.init();
    verify(service.connect()).called(1);
  });

  test('initializes and cleans up connect models', () async {
    final model = NetworkModel(MockNetworkService());

    final ethernet = MockConnectModel();
    when(ethernet.connectMode).thenReturn(ConnectMode.ethernet);
    when(ethernet.onAvailabilityChanged).thenAnswer((_) => const Stream.empty());
    model.addConnectMode(ethernet);

    final wifi = MockConnectModel();
    when(wifi.connectMode).thenReturn(ConnectMode.wifi);
    when(wifi.onAvailabilityChanged).thenAnswer((_) => const Stream.empty());
    model.addConnectMode(wifi);

    final hiddenWifi = MockConnectModel();
    when(hiddenWifi.connectMode).thenReturn(ConnectMode.hiddenWifi);
    when(hiddenWifi.onAvailabilityChanged).thenAnswer((_) => const Stream.empty());
    model.addConnectMode(hiddenWifi);

    final none = MockConnectModel();
    when(none.connectMode).thenReturn(ConnectMode.none);
    when(none.onAvailabilityChanged).thenAnswer((_) => const Stream.empty());
    model.addConnectMode(none);

    await model.init();

    verify(ethernet.init()).called(1);
    verify(wifi.init()).called(1);
    verify(hiddenWifi.init()).called(1);
    verify(none.init()).called(1);

    await model.cleanup();

    verify(ethernet.cleanup()).called(1);
    verify(wifi.cleanup()).called(1);
    verify(none.cleanup()).called(1);
  });

  test('no mode selected', () {
    final service = MockNetworkService();
    final model = NetworkModel(service);
    expect(model.connectMode, equals(ConnectMode.none));
    expect(model.isConnected, isFalse);
    expect(model.canConnect, isFalse);
    expect(model.isConnecting, isFalse);
  });

  test('selected mode', () {
    final service = MockNetworkService();
    final model = NetworkModel(service);
    expect(model.connectMode, equals(ConnectMode.none));

    final wifi = MockConnectModel();
    when(wifi.connectMode).thenReturn(ConnectMode.wifi);
    when(wifi.onAvailabilityChanged).thenAnswer((_) => const Stream.empty());
    model.addConnectMode(wifi);
    verify(wifi.connectMode).called(1);
    verify(wifi.onAvailabilityChanged).called(1);

    model.selectConnectMode(ConnectMode.wifi);
    expect(model.connectMode, equals(ConnectMode.wifi));

    when(wifi.isConnected).thenReturn(true);
    expect(model.isConnected, isTrue);
    verify(wifi.isConnected).called(1);

    when(wifi.canConnect).thenReturn(true);
    expect(model.canConnect, isTrue);
    verify(wifi.canConnect).called(1);

    when(wifi.isConnecting).thenReturn(true);
    expect(model.isConnecting, isTrue);
    verify(wifi.isConnecting).called(1);

    when(wifi.hasActiveConnection).thenReturn(true);
    expect(model.hasActiveConnection, isTrue);
    verify(wifi.hasActiveConnection).called(1);

    expect(model.onAvailabilityChanged, isA<Stream>());
    verify(wifi.onAvailabilityChanged).called(1);

    when(wifi.onSelected()).thenAnswer((_) async {});
    model.init();
    verify(wifi.onSelected());

    when(wifi.connect()).thenAnswer((_) async {});
    model.enable();
    verify(wifi.enable());

    when(wifi.connect()).thenAnswer((_) async {});
    model.connect();
    verify(wifi.connect());
  });

  test('preferred mode', () {
    final service = MockNetworkService();

    final ethernet = MockConnectModel();
    when(ethernet.isEnabled).thenReturn(true);
    when(ethernet.connectMode).thenReturn(ConnectMode.ethernet);
    when(ethernet.onAvailabilityChanged).thenAnswer((_) => const Stream.empty());

    final wifi = MockConnectModel();
    when(wifi.isEnabled).thenReturn(true);
    when(wifi.connectMode).thenReturn(ConnectMode.wifi);
    when(wifi.onAvailabilityChanged).thenAnswer((_) => const Stream.empty());

    final hiddenWifi = MockConnectModel();
    when(hiddenWifi.isEnabled).thenReturn(true);
    when(hiddenWifi.connectMode).thenReturn(ConnectMode.hiddenWifi);
    when(hiddenWifi.onAvailabilityChanged).thenAnswer((_) => const Stream.empty());

    final none = MockConnectModel();
    when(none.isEnabled).thenReturn(true);
    when(none.connectMode).thenReturn(ConnectMode.none);
    when(none.onAvailabilityChanged).thenAnswer((_) => const Stream.empty());

    final model = NetworkModel(service);
    model.addConnectMode(ethernet);
    model.addConnectMode(wifi);
    model.addConnectMode(hiddenWifi);
    model.addConnectMode(none);
    expect(model.connectMode, equals(ConnectMode.none));

    when(ethernet.hasActiveConnection).thenReturn(true);
    when(wifi.hasActiveConnection).thenReturn(true);
    when(hiddenWifi.hasActiveConnection).thenReturn(false);
    when(none.hasActiveConnection).thenReturn(false);

    model.selectConnectMode();
    expect(model.connectMode, equals(ConnectMode.ethernet));

    when(ethernet.hasActiveConnection).thenReturn(false);
    when(wifi.hasActiveConnection).thenReturn(true);
    when(hiddenWifi.hasActiveConnection).thenReturn(false);
    when(none.hasActiveConnection).thenReturn(false);

    model.selectConnectMode();
    expect(model.connectMode, equals(ConnectMode.wifi));

    when(ethernet.hasActiveConnection).thenReturn(false);
    when(wifi.hasActiveConnection).thenReturn(false);
    when(hiddenWifi.hasActiveConnection).thenReturn(false);
    when(none.hasActiveConnection).thenReturn(false);

    model.selectConnectMode();
    expect(model.connectMode, equals(ConnectMode.none));
  });

  test('finds best mode', () {
    final service = MockNetworkService();

    final ethernet = MockConnectModel();
    final ethernetChanged = StreamController(sync: true);
    when(ethernet.connectMode).thenReturn(ConnectMode.ethernet);
    when(ethernet.isEnabled).thenReturn(true);
    when(ethernet.hasActiveConnection).thenReturn(false);
    when(ethernet.onAvailabilityChanged)
        .thenAnswer((_) => ethernetChanged.stream);

    final wifi = MockConnectModel();
    final wifiChanged = StreamController(sync: true);
    when(wifi.connectMode).thenReturn(ConnectMode.wifi);
    when(wifi.isEnabled).thenReturn(true);
    when(wifi.hasActiveConnection).thenReturn(false);
    when(wifi.onAvailabilityChanged).thenAnswer((_) => wifiChanged.stream);

    final hiddenWifi = MockConnectModel();
    final hiddenWifiChanged = StreamController(sync: true);
    when(hiddenWifi.connectMode).thenReturn(ConnectMode.hiddenWifi);
    when(hiddenWifi.isEnabled).thenReturn(true);
    when(hiddenWifi.hasActiveConnection).thenReturn(false);
    when(hiddenWifi.onAvailabilityChanged)
        .thenAnswer((_) => hiddenWifiChanged.stream);

    final none = MockConnectModel();
    when(none.connectMode).thenReturn(ConnectMode.none);
    when(none.isEnabled).thenReturn(true);
    when(none.hasActiveConnection).thenReturn(false);
    when(none.onAvailabilityChanged).thenAnswer((_) => const Stream.empty());

    final model = NetworkModel(service);
    model.addConnectMode(ethernet);
    model.addConnectMode(wifi);
    model.addConnectMode(hiddenWifi);
    model.addConnectMode(none);
    expect(model.connectMode, equals(ConnectMode.none));

    // wifi available -> gets selected
    when(wifi.hasActiveConnection).thenReturn(true);
    wifiChanged.add(true);
    expect(model.connectMode, equals(ConnectMode.wifi));

    // ethernet available -> gets selected
    when(ethernet.hasActiveConnection).thenReturn(true);
    ethernetChanged.add(true);
    expect(model.connectMode, equals(ConnectMode.ethernet));

    // explicit wifi selection
    model.selectConnectMode(ConnectMode.wifi);
    expect(model.connectMode, equals(ConnectMode.wifi));

    // keeps explicit selection
    when(ethernet.hasActiveConnection).thenReturn(true);
    ethernetChanged.add(true);
    expect(model.connectMode, equals(ConnectMode.wifi));

    // wifi disabled -> selects ethernet
    when(wifi.isEnabled).thenReturn(false);
    wifiChanged.add(true);
    expect(model.connectMode, equals(ConnectMode.ethernet));

    // ethernet disabled -> selects none
    when(ethernet.isEnabled).thenReturn(false);
    ethernetChanged.add(true);
    expect(model.connectMode, equals(ConnectMode.none));

    // explicit selection without active connection
    when(wifi.isEnabled).thenReturn(true);
    when(wifi.hasActiveConnection).thenReturn(false);
    model.selectConnectMode();
    expect(model.connectMode, equals(ConnectMode.wifi));
  });

  test('mark network configured', () async {
    final service = MockNetworkService();
    final model = NetworkModel(service);
    await model.markConfigured();
    verify(service.markConfigured()).called(1);
  });
}
