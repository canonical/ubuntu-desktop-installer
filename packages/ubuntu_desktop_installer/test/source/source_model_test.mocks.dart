// Mocks generated by Mockito 5.3.2 from annotations
// in ubuntu_desktop_installer/test/source/source_model_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:dbus/dbus.dart' as _i8;
import 'package:mockito/mockito.dart' as _i1;
import 'package:nm/nm.dart' as _i3;
import 'package:subiquity_client/subiquity_client.dart' as _i2;
import 'package:ubuntu_desktop_installer/services/network_service.dart' as _i7;
import 'package:ubuntu_desktop_installer/services/power_service.dart' as _i9;
import 'package:ubuntu_desktop_installer/services/storage_service.dart' as _i5;
import 'package:upower/upower.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeGuidedStorageResponseV2_0 extends _i1.SmartFake
    implements _i2.GuidedStorageResponseV2 {
  _FakeGuidedStorageResponseV2_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeNetworkManagerSettings_1 extends _i1.SmartFake
    implements _i3.NetworkManagerSettings {
  _FakeNetworkManagerSettings_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeNetworkManagerDnsManager_2 extends _i1.SmartFake
    implements _i3.NetworkManagerDnsManager {
  _FakeNetworkManagerDnsManager_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeNetworkManagerActiveConnection_3 extends _i1.SmartFake
    implements _i3.NetworkManagerActiveConnection {
  _FakeNetworkManagerActiveConnection_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUPowerKbdBacklight_4 extends _i1.SmartFake
    implements _i4.UPowerKbdBacklight {
  _FakeUPowerKbdBacklight_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUPowerDevice_5 extends _i1.SmartFake implements _i4.UPowerDevice {
  _FakeUPowerDevice_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [StorageService].
///
/// See the documentation for Mockito's code generation for more information.
class MockStorageService extends _i1.Mock implements _i5.StorageService {
  MockStorageService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get hasMultipleDisks => (super.noSuchMethod(
        Invocation.getter(#hasMultipleDisks),
        returnValue: false,
      ) as bool);
  @override
  bool get needRoot => (super.noSuchMethod(
        Invocation.getter(#needRoot),
        returnValue: false,
      ) as bool);
  @override
  bool get needBoot => (super.noSuchMethod(
        Invocation.getter(#needBoot),
        returnValue: false,
      ) as bool);
  @override
  bool get useEncryption => (super.noSuchMethod(
        Invocation.getter(#useEncryption),
        returnValue: false,
      ) as bool);
  @override
  set useEncryption(bool? useEncryption) => super.noSuchMethod(
        Invocation.setter(
          #useEncryption,
          useEncryption,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get hasSecureBoot => (super.noSuchMethod(
        Invocation.getter(#hasSecureBoot),
        returnValue: false,
      ) as bool);
  @override
  bool get useLvm => (super.noSuchMethod(
        Invocation.getter(#useLvm),
        returnValue: false,
      ) as bool);
  @override
  set useLvm(bool? useLvm) => super.noSuchMethod(
        Invocation.setter(
          #useLvm,
          useLvm,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set securityKey(String? securityKey) => super.noSuchMethod(
        Invocation.setter(
          #securityKey,
          securityKey,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set guidedTarget(_i2.GuidedStorageTarget? target) => super.noSuchMethod(
        Invocation.setter(
          #guidedTarget,
          target,
        ),
        returnValueForMissingStub: null,
      );
  @override
  int get installMinimumSize => (super.noSuchMethod(
        Invocation.getter(#installMinimumSize),
        returnValue: 0,
      ) as int);
  @override
  int get largestDiskSize => (super.noSuchMethod(
        Invocation.getter(#largestDiskSize),
        returnValue: 0,
      ) as int);
  @override
  _i6.Future<void> init() => (super.noSuchMethod(
        Invocation.method(
          #init,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<bool> hasBitLocker() => (super.noSuchMethod(
        Invocation.method(
          #hasBitLocker,
          [],
        ),
        returnValue: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
  @override
  _i6.Future<_i2.GuidedStorageResponseV2> getGuidedStorage() =>
      (super.noSuchMethod(
        Invocation.method(
          #getGuidedStorage,
          [],
        ),
        returnValue: _i6.Future<_i2.GuidedStorageResponseV2>.value(
            _FakeGuidedStorageResponseV2_0(
          this,
          Invocation.method(
            #getGuidedStorage,
            [],
          ),
        )),
      ) as _i6.Future<_i2.GuidedStorageResponseV2>);
  @override
  _i6.Future<void> setGuidedStorage() => (super.noSuchMethod(
        Invocation.method(
          #setGuidedStorage,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<List<_i2.Disk>> getStorage() => (super.noSuchMethod(
        Invocation.method(
          #getStorage,
          [],
        ),
        returnValue: _i6.Future<List<_i2.Disk>>.value(<_i2.Disk>[]),
      ) as _i6.Future<List<_i2.Disk>>);
  @override
  _i6.Future<List<_i2.Disk>> getOriginalStorage() => (super.noSuchMethod(
        Invocation.method(
          #getOriginalStorage,
          [],
        ),
        returnValue: _i6.Future<List<_i2.Disk>>.value(<_i2.Disk>[]),
      ) as _i6.Future<List<_i2.Disk>>);
  @override
  _i6.Future<List<_i2.Disk>> addPartition(
    _i2.Disk? disk,
    _i2.Gap? gap,
    _i2.Partition? partition,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addPartition,
          [
            disk,
            gap,
            partition,
          ],
        ),
        returnValue: _i6.Future<List<_i2.Disk>>.value(<_i2.Disk>[]),
      ) as _i6.Future<List<_i2.Disk>>);
  @override
  _i6.Future<List<_i2.Disk>> editPartition(
    _i2.Disk? disk,
    _i2.Partition? partition,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #editPartition,
          [
            disk,
            partition,
          ],
        ),
        returnValue: _i6.Future<List<_i2.Disk>>.value(<_i2.Disk>[]),
      ) as _i6.Future<List<_i2.Disk>>);
  @override
  _i6.Future<List<_i2.Disk>> deletePartition(
    _i2.Disk? disk,
    _i2.Partition? partition,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #deletePartition,
          [
            disk,
            partition,
          ],
        ),
        returnValue: _i6.Future<List<_i2.Disk>>.value(<_i2.Disk>[]),
      ) as _i6.Future<List<_i2.Disk>>);
  @override
  _i6.Future<List<_i2.Disk>> setStorage() => (super.noSuchMethod(
        Invocation.method(
          #setStorage,
          [],
        ),
        returnValue: _i6.Future<List<_i2.Disk>>.value(<_i2.Disk>[]),
      ) as _i6.Future<List<_i2.Disk>>);
  @override
  _i6.Future<List<_i2.Disk>> resetStorage() => (super.noSuchMethod(
        Invocation.method(
          #resetStorage,
          [],
        ),
        returnValue: _i6.Future<List<_i2.Disk>>.value(<_i2.Disk>[]),
      ) as _i6.Future<List<_i2.Disk>>);
  @override
  _i6.Future<List<_i2.Disk>> addBootPartition(_i2.Disk? disk) =>
      (super.noSuchMethod(
        Invocation.method(
          #addBootPartition,
          [disk],
        ),
        returnValue: _i6.Future<List<_i2.Disk>>.value(<_i2.Disk>[]),
      ) as _i6.Future<List<_i2.Disk>>);
  @override
  _i6.Future<List<_i2.Disk>> reformatDisk(_i2.Disk? disk) =>
      (super.noSuchMethod(
        Invocation.method(
          #reformatDisk,
          [disk],
        ),
        returnValue: _i6.Future<List<_i2.Disk>>.value(<_i2.Disk>[]),
      ) as _i6.Future<List<_i2.Disk>>);
}

/// A class which mocks [NetworkService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkService extends _i1.Mock implements _i7.NetworkService {
  MockNetworkService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: false,
      ) as bool);
  @override
  bool get isConnectedSite => (super.noSuchMethod(
        Invocation.getter(#isConnectedSite),
        returnValue: false,
      ) as bool);
  @override
  List<_i3.NetworkManagerDevice> get wiredDevices => (super.noSuchMethod(
        Invocation.getter(#wiredDevices),
        returnValue: <_i3.NetworkManagerDevice>[],
      ) as List<_i3.NetworkManagerDevice>);
  @override
  List<_i3.NetworkManagerDevice> get wirelessDevices => (super.noSuchMethod(
        Invocation.getter(#wirelessDevices),
        returnValue: <_i3.NetworkManagerDevice>[],
      ) as List<_i3.NetworkManagerDevice>);
  @override
  _i6.Stream<_i3.NetworkManagerDevice> get deviceAdded => (super.noSuchMethod(
        Invocation.getter(#deviceAdded),
        returnValue: _i6.Stream<_i3.NetworkManagerDevice>.empty(),
      ) as _i6.Stream<_i3.NetworkManagerDevice>);
  @override
  _i6.Stream<_i3.NetworkManagerDevice> get deviceRemoved => (super.noSuchMethod(
        Invocation.getter(#deviceRemoved),
        returnValue: _i6.Stream<_i3.NetworkManagerDevice>.empty(),
      ) as _i6.Stream<_i3.NetworkManagerDevice>);
  @override
  _i6.Stream<_i3.NetworkManagerActiveConnection> get activeConnectionAdded =>
      (super.noSuchMethod(
        Invocation.getter(#activeConnectionAdded),
        returnValue: _i6.Stream<_i3.NetworkManagerActiveConnection>.empty(),
      ) as _i6.Stream<_i3.NetworkManagerActiveConnection>);
  @override
  _i6.Stream<_i3.NetworkManagerActiveConnection> get activeConnectionRemoved =>
      (super.noSuchMethod(
        Invocation.getter(#activeConnectionRemoved),
        returnValue: _i6.Stream<_i3.NetworkManagerActiveConnection>.empty(),
      ) as _i6.Stream<_i3.NetworkManagerActiveConnection>);
  @override
  _i6.Stream<List<String>> get propertiesChanged => (super.noSuchMethod(
        Invocation.getter(#propertiesChanged),
        returnValue: _i6.Stream<List<String>>.empty(),
      ) as _i6.Stream<List<String>>);
  @override
  List<_i3.NetworkManagerDevice> get devices => (super.noSuchMethod(
        Invocation.getter(#devices),
        returnValue: <_i3.NetworkManagerDevice>[],
      ) as List<_i3.NetworkManagerDevice>);
  @override
  List<_i3.NetworkManagerDevice> get allDevices => (super.noSuchMethod(
        Invocation.getter(#allDevices),
        returnValue: <_i3.NetworkManagerDevice>[],
      ) as List<_i3.NetworkManagerDevice>);
  @override
  bool get networkingEnabled => (super.noSuchMethod(
        Invocation.getter(#networkingEnabled),
        returnValue: false,
      ) as bool);
  @override
  bool get wirelessEnabled => (super.noSuchMethod(
        Invocation.getter(#wirelessEnabled),
        returnValue: false,
      ) as bool);
  @override
  bool get wirelessHardwareEnabled => (super.noSuchMethod(
        Invocation.getter(#wirelessHardwareEnabled),
        returnValue: false,
      ) as bool);
  @override
  bool get wwanEnabled => (super.noSuchMethod(
        Invocation.getter(#wwanEnabled),
        returnValue: false,
      ) as bool);
  @override
  bool get wwanHardwareEnabled => (super.noSuchMethod(
        Invocation.getter(#wwanHardwareEnabled),
        returnValue: false,
      ) as bool);
  @override
  List<_i3.NetworkManagerActiveConnection> get activeConnections =>
      (super.noSuchMethod(
        Invocation.getter(#activeConnections),
        returnValue: <_i3.NetworkManagerActiveConnection>[],
      ) as List<_i3.NetworkManagerActiveConnection>);
  @override
  String get primaryConnectionType => (super.noSuchMethod(
        Invocation.getter(#primaryConnectionType),
        returnValue: '',
      ) as String);
  @override
  _i3.NetworkManagerMetered get metered => (super.noSuchMethod(
        Invocation.getter(#metered),
        returnValue: _i3.NetworkManagerMetered.unknown,
      ) as _i3.NetworkManagerMetered);
  @override
  bool get startup => (super.noSuchMethod(
        Invocation.getter(#startup),
        returnValue: false,
      ) as bool);
  @override
  String get version => (super.noSuchMethod(
        Invocation.getter(#version),
        returnValue: '',
      ) as String);
  @override
  _i3.NetworkManagerConnectivityState get connectivity => (super.noSuchMethod(
        Invocation.getter(#connectivity),
        returnValue: _i3.NetworkManagerConnectivityState.unknown,
      ) as _i3.NetworkManagerConnectivityState);
  @override
  bool get connectivityCheckAvailable => (super.noSuchMethod(
        Invocation.getter(#connectivityCheckAvailable),
        returnValue: false,
      ) as bool);
  @override
  bool get connectivityCheckEnabled => (super.noSuchMethod(
        Invocation.getter(#connectivityCheckEnabled),
        returnValue: false,
      ) as bool);
  @override
  String get connectivityCheckUri => (super.noSuchMethod(
        Invocation.getter(#connectivityCheckUri),
        returnValue: '',
      ) as String);
  @override
  _i3.NetworkManagerState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _i3.NetworkManagerState.unknown,
      ) as _i3.NetworkManagerState);
  @override
  _i3.NetworkManagerSettings get settings => (super.noSuchMethod(
        Invocation.getter(#settings),
        returnValue: _FakeNetworkManagerSettings_1(
          this,
          Invocation.getter(#settings),
        ),
      ) as _i3.NetworkManagerSettings);
  @override
  _i3.NetworkManagerDnsManager get dnsManager => (super.noSuchMethod(
        Invocation.getter(#dnsManager),
        returnValue: _FakeNetworkManagerDnsManager_2(
          this,
          Invocation.getter(#dnsManager),
        ),
      ) as _i3.NetworkManagerDnsManager);
  @override
  Map<String, Map<String, _i8.DBusValue>> getWifiSettings(
          {required String? ssid}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getWifiSettings,
          [],
          {#ssid: ssid},
        ),
        returnValue: <String, Map<String, _i8.DBusValue>>{},
      ) as Map<String, Map<String, _i8.DBusValue>>);
  @override
  _i6.Future<void> markConfigured() => (super.noSuchMethod(
        Invocation.method(
          #markConfigured,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> connect() => (super.noSuchMethod(
        Invocation.method(
          #connect,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> setWirelessEnabled(bool? value) => (super.noSuchMethod(
        Invocation.method(
          #setWirelessEnabled,
          [value],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> setWwanEnabled(bool? value) => (super.noSuchMethod(
        Invocation.method(
          #setWwanEnabled,
          [value],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> setConnectivityCheckEnabled(bool? value) =>
      (super.noSuchMethod(
        Invocation.method(
          #setConnectivityCheckEnabled,
          [value],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<_i3.NetworkManagerActiveConnection> addAndActivateConnection({
    Map<String, Map<String, _i8.DBusValue>>? connection = const {},
    required _i3.NetworkManagerDevice? device,
    _i3.NetworkManagerAccessPoint? accessPoint,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #addAndActivateConnection,
          [],
          {
            #connection: connection,
            #device: device,
            #accessPoint: accessPoint,
          },
        ),
        returnValue: _i6.Future<_i3.NetworkManagerActiveConnection>.value(
            _FakeNetworkManagerActiveConnection_3(
          this,
          Invocation.method(
            #addAndActivateConnection,
            [],
            {
              #connection: connection,
              #device: device,
              #accessPoint: accessPoint,
            },
          ),
        )),
      ) as _i6.Future<_i3.NetworkManagerActiveConnection>);
  @override
  _i6.Future<_i3.NetworkManagerActiveConnection> activateConnection({
    required _i3.NetworkManagerDevice? device,
    _i3.NetworkManagerSettingsConnection? connection,
    _i3.NetworkManagerAccessPoint? accessPoint,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #activateConnection,
          [],
          {
            #device: device,
            #connection: connection,
            #accessPoint: accessPoint,
          },
        ),
        returnValue: _i6.Future<_i3.NetworkManagerActiveConnection>.value(
            _FakeNetworkManagerActiveConnection_3(
          this,
          Invocation.method(
            #activateConnection,
            [],
            {
              #device: device,
              #connection: connection,
              #accessPoint: accessPoint,
            },
          ),
        )),
      ) as _i6.Future<_i3.NetworkManagerActiveConnection>);
  @override
  _i6.Future<void> deactivateConnection(
          _i3.NetworkManagerActiveConnection? connection) =>
      (super.noSuchMethod(
        Invocation.method(
          #deactivateConnection,
          [connection],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
}

/// A class which mocks [PowerService].
///
/// See the documentation for Mockito's code generation for more information.
class MockPowerService extends _i1.Mock implements _i9.PowerService {
  MockPowerService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.UPowerKbdBacklight get kbdBacklight => (super.noSuchMethod(
        Invocation.getter(#kbdBacklight),
        returnValue: _FakeUPowerKbdBacklight_4(
          this,
          Invocation.getter(#kbdBacklight),
        ),
      ) as _i4.UPowerKbdBacklight);
  @override
  set kbdBacklight(_i4.UPowerKbdBacklight? _kbdBacklight) => super.noSuchMethod(
        Invocation.setter(
          #kbdBacklight,
          _kbdBacklight,
        ),
        returnValueForMissingStub: null,
      );
  @override
  String get daemonVersion => (super.noSuchMethod(
        Invocation.getter(#daemonVersion),
        returnValue: '',
      ) as String);
  @override
  bool get onBattery => (super.noSuchMethod(
        Invocation.getter(#onBattery),
        returnValue: false,
      ) as bool);
  @override
  bool get lidIsPresent => (super.noSuchMethod(
        Invocation.getter(#lidIsPresent),
        returnValue: false,
      ) as bool);
  @override
  bool get lidIsClosed => (super.noSuchMethod(
        Invocation.getter(#lidIsClosed),
        returnValue: false,
      ) as bool);
  @override
  List<_i4.UPowerDevice> get devices => (super.noSuchMethod(
        Invocation.getter(#devices),
        returnValue: <_i4.UPowerDevice>[],
      ) as List<_i4.UPowerDevice>);
  @override
  _i4.UPowerDevice get displayDevice => (super.noSuchMethod(
        Invocation.getter(#displayDevice),
        returnValue: _FakeUPowerDevice_5(
          this,
          Invocation.getter(#displayDevice),
        ),
      ) as _i4.UPowerDevice);
  @override
  _i6.Stream<_i4.UPowerDevice> get deviceAdded => (super.noSuchMethod(
        Invocation.getter(#deviceAdded),
        returnValue: _i6.Stream<_i4.UPowerDevice>.empty(),
      ) as _i6.Stream<_i4.UPowerDevice>);
  @override
  _i6.Stream<_i4.UPowerDevice> get deviceRemoved => (super.noSuchMethod(
        Invocation.getter(#deviceRemoved),
        returnValue: _i6.Stream<_i4.UPowerDevice>.empty(),
      ) as _i6.Stream<_i4.UPowerDevice>);
  @override
  _i6.Stream<List<String>> get propertiesChanged => (super.noSuchMethod(
        Invocation.getter(#propertiesChanged),
        returnValue: _i6.Stream<List<String>>.empty(),
      ) as _i6.Stream<List<String>>);
  @override
  _i6.Future<void> connect() => (super.noSuchMethod(
        Invocation.method(
          #connect,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<String> getCriticalAction() => (super.noSuchMethod(
        Invocation.method(
          #getCriticalAction,
          [],
        ),
        returnValue: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
}
