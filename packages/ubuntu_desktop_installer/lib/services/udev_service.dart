import 'package:meta/meta.dart';
import 'package:udev/udev.dart';

/// Provides pretty disk names (e.g. 'sda' -> 'SanDisk UltraFit').
class UdevService {
  /// Creates the service.
  UdevService([@visibleForTesting Udev? udev]) : _udev = udev ?? Udev();

  final Udev _udev;

  /// Releases the resources used by udev.
  void dispose() => _udev.dispose();

  /// The combined model and vendor name of the device.
  String fullName({String? sysname, String? syspath}) {
    return <String?>[
      modelName(sysname: sysname, syspath: syspath),
      vendorName(sysname: sysname, syspath: syspath),
    ].where((p) => p?.isNotEmpty == true).join(' ');
  }

  /// The model of the specified device (e.g. 'sda' -> 'UltraFit').
  String? modelName({String? sysname, String? syspath}) {
    return _getDevice(sysname: sysname, syspath: syspath)?.model;
  }

  /// The vendor of the specified device (e.g. 'sda' -> 'SanDisk').
  String? vendorName({String? sysname, String? syspath}) {
    return _getDevice(sysname: sysname, syspath: syspath)?.vendor;
  }

  UdevDevice? _getDevice({String? sysname, String? syspath}) {
    assert(sysname != null || syspath != null);
    if (sysname != null) {
      return UdevDevice.fromSysname(_udev,
          subsystem: 'block', sysname: sysname);
    } else {
      return UdevDevice.fromSyspath(_udev, syspath: syspath!);
    }
  }
}
