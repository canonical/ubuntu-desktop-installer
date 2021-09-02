import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'bindings.g.dart';

/// {@macro udev}
class Udev {
  late final Pointer<udev> _udev;
  final _devices = <String, UdevDevice?>{};

  /// Creates a new udev context object.
  ///
  /// Note: When done, call [dispose] to discard any resources used by the
  /// object.
  factory Udev() => instance ??= Udev._();

  /// Overrides the factory instance for testing purposes.
  @visibleForTesting
  static Udev? instance;

  /// Overrides the libudev FFI wrapper for testing purposes.
  @visibleForTesting
  static Libudev? lib;

  Udev._() {
    lib ??= Libudev(DynamicLibrary.open('libudev.so.1'));
    _udev = lib!.udev_new();
  }

  /// Discards any resources used by the object.
  void dispose() {
    for (final device in _devices.values) {
      device?._dispose();
    }
    lib!.udev_unref(_udev);
    instance = null;
  }

  /// Looks up the device object based on information found in `/sys/`,
  /// annotated with properties from the udev-internal device database.
  ///
  /// [syspath] is any subdirectory of `/sys/`, with the restriction that a
  /// subdirectory of `/sys/devices` (or a symlink to one) represents a real
  /// device and as such must contain a `uevent` file.
  UdevDevice? device({required String syspath}) {
    return _devices[syspath] ??= UdevDevice._fromSyspath(_udev, syspath);
  }
}

/// Provides APIs to introspect a device on the local system.
class UdevDevice {
  // ignore: non_constant_identifier_names
  final Pointer<udev_device> _udev_device;

  UdevDevice._(this._udev_device);

  static UdevDevice? _fromSyspath(Pointer<udev> udev, String syspath) {
    final cstr = syspath.toNativeUtf8();
    final dev = Udev.lib!.udev_device_new_from_syspath(udev, cstr.cast());
    malloc.free(cstr);
    if (dev == nullptr) return null;
    return UdevDevice._(dev);
  }

  void _dispose() => Udev.lib!.udev_device_unref(_udev_device);

  /// Model name (`ID_MODEL_FROM_DATABASE`).
  String get model => _getPropertyValue("ID_MODEL_FROM_DATABASE");

  /// Vendor name (`ID_VENDOR_FROM_DATABASE`).
  String get vendor => _getPropertyValue("ID_VENDOR_FROM_DATABASE");

  String _getPropertyValue(String key) {
    final ckey = key.toNativeUtf8().cast<Int8>();
    final cval = Udev.lib!.udev_device_get_property_value(_udev_device, ckey);
    if (cval == nullptr) return '';
    malloc.free(ckey);
    return cval.cast<Utf8>().toDartString();
  }
}
