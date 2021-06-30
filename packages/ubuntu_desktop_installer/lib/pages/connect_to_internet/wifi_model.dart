import 'dart:async';

import 'package:collection/collection.dart';
import 'package:dbus/dbus.dart';

import '../../services.dart';
import 'connect_model.dart';
import 'device_model.dart';
import 'property_stream_notifier.dart';

// TODO: appropriate timeout?
const _kWifiScanTimeout = Duration(milliseconds: 7500);

class WifiModel extends PropertyStreamNotifier implements ConnectModel {
  WifiModel(this._service) {
    addProperties(_service.propertiesChanged);
    addPropertyListener('Devices', _resetDevices);
  }

  @override
  bool get canConnect => _selected?.isActive == false;

  @override
  bool get canContinue => _selected?.isActive == true;

  @override
  bool get isBusy => _selected?.isBusy == true || _selected?.scanning == true;

  @override
  ConnectMode get connectMode => ConnectMode.wifi;

  @override
  void init() {
    final device = devices.firstWhereOrNull((device) {
      return device.activeAccessPoint != null;
    });
    device?.init();
    selectDevice(device);
  }

  @override
  Future<void> connect({OnAuthenticate? onAuthenticate}) async {
    assert(onAuthenticate != null);
    final device = selectedDevice!;
    final accessPoint = device.selectedAccessPoint!;
    Authentication? authentication;
    if (!accessPoint.isOpen) {
      authentication = await onAuthenticate!(device, accessPoint);
      if (authentication == null) return;
    }

    final connection = await device.findAvailableConnection(accessPoint) ??
        await _service.addWirelessConnection(
          ssid: accessPoint.ssid,
          password: authentication?.password,
          private: authentication?.storePassword == StorePassword.thisUser,
        );
    try {
      await _service.activateConnection(
        device: device.device,
        connection: connection,
        accessPoint: accessPoint.accessPoint,
      );
    } catch (e) {
      print('TODO: $e');
    }
  }

  final NetworkService _service;

  List<WifiDeviceModel>? _devices;
  List<WifiDeviceModel> get devices => _devices ??= _getDevices();

  List<WifiDeviceModel> _getDevices() {
    return _service.wirelessDevices
        .map((device) => WifiDeviceModel(device))
        .toList();
  }

  void _resetDevices() {
    _devices = null;
    notifyListeners();
  }

  WifiDeviceModel? _selected;
  WifiDeviceModel? get selectedDevice => _selected;
  bool isSelectedDevice(WifiDeviceModel device) => device == _selected;
  void selectDevice(WifiDeviceModel? device) {
    selectedDevice?.removeListener(notifyListeners);
    device?.addListener(notifyListeners);
    _selected = device;
    notifyListeners();
  }

  Future requestScan({String? ssid}) async {
    final scans = <Future<void>>[];
    for (final device in devices) {
      scans.add(device.requestScan(ssid: ssid));
    }
    return Future.wait(scans);
  }
}

class WifiDeviceModel extends DeviceModel {
  WifiDeviceModel(NetworkManagerDevice device)
      : _wireless = device.wireless!,
        super(device) {
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
  bool get isActive {
    return super.isActive &&
        _selected != null &&
        _selected!.name == activeAccessPoint?.name;
  }

  final NetworkManagerDeviceWireless _wireless;

  List<AccessPointModel>? _accessPoints;
  List<AccessPointModel> get accessPoints =>
      _accessPoints ??= _getAccessPoints();

  List<AccessPointModel> _getAccessPoints() {
    final ssids = <List<int>>[];

    bool hasSsid(List<int> ssid) {
      return ssids.any((s) => ListEquality().equals(s, ssid));
    }

    bool acceptSsid(List<int> ssid) {
      if (ssid.isEmpty || hasSsid(ssid)) {
        return false;
      }
      ssids.add(ssid);
      return true;
    }

    return _wireless.accessPoints
        .where((ap) => acceptSsid(ap.ssid))
        .map((ap) => AccessPointModel(ap))
        .sorted((a, b) => b.strength.compareTo(a.strength));
  }

  void _updateAccessPoints() {
    _accessPoints = _getAccessPoints();
    notifyListeners();
  }

  AccessPointModel? get activeAccessPoint {
    return _wireless.activeAccessPoint != null
        ? AccessPointModel(_wireless.activeAccessPoint!)
        : null;
  }

  bool isActiveAccessPoint(AccessPointModel accessPoint) {
    return accessPoint._accessPoint == activeAccessPoint?._accessPoint;
  }

  AccessPointModel? _selected;
  AccessPointModel? get selectedAccessPoint => _selected;
  bool isSelectedAccessPoint(AccessPointModel accessPoint) {
    return accessPoint._accessPoint == _selected?._accessPoint;
  }

  void selectAccessPoint(AccessPointModel? accessPoint) {
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
    AccessPointModel accessPoint,
  ) async {
    for (final connection in availableConnections) {
      if (ListEquality().equals(accessPoint.ssid, await getSsid(connection))) {
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

  Future<void> requestScan({String? ssid}) {
    final ssids = <List<int>>[if (ssid != null) ssid.codeUnits];
    _setScanning(true);
    _completer = Completer();
    _completer!.future.timeout(_kWifiScanTimeout, onTimeout: () {
      _setLastScan(-1);
      _setScanning(false);
      _completer?.complete(null);
    });
    _wireless.requestScan(ssids: ssids);
    return _completer!.future;
  }

  AccessPointModel? findAccessPoint(String ssid) {
    return accessPoints.firstWhereOrNull((accessPoint) {
      return ssid == accessPoint.name;
    });
  }
}

class AccessPointModel extends PropertyStreamNotifier {
  AccessPointModel(this._accessPoint) {
    addProperties(_accessPoint.propertiesChanged);
    addPropertyListener('Strength', notifyListeners);
  }

  final NetworkManagerAccessPoint _accessPoint;
  NetworkManagerAccessPoint get accessPoint => _accessPoint;

  List<int> get ssid => _accessPoint.ssid;

  // TODO: non-text binary form
  String get name => String.fromCharCodes(ssid);

  int get strength => _accessPoint.strength;

  bool get isOpen {
    return !_accessPoint.flags
        .contains(NetworkManagerWifiAccessPointFlag.privacy);
  }
}
