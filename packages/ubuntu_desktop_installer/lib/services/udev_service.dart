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
  String fullName(String sysname) {
    return <String?>[
      modelName(sysname),
      vendorName(sysname),
    ].where((p) => p?.isNotEmpty == true).join(' ');
  }

  /// The model of the specified device (e.g. 'sda' -> 'UltraFit').
  String? modelName(String sysname) => _getDevice(sysname)?.model;

  /// The vendor of the specified device (e.g. 'sda' -> 'SanDisk').
  String? vendorName(String sysname) => _getDevice(sysname)?.vendor;

  UdevDevice? _getDevice(String sysname) {
    return UdevDevice.fromSysname(_udev, subsystem: 'block', sysname: sysname);
  }
}
