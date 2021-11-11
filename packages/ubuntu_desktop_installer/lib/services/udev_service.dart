import 'package:meta/meta.dart';
import 'package:udev/udev.dart';

/// Provides pretty disk names (e.g. 'sda' -> 'SanDisk UltraFit').
class UdevService {
  /// Creates the service.
  UdevService([@visibleForTesting Udev? udev]) : _udev = udev ?? Udev();

  final Udev _udev;

  /// Releases the resources used by udev.
  void dispose() => _udev.dispose();

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

  final Udev _udev;

  @override
  UdevDevice? _getDevice(String sysinfo) {
    return UdevDevice.fromSyspath(_udev, syspath: sysinfo);
  }
}

class _UdevSysnameDeviceInfo extends UdevDeviceInfo {
  _UdevSysnameDeviceInfo(this._udev, String sysname) : super._(sysname);

  final Udev _udev;

  @override
  UdevDevice? _getDevice(String sysinfo) {
    return UdevDevice.fromSysname(_udev, subsystem: 'block', sysname: sysinfo);
  }
}
