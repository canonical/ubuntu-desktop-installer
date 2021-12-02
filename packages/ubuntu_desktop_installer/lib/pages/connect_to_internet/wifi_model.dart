import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:dbus/dbus.dart';
import 'package:flutter/material.dart';

import '../../services.dart';
import 'connect_model.dart';
import 'network_device.dart';
import 'property_stream_notifier.dart';

// TODO: appropriate timeout?
@visibleForTesting
const kWifiScanTimeout = Duration(milliseconds: 7500);

class WifiModel extends PropertyStreamNotifier implements ConnectModel {
  WifiModel(this._service, [this._udev]);

  @override
  bool get canConnect => _selected?._canContinue == false;

  @override
  bool get canContinue => _selected?._canContinue == true;

  @override
  bool get isActive => devices.any((device) => device.isActive);

  @override
  bool get isBusy => _selected?.isBusy == true || _selected?.scanning == true;

  @override
  bool get isEnabled => _service.wirelessEnabled;

  @override
  ConnectMode get connectMode => ConnectMode.wifi;

  @override
  void onSelected() {
    final device = devices.firstWhereOrNull((device) {
      return device.activeAccessPoint != null;
    });
    device?.init();
    selectDevice(device);
  }

  @override
  void onDeselected() {
    if (_selected?.isBusy != true) return;
    _selected!.disconnect();
  }

  @override
  Future<void> init() async {
    addProperties(_service.propertiesChanged);
    addPropertyListener('Devices', _updateDevices);
    addPropertyListener('WirelessEnabled', notifyListeners);
    _updateDevices();
  }

  @override
  void dispose() {
    _resetDevices();
    super.dispose();
  }

  @override
  Future<void> enable() {
    log.debug('Enable wireless networking');
    return _service.setWirelessEnabled(true).then((_) => notifyListeners());
  }

  @override
  Future<void> connect() {
    final device = selectedDevice!;
    final accessPoint = device.selectedAccessPoint!;
    log.debug('Connect $device to $accessPoint');
    return _service.addAndActivateConnection(
      connection: <String, Map<String, DBusValue>>{},
      device: device.device,
      accessPoint: accessPoint.accessPoint,
    );
  }

  final NetworkService _service;
  final UdevService? _udev;

  List<WifiDevice>? _devices;
  List<WifiDevice> get devices => _devices ??= _getDevices();

  List<WifiDevice> _getDevices() {
    final devices = _service.wirelessDevices
        .map((device) => WifiDevice(device, _udev))
        .toList();
    log.debug(() => 'Update Wi-Fi devices: ${describeDevices(devices)}');
    return devices;
  }

  void _resetDevices() {
    if (_devices == null) return;
    for (final device in _devices!) {
      device.dispose();
    }
    _devices = null;
  }

  void _updateDevices() {
    _resetDevices();
    notifyListeners();
  }

  WifiDevice? _selected;
  WifiDevice? get selectedDevice => _selected;
  bool isSelectedDevice(WifiDevice device) => device == _selected;
  void selectDevice(WifiDevice? device) {
    if (device == _selected) return;
    selectedDevice?.removeListener(notifyListeners);
    device?.addListener(notifyListeners);
    _selected = device;
    notifyListeners();
  }

  Future requestScan({String? ssid}) async {
    if (!isEnabled) return;
    final scans = <Future<void>>[];
    for (final device in devices) {
      if (device.isAvailable) {
        scans.add(device.requestScan(ssid: ssid));
      }
    }
    return Future.wait(scans);
  }
}

class WifiDevice extends NetworkDevice {
  WifiDevice(NetworkManagerDevice device, [UdevService? udev])
      : _wireless = device.wireless!,
        super(device, udev) {
    addProperties(_wireless.propertiesChanged);
    addPropertyListener('AccessPoints', _updateAccessPoints);
    addPropertyListener('ActiveAccessPoint', notifyListeners);
    addPropertyListener('LastScan', () {
      _setLastScan(device.wireless!.lastScan);
      _setScanning(false);
      if (_completer?.isCompleted == false) {
        _completer!.complete(device);
      }
    });
  }

  void init() => selectAccessPoint(activeAccessPoint);

  @override
  void dispose() {
    _resetAccessPoints();
    super.dispose();
  }

  @override
  bool get isActive => super.isActive && activeAccessPoint != null;

  bool get _canContinue =>
      isActive &&
      _selected != null &&
      _selected!.name == activeAccessPoint?.name;

  final NetworkManagerDeviceWireless _wireless;

