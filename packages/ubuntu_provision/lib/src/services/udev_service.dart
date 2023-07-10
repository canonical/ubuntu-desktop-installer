import 'package:meta/meta.dart';
import 'package:udev/udev.dart';

/// Provides pretty disk names (e.g. 'sda' -> 'SanDisk UltraFit').
class UdevService {
  /// Creates the service.
  UdevService([@visibleForTesting this._udev]);

  final UdevContext? _udev;

  /// Returns [UdevDeviceInfo] for a device specified by its [sysname].
  UdevDeviceInfo bySysname(String sysname) =>
      _UdevSysnameDeviceInfo(_udev, sysname);

  /// Returns [UdevDeviceInfo] for a device specified by its [syspath].
  UdevDeviceInfo bySyspath(String syspath) =>
      _UdevSyspathDeviceInfo(_udev, syspath);
}

/// Provides pretty disk names (e.g. 'sda' -> 'SanDisk UltraFit').
abstract class UdevDeviceInfo {
  UdevDeviceInfo._(this._sysinfo);

  UdevDevice? _getDevice(String sysinfo);

  final String _sysinfo;

  /// The combined model and vendor name of the device.
  String get fullName {
    return <String?>[
      modelName,
      vendorName,
    ].where((p) => p?.isNotEmpty == true).join(' ');
  }

  /// The model of the specified device (e.g. 'sda' -> 'UltraFit').
  String? get modelName => _getDevice(_sysinfo)?.model;

  /// The vendor of the specified device (e.g. 'sda' -> 'SanDisk').
  String? get vendorName => _getDevice(_sysinfo)?.vendor;
}

class _UdevSyspathDeviceInfo extends UdevDeviceInfo {
  _UdevSyspathDeviceInfo(this._udev, String syspath) : super._(syspath);

  final UdevContext? _udev;

  @override
  UdevDevice? _getDevice(String sysinfo) {
    return UdevDevice.fromSyspath(sysinfo, context: _udev);
  }
}

class _UdevSysnameDeviceInfo extends UdevDeviceInfo {
  _UdevSysnameDeviceInfo(this._udev, String sysname) : super._(sysname);

  final UdevContext? _udev;

  @override
  UdevDevice? _getDevice(String sysinfo) {
    return UdevDevice.fromSubsystemSysname('block', sysinfo, context: _udev);
  }
}

extension _UdevDeviceX on UdevDevice {
  /// Model name (`ID_MODEL` or `ID_MODEL_FROM_DATABASE`).
  String get model =>
      properties['ID_MODEL_FROM_DATABASE'] ?? properties['ID_MODEL'] ?? '';

  /// Vendor name (`ID_VENDOR` or `ID_VENDOR_FROM_DATABASE`).
  String get vendor =>
      properties['ID_VENDOR_FROM_DATABASE'] ?? properties['ID_VENDOR'] ?? '';
}
