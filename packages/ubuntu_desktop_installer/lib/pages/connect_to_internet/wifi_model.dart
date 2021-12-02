import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:dbus/dbus.dart';
import 'package:flutter/material.dart';

import '../../services.dart';
import 'connect_model.dart';
import 'network_device.dart';
import 'property_stream_notifier.dart';

@visibleForTesting
const kWifiScanInterval = Duration(seconds: 15);

@visibleForTesting
const kWifiScanTimeout = Duration(seconds: 3);

/// "Connect to Wi-Fi network"
class WifiModel extends PropertyStreamNotifier implements ConnectModel {
  WifiModel(this._service, [this._udev]);

  @override
  bool get canConnect => _selectedDevice?._isConnected == false;

  @override
  bool get isConnected => _selectedDevice?._isConnected == true;

  @override
  bool get hasActiveConnection => devices.any((device) => device.isActive);

  @override
  bool get isConnecting =>
      _selectedDevice?.isConnecting == true ||
      _selectedDevice?.scanning == true;

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
    startPeriodicScanning();
  }

  @override
  void onDeselected() {
    stopPeriodicScanning();
    if (_selectedDevice?.isConnecting != true) return;
    _selectedDevice!.disconnect();
  }

  @override
  Future<void> init() async {
    addProperties(_service.propertiesChanged);
    addPropertyListener('Devices', _updateDevices);
    addPropertyListener('WirelessEnabled', _updateDevices);
    _updateDevices();
  }

  @override
  void dispose() {
    stopPeriodicScanning();
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
    log.debug(() => 'Update Wi-Fi devices: $devices');
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

  WifiDevice? _selectedDevice;
  WifiDevice? get selectedDevice => _selectedDevice;
  bool isSelectedDevice(WifiDevice device) => device == _selectedDevice;
  void selectDevice(WifiDevice? device) {
    if (device == _selectedDevice) return;
    selectedDevice?.removeListener(notifyListeners);
    device?.addListener(notifyListeners);
    _selectedDevice = device;
    notifyListeners();
  }

  Timer? _scanTimer;

  /// Starts a periodic AP scanning at 15s interval.
  ///
  /// See also:
  /// * [requestScan]
  void startPeriodicScanning() {
    stopPeriodicScanning();
    _scanTimer = Timer.periodic(kWifiScanInterval, (_) => requestScan());
    requestScan();
  }

  void stopPeriodicScanning() => _scanTimer?.cancel();

  /// Requests all devices to scan for access points, or a specific access point
  /// if `ssid` is specified.
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
    addPropertyListener('LastScan', () => _completeScan(_wireless));
  }

  void init() => selectAccessPoint(activeAccessPoint);

  @override
  void dispose() {
    _resetAccessPoints();
    super.dispose();
  }

  @override
  bool get isActive => super.isActive && activeAccessPoint != null;

  bool get _isConnected =>
      isActive &&
      _selectedAccessPoint != null &&
      _selectedAccessPoint!.name == activeAccessPoint?.name;

  final NetworkManagerDeviceWireless _wireless;

  List<AccessPoint>? _accessPoints;
  List<AccessPoint> get accessPoints => _accessPoints ??= _getAccessPoints();

  List<AccessPoint> _getAccessPoints() {
    final ssids = <List<int>>[];

    bool hasSsid(List<int> ssid) {
      return ssids.any((s) => s.equals(ssid));
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
    log.debug(() => 'Update access points: $accessPoints ($this)');
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

  AccessPoint? _selectedAccessPoint;
  AccessPoint? get selectedAccessPoint => _selectedAccessPoint;
  bool isSelectedAccessPoint(AccessPoint accessPoint) {
    return accessPoint._accessPoint == _selectedAccessPoint?._accessPoint;
  }

  void selectAccessPoint(AccessPoint? accessPoint) {
    _selectedAccessPoint = accessPoint;
    notifyListeners();
  }

  Future<List<int>?> _getSsid(
      NetworkManagerSettingsConnection connection) async {
    final settings = await connection.getSettings();
    final array = settings['802-11-wireless']?['ssid'] as DBusArray?;
    return array?.toSsid();
  }

  /// Tries to find an available connection for the specified access point.
  Future<NetworkManagerSettingsConnection?> findAvailableConnection(
    AccessPoint accessPoint,
  ) async {
    for (final connection in availableConnections) {
      if (accessPoint.ssid.equals(await _getSsid(connection))) {
        return connection;
      }
    }
    return null;
  }

  bool _scanning = false;
  int _lastScan = -1;
  Completer<void>? _completer;

  /// Whether the device is scanning for access points.
  bool get scanning => _scanning;
  void _setScanning(bool scanning) {
    if (_scanning == scanning) return;
    _scanning = scanning;
    notifyListeners();
  }

  /// Seconds since the last scan.
  int get lastScan => _lastScan;
  void _setLastScan(int lastScan) {
    if (_lastScan == lastScan) return;
    _lastScan = lastScan;
    notifyListeners();
  }

  /// Requests the device to scan for access points, or a specific access point
  /// if `ssid` is specified.
  Future<void> requestScan({String? ssid}) async {
    _cancelScan();
    final ssids = <List<int>>[if (ssid != null) ssid.codeUnits];
    log.debug('Request scan: $this');
    _setScanning(true);
    _completer = Completer();
    _completer!.future.timeout(kWifiScanTimeout, onTimeout: _cancelScan);
    if (!isAvailable) return;
    _wireless.requestScan(ssids: ssids);
    return _completer!.future;
  }

  void _cancelScan() => _completeScan(null);

  void _completeScan(NetworkManagerDeviceWireless? wireless) {
    _setLastScan(wireless?.lastScan ?? -1);
    _setScanning(false);
    if (_completer?.isCompleted == false) {
      _completer!.complete(device);
    }
    _completer = null;
  }

  /// Tries to find an access point by `ssid`.
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
  bool get isOpen => _accessPoint.isOpen;

  @override
  String toString() => 'AccessPoint(ssid: $name)';
}

extension _SsidList on List<int> {
  bool equals(List<int>? ssid) => const ListEquality().equals(this, ssid);
}

extension _SsidArray on DBusArray {
  List<int> toSsid() => children.map((c) => (c as DBusByte).value).toList();
}

extension _AccessPointFlags on NetworkManagerAccessPoint {
  bool get isOpen => !flags.contains(NetworkManagerWifiAccessPointFlag.privacy);
}