  List<AccessPoint>? _accessPoints;
  List<AccessPoint> get accessPoints => _accessPoints ??= _getAccessPoints();

  List<AccessPoint> _getAccessPoints() {
    final ssids = <List<int>>[];

    bool hasSsid(List<int> ssid) {
      return ssids.any((s) => const ListEquality().equals(s, ssid));
    }

    bool acceptSsid(List<int> ssid) {
      if (ssid.isEmpty || hasSsid(ssid)) {
        return false;
      }
      ssids.add(ssid);
      return true;
    }

    final accessPoints = _wireless.accessPoints
        .where((ap) => acceptSsid(ap.ssid))
        .map((ap) => AccessPoint(ap))
        .sorted((a, b) => b.strength.compareTo(a.strength));
    log.debug(() =>
        'Update access points: ${describeAccessPoints(accessPoints)} (device: $this)');
    return accessPoints;
  }

  void _resetAccessPoints() {
    if (_accessPoints == null) return;
    for (final ap in _accessPoints!) {
      ap.dispose();
    }
    _accessPoints = null;
  }

  void _updateAccessPoints() {
    _resetAccessPoints();
    notifyListeners();
  }

  AccessPoint? get activeAccessPoint {
    if (_wireless.activeAccessPoint == null) return null;
    return accessPoints.firstWhereOrNull((ap) {
      return ap.accessPoint == _wireless.activeAccessPoint;
    });
  }

  bool isActiveAccessPoint(AccessPoint accessPoint) {
    return accessPoint._accessPoint == _wireless.activeAccessPoint;
  }

  AccessPoint? _selected;
  AccessPoint? get selectedAccessPoint => _selected;
  bool isSelectedAccessPoint(AccessPoint accessPoint) {
    return accessPoint._accessPoint == _selected?._accessPoint;
  }

  void selectAccessPoint(AccessPoint? accessPoint) {
    _selected = accessPoint;
    notifyListeners();
  }

  Future<List<int>?> getSsid(
      NetworkManagerSettingsConnection connection) async {
    final settings = await connection.getSettings();
    final ssid = settings['802-11-wireless']?['ssid'] as DBusArray?;
    return ssid?.children.map((c) => (c as DBusByte).value).toList();
  }

  Future<NetworkManagerSettingsConnection?> findAvailableConnection(
    AccessPoint accessPoint,
  ) async {
    for (final connection in availableConnections) {
      if (const ListEquality()
          .equals(accessPoint.ssid, await getSsid(connection))) {
        return connection;
      }
    }
    return null;
  }

  Completer<void>? _completer;

  bool _scanning = false;
  bool get scanning => _scanning;
  void _setScanning(bool scanning) {
    if (_scanning == scanning) return;
    _scanning = scanning;
    notifyListeners();
  }

  int _lastScan = -1;
  int get lastScan => _lastScan;
  void _setLastScan(int lastScan) {
    if (_lastScan == lastScan) return;
    _lastScan = lastScan;
    notifyListeners();
  }

  Future<void> requestScan({String? ssid}) async {
    final ssids = <List<int>>[if (ssid != null) ssid.codeUnits];
    log.debug('Request scan: $this');
    _setScanning(true);
    _completer = Completer();
    _completer!.future.timeout(kWifiScanTimeout, onTimeout: () {
      _setLastScan(-1);
      _setScanning(false);
      _completer?.complete(null);
    });
    if (!isAvailable) return;
    _wireless.requestScan(ssids: ssids);
    return _completer!.future;
  }

  AccessPoint? findAccessPoint(String ssid) {
    return accessPoints.firstWhereOrNull((accessPoint) {
      return ssid == accessPoint.name;
    });
  }
}

class AccessPoint extends PropertyStreamNotifier {
  AccessPoint(this._accessPoint) {
    addProperties(_accessPoint.propertiesChanged);
    addPropertyListener('Strength', notifyListeners);
  }

  final NetworkManagerAccessPoint _accessPoint;
  NetworkManagerAccessPoint get accessPoint => _accessPoint;

  List<int> get ssid => _accessPoint.ssid;

  String get name => utf8.decode(ssid, allowMalformed: true);

  int get strength => _accessPoint.strength;

  bool get isOpen {
    return !_accessPoint.flags
        .contains(NetworkManagerWifiAccessPointFlag.privacy);
  }

  @override
  String toString() => name;
}

String describeAccessPoints(List<AccessPoint> accessPoints) {
  return accessPoints.map((ap) => ap.name).join(', ');
}
