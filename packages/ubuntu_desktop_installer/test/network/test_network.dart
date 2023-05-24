import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ubuntu_desktop_installer/pages/network/connect_model.dart';
import 'package:ubuntu_desktop_installer/pages/network/ethernet_model.dart';
import 'package:ubuntu_desktop_installer/pages/network/hidden_wifi_model.dart';
import 'package:ubuntu_desktop_installer/pages/network/network_model.dart';
import 'package:ubuntu_desktop_installer/pages/network/network_page.dart';
import 'package:ubuntu_desktop_installer/pages/network/wifi_model.dart';
import 'package:ubuntu_desktop_installer/services.dart';

import 'test_network.mocks.dart';
export 'test_network.mocks.dart';

@GenerateMocks([ConnectModel, NetworkService])
NetworkModel buildNetworkModel({
  ConnectMode? connectMode,
  bool? isConnecting,
  bool? canConnect,
  bool? isConnected,
  bool? isEnabled,
}) {
  final model = MockNetworkModel();
  when(model.connectMode).thenReturn(connectMode ?? ConnectMode.none);
  when(model.isConnecting).thenReturn(isConnecting ?? false);
  when(model.canConnect).thenReturn(canConnect ?? false);
  when(model.isConnected).thenReturn(isConnected ?? true);
  when(model.isEnabled).thenReturn(isEnabled ?? true);
  when(model.onAvailabilityChanged).thenAnswer((_) => const Stream.empty());
  return model;
}

@GenerateMocks([
  NetworkModel,
  UdevDeviceInfo,
  UdevService,
])
Widget buildNetworkPage({
  required NetworkModel model,
  bool? ethernet,
  bool? wifi,
}) {
  final ethernetModel = MockEthernetModel();
  when(ethernetModel.connectMode).thenReturn(ConnectMode.ethernet);
  when(ethernetModel.devices).thenReturn([MockEthernetDevice()]);
  when(ethernetModel.hasActiveConnection).thenReturn(ethernet ?? false);
  when(ethernetModel.canConnect).thenReturn(true);
  when(ethernetModel.isConnected).thenReturn(true);
  when(ethernetModel.isConnecting).thenReturn(false);
  when(ethernetModel.isEnabled).thenReturn(ethernet ?? true);
  when(ethernetModel.onAvailabilityChanged)
      .thenAnswer((_) => const Stream.empty());

  final accessPoint = MockAccessPoint();
  when(accessPoint.name).thenReturn('ap');
  when(accessPoint.strength).thenReturn(0);
  when(accessPoint.isOpen).thenReturn(true);

  final wifiDevice = MockWifiDevice();
  when(wifiDevice.model).thenReturn('model');
  when(wifiDevice.isAvailable).thenReturn(true);
  when(wifiDevice.isConnecting).thenReturn(false);
  when(wifiDevice.scanning).thenReturn(false);
  when(wifiDevice.accessPoints).thenReturn([accessPoint]);
  when(wifiDevice.isActive).thenReturn(false);

  final wifiModel = MockWifiModel();
  when(wifiModel.connectMode).thenReturn(ConnectMode.wifi);
  when(wifiModel.startPeriodicScanning()).thenReturn(null);
  when(wifiModel.isEnabled).thenReturn(wifi ?? true);
  when(wifiModel.devices).thenReturn([wifiDevice]);
  when(wifiModel.isSelectedDevice(any)).thenReturn(false);
  when(wifiModel.hasActiveConnection).thenReturn(wifi ?? false);
  when(wifiModel.canConnect).thenReturn(true);
  when(wifiModel.isConnected).thenReturn(true);
  when(wifiModel.isConnecting).thenReturn(false);
  when(wifiModel.onAvailabilityChanged).thenAnswer((_) => const Stream.empty());

  final hiddenWifiModel = MockHiddenWifiModel();
  when(hiddenWifiModel.connectMode).thenReturn(ConnectMode.hiddenWifi);
  when(hiddenWifiModel.ssid).thenReturn('ssid');
  when(hiddenWifiModel.isEnabled).thenReturn(wifi ?? true);
  when(hiddenWifiModel.devices).thenReturn([wifiDevice]);
  when(hiddenWifiModel.isSelectedDevice(any)).thenReturn(false);
  when(hiddenWifiModel.hasActiveConnection).thenReturn(wifi ?? false);
  when(hiddenWifiModel.canConnect).thenReturn(true);
  when(hiddenWifiModel.isConnected).thenReturn(true);
  when(hiddenWifiModel.isConnecting).thenReturn(false);
  when(hiddenWifiModel.onAvailabilityChanged)
      .thenAnswer((_) => const Stream.empty());

  return ProviderScope(
    overrides: [
      networkModelProvider.overrideWith((_) => model),
      ethernetModelProvider.overrideWith((_) => ethernetModel),
      wifiModelProvider.overrideWith((_) => wifiModel),
      hiddenWifiModelProvider.overrideWith((_) => hiddenWifiModel),
      noConnectModelProvider.overrideWith((_) => NoConnectModel()),
    ],
    child: Consumer(builder: (context, ref, child) {
      return FutureBuilder(
        future: NetworkPage.load(ref),
        builder: (context, snapshot) {
          return snapshot.data == true
              ? const NetworkPage()
              : const SizedBox.shrink();
        },
      );
    }),
  );
}

@GenerateMocks([EthernetDevice, EthernetModel])
EthernetModel buildEthernetModel({
  List<EthernetDevice>? devices,
  bool? isEnabled,
}) {
  final model = MockEthernetModel();
  when(model.devices).thenReturn(devices ?? []);
  when(model.isEnabled).thenReturn(isEnabled ?? true);
  return model;
}

@GenerateMocks([HiddenWifiModel])
HiddenWifiModel buildHiddenWifiModel({
  List<WifiDevice>? devices,
  bool? isEnabled,
  WifiDevice? selectedDevice,
  String? ssid,
}) {
  final model = MockHiddenWifiModel();
  when(model.devices).thenReturn(devices ?? []);
  when(model.isEnabled).thenReturn(isEnabled ?? true);
  when(model.selectedDevice).thenReturn(selectedDevice);
  when(model.ssid).thenReturn(ssid ?? '');
  when(model.isSelectedDevice(any)).thenAnswer((i) =>
      selectedDevice != null && selectedDevice == i.positionalArguments.single);
  return model;
}

@GenerateMocks([AccessPoint, WifiDevice, WifiModel])
WifiModel buildWifiModel({
  List<WifiDevice>? devices,
  bool? isEnabled,
  WifiDevice? selectedDevice,
}) {
  final model = MockWifiModel();
  when(model.devices).thenReturn(devices ?? []);
  when(model.isEnabled).thenReturn(isEnabled ?? true);
  when(model.selectedDevice).thenReturn(selectedDevice);
  when(model.isSelectedDevice(any)).thenAnswer((i) =>
      selectedDevice != null && selectedDevice == i.positionalArguments.single);
  when(model.startPeriodicScanning()).thenReturn(null);
  return model;
}
