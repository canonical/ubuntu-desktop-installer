import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';

/// @internal
final log = Logger('network');

final noConnectModelProvider = ChangeNotifierProvider((_) => NoConnectModel());

enum ConnectMode {
  none,
  ethernet,
  wifi,
  hiddenWifi,
}

/// Holds the state of a connection mode (ethernet, wifi, or none).
abstract class ConnectModel extends SafeChangeNotifier {
  /// Whether currently selected connection is ready to connect.
  bool get canConnect;

  /// Whether the currently selected connection is active.
  bool get isConnected;

  /// Whether the currently selected connection is being established.
  bool get isConnecting;

  /// Whether any of the connections is active, but not necessarily selected.
  bool get hasActiveConnection;

  /// Whether this connection mode is enabled.
  bool get isEnabled;

  /// Emits when the availability (enabled, has active connection) changes.
  Stream get onAvailabilityChanged;

  /// Ethernet/wifi/none...
  ConnectMode get connectMode;

  /// Called when the connection mode is selected.
  void onSelected();

  /// Called when the connection mode is unselected.
  void onDeselected();

  /// Called at initialization phase when entering the page.
  Future<void> init();

  /// Called at cleanup phase when leaving the page.
  Future<void> cleanup();

  /// Enables the connection mode.
  Future<void> enable();

  /// Establishes a connection.
  Future<void> connect();
}

/// "I don't want to connect to the internet just now"
class NoConnectModel extends ConnectModel {
  @override
  bool get canConnect => false;

  @override
  bool get isConnected => true;

  @override
  bool get hasActiveConnection => false;

  @override
  bool get isConnecting => false;

  @override
  bool get isEnabled => true;

  @override
  Stream get onAvailabilityChanged => const Stream.empty();

  @override
  ConnectMode get connectMode => ConnectMode.none;

  @override
  void onSelected() {}

  @override
  void onDeselected() {}

  @override
  Future<void> init() async {}

  @override
  Future<void> cleanup() async {}

  @override
  Future<void> enable() {
    throw UnsupportedError('Nothing to enable');
  }

  @override
  Future<void> connect() {
    throw UnsupportedError('Nothing to connect');
  }
}
