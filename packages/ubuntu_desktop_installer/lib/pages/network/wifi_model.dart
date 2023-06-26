import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:dbus/dbus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_wizard/utils.dart';

import 'connect_model.dart';
import 'network_device.dart';

@visibleForTesting
const kWifiScanInterval = Duration(seconds: 15);

@visibleForTesting
const kWifiScanTimeout = Duration(seconds: 3);

final wifiModelProvider = ChangeNotifierProvider(
    (_) => WifiModel(getService<NetworkService>(), getService<UdevService>()));

/// "Connect to Wi-Fi network"
class WifiModel extends NetworkDeviceModel<WifiDevice> {
  WifiModel(super.service, [super.udev]);

  @override
  bool get canConnect => selectedDevice?._isConnected == false;

  @override
  bool get isConnected => selectedDevice?._isConnected == true;

  @override
  bool get hasActiveConnection => devices.any((device) => device.isActive);

  @override
  bool get isConnecting => selectedDevice?.isConnecting == true;

  @override
  bool get isEnabled => service.wirelessEnabled;

  @override
  ConnectMode get connectMode => ConnectMode.wifi;

  @override
  void onSelected() => startPeriodicScanning();

  @override
  void onDeselected() {
    stopPeriodicScanning();
    if (selectedDevice?.isConnecting != true) return;
    selectedDevice!.disconnect();
  }

  @override
  Future<void> init() async {
    super.init();
    addPropertyListener('WirelessEnabled', updateDevices);
  }

  @override
  Future<void> cleanup() async {
    stopPeriodicScanning();
    super.cleanup();
  }

  @override
  void dispose() {
    stopPeriodicScanning();
    super.dispose();
  }

  @override
  Future<void> enable() {
    log.debug('Enable wireless networking');
    return service.setWirelessEnabled(true).then((_) => notifyListeners());
  }

  @override
  Future<void> connect() {
    final device = selectedDevice!;
    final accessPoint = device.selectedAccessPoint!;
    log.debug('Connect $device to $accessPoint');
    return service.addAndActivateConnection(
      connection: <String, Map<String, DBusValue>>{},
      device: device.device,
      accessPoint: accessPoint.accessPoint,
    );
  }

  @override
  List<NetworkManagerDevice> getDevices() => service.wirelessDevices;

  @override
  WifiDevice createDevice(NetworkManagerDevice device) {
    return WifiDevice(device, udev);
  }

  @override
  WifiDevice? findActiveDevice() {
    return devices.firstWhereOrNull((device) {
      return device.activeAccessPoint != null;
    });
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
    _setWireless(device.wireless!);
    addPropertyListener('AccessPoints', _updateAccessPoints);
    addPropertyListener('ActiveAccessPoint', _updateAccessPoints);
    addPropertyListener('LastScan', () => _completeScan(_wireless));
  }

  NetworkManagerDeviceWireless _wireless;
  final _accessPoints = <AccessPoint>[];
  final _allAccessPoints = <String, AccessPoint>{};

  @override
  void init() {
    for (final ap in _accessPoints) {
      ap.init();
    }
    super.init();
  }

  @override
  void cleanup() {
    for (final ap in _accessPoints) {
      ap.cleanup();
    }
    super.cleanup();
  }

  @override
  void dispose() {
    for (final ap in _accessPoints) {
      ap.dispose();
    }
    super.dispose();
  }

  void _setWireless(NetworkManagerDeviceWireless wireless) {
    _wireless = wireless;
    setProperties(_wireless.propertiesChanged);
    _updateAccessPoints();
  }

  @override
  void updateDevice(NetworkManagerDevice device) {
    super.updateDevice(device);
    if (_wireless == device.wireless) return;
    _setWireless(device.wireless!);
  }

  @override
  bool get isActive => super.isActive && activeAccessPoint != null;

  bool get _isConnected =>
      isActive &&
      _selectedAccessPoint != null &&
      _selectedAccessPoint!.name == activeAccessPoint?.name;

  List<AccessPoint> get accessPoints => _accessPoints;

  List<NetworkManagerAccessPoint> _getAccessPoints() {
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
        .sorted((a, b) => b.strength.compareTo(a.strength));
    return accessPoints;
  }

  AccessPoint _createAccessPoint(NetworkManagerAccessPoint accessPoint) {
    return AccessPoint(accessPoint);
  }

  void _updateAccessPoints() {
    _accessPoints.clear();
    final previousSelected = _selectedAccessPoint;
    _selectedAccessPoint = null;
    for (final ap in _getAccessPoints()) {
      var model = _allAccessPoints[ap.hwAddress];
      if (model == null) {
        model = _createAccessPoint(ap);
        model.addListener(_updateAccessPoints);
        _allAccessPoints[ap.hwAddress] = model;
      } else {
        model._updateAccessPoint(ap);
      }
      _accessPoints.add(model);
      if (model == previousSelected) {
        _selectedAccessPoint = model;
      }
    }
    _selectedAccessPoint ??= activeAccessPoint;
    log.debug(() => 'Update access points: $_accessPoints ($this)');
    notifyListeners();
  }

  AccessPoint? get activeAccessPoint {
    if (_wireless.activeAccessPoint == null) return null;
    return accessPoints.firstWhereOrNull(isActiveAccessPoint);
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
    if (_selectedAccessPoint == accessPoint) return;
    _selectedAccessPoint = accessPoint;
    notifyListeners();
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
      _completer!.complete();
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

class AccessPoint extends SafeChangeNotifier with PropertyStreamNotifier {
  AccessPoint(this._accessPoint) {
    _setAccessPoint(_accessPoint);
    addPropertyListener('Strength', notifyListeners);
  }

  NetworkManagerAccessPoint _accessPoint;

  NetworkManagerAccessPoint get accessPoint => _accessPoint;

  void init() => enablePropertyListeners();
  void cleanup() => disablePropertyListeners();

  void _setAccessPoint(NetworkManagerAccessPoint accessPoint) {
    _accessPoint = accessPoint;
    setProperties(_accessPoint.propertiesChanged);
  }

  void _updateAccessPoint(NetworkManagerAccessPoint accessPoint) {
    if (accessPoint == _accessPoint) return;
    _setAccessPoint(accessPoint);
    notifyListeners();
  }

  List<int> get ssid => _accessPoint.ssid;
  String get hwAddress => _accessPoint.hwAddress;
  String get name => utf8.decode(ssid, allowMalformed: true);
  int get strength => _accessPoint.strength;
  bool get isOpen => _accessPoint.isOpen;

  @override
  String toString() => 'AccessPoint(ssid: $name)';
}

extension _SsidList on List<int> {
  bool equals(List<int>? ssid) => const ListEquality().equals(this, ssid);
}

extension _AccessPointFlags on NetworkManagerAccessPoint {
  bool get isOpen => !flags.contains(NetworkManagerWifiAccessPointFlag.privacy);
}
