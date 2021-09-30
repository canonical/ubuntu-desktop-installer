import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:test/test.dart';
import 'package:udev/src/bindings.g.dart';
import 'package:udev/src/udev.dart';

// ignore_for_file: non_constant_identifier_names

void main() {
  test('syspath', () {
    final lib = FakeLibudev(
      properties: {
        'ID_MODEL_FROM_DATABASE': 'id_model_from_database',
        'ID_VENDOR_FROM_DATABASE': 'id_vendor_from_database',
      },
    );
    Udev.lib = lib;

    final udev = Udev();
    expect(lib.calls, hasLength(1));
    expect(lib.arguments, hasLength(1));
    expect(lib.calls.last, equals('udev_new'));
    expect(lib.arguments.last, isEmpty);

    final device = UdevDevice.fromSyspath(udev, syspath: 'syspath');
    expect(lib.calls, hasLength(2));
    expect(lib.arguments, hasLength(2));
    expect(lib.calls.last, equals('udev_device_new_from_syspath'));
    expect(lib.arguments.last, equals([lib._udev, 'syspath']));

    expect(device, isNotNull);
    expect(device!.model, equals('id_model_from_database'));
    expect(lib.calls, hasLength(3));
    expect(lib.arguments, hasLength(3));
    expect(lib.calls.last, equals('udev_device_get_property_value'));
    expect(lib.arguments.last,
        equals([lib._udev_device, 'ID_MODEL_FROM_DATABASE']));

    expect(device.vendor, equals('id_vendor_from_database'));
    expect(lib.calls, hasLength(4));
    expect(lib.arguments, hasLength(4));
    expect(lib.calls.last, equals('udev_device_get_property_value'));
    expect(lib.arguments.last,
        equals([lib._udev_device, 'ID_VENDOR_FROM_DATABASE']));

    expect(UdevDevice.fromSyspath(udev, syspath: 'syspath'), same(device));

    udev.dispose();
    expect(lib.calls, hasLength(6));
    expect(lib.arguments, hasLength(6));
    expect(lib.calls[4], equals('udev_device_unref'));
    expect(lib.arguments[4], equals([lib._udev_device]));
    expect(lib.calls[5], equals('udev_unref'));
    expect(lib.arguments[5], equals([lib._udev]));
  });

  test('subsystem sysname', () {
    final lib = FakeLibudev(
      properties: {
        'ID_MODEL': 'id_model',
        'ID_VENDOR': 'id_vendor',
      },
    );
    Udev.lib = lib;

    final udev = Udev();
    expect(lib.calls, hasLength(1));
    expect(lib.arguments, hasLength(1));
    expect(lib.calls.last, equals('udev_new'));
    expect(lib.arguments.last, isEmpty);

    final device = UdevDevice.fromSysname(
      udev,
      subsystem: 'subsystem',
      sysname: 'sysname',
    );
    expect(lib.calls, hasLength(2));
    expect(lib.arguments, hasLength(2));
    expect(lib.calls.last, equals('udev_device_new_from_subsystem_sysname'));
    expect(lib.arguments.last, equals([lib._udev, 'subsystem', 'sysname']));

    expect(device, isNotNull);
    expect(device!.model, equals('id_model'));
    expect(lib.calls, hasLength(4));
    expect(lib.arguments, hasLength(4));
    expect(lib.calls.last, equals('udev_device_get_property_value'));
    expect(lib.arguments.last, equals([lib._udev_device, 'ID_MODEL']));

    expect(device.vendor, equals('id_vendor'));
    expect(lib.calls, hasLength(6));
    expect(lib.arguments, hasLength(6));
    expect(lib.calls.last, equals('udev_device_get_property_value'));
    expect(lib.arguments.last, equals([lib._udev_device, 'ID_VENDOR']));

    expect(
      UdevDevice.fromSysname(udev, subsystem: 'subsystem', sysname: 'sysname'),
      same(device),
    );

    udev.dispose();
    expect(lib.calls, hasLength(8));
    expect(lib.arguments, hasLength(8));
    expect(lib.calls[6], equals('udev_device_unref'));
    expect(lib.arguments[6], equals([lib._udev_device]));
    expect(lib.calls[7], equals('udev_unref'));
    expect(lib.arguments[7], equals([lib._udev]));
  });
}

class FakeLibudev implements Libudev {
  FakeLibudev({required this.properties});

  final calls = <String>[];
  final arguments = <List<Object>>[];
  final Map<String, String> properties;

  Pointer<udev>? _udev;
  Pointer<udev_device>? _udev_device;

  Pointer<udev> udev_new() {
    calls.add('udev_new');
    arguments.add([]);
    return _udev ??= 'udev'.toNativeUtf8().cast();
  }

  Pointer<udev> udev_unref(Pointer<udev> udev) {
    calls.add('udev_unref');
    arguments.add([udev]);
    malloc.free(udev);
    return nullptr;
  }

  Pointer<udev_device> udev_device_unref(Pointer<udev_device> udev_device) {
    calls.add('udev_device_unref');
    arguments.add([udev_device]);
    malloc.free(udev_device);
    return nullptr;
  }

  Pointer<udev_device> udev_device_new_from_subsystem_sysname(
    Pointer<udev> udev,
    Pointer<Int8> subsystem,
    Pointer<Int8> sysname,
  ) {
    calls.add('udev_device_new_from_subsystem_sysname');
    arguments.add([
      udev,
      subsystem.cast<Utf8>().toDartString(),
      sysname.cast<Utf8>().toDartString(),
    ]);
    return _udev_device ??= 'udev_device'.toNativeUtf8().cast();
  }

  Pointer<udev_device> udev_device_new_from_syspath(
    Pointer<udev> udev,
    Pointer<Int8> syspath,
  ) {
    calls.add('udev_device_new_from_syspath');
    arguments.add([udev, syspath.cast<Utf8>().toDartString()]);
    return _udev_device ??= 'udev_device'.toNativeUtf8().cast();
  }

  Pointer<Int8> udev_device_get_property_value(
    Pointer<udev_device> udev_device,
    Pointer<Int8> key,
  ) {
    calls.add('udev_device_get_property_value');
    arguments.add([udev_device, key.cast<Utf8>().toDartString()]);
    return properties[key.cast<Utf8>().toDartString()]?.toNativeUtf8().cast() ??
        nullptr.cast();
  }
}
