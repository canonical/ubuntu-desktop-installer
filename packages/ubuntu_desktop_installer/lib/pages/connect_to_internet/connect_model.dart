import 'package:logger/logger.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

/// @internal
final log = Logger('connect_to_internet');

enum ConnectMode {
  none,
  ethernet,
  wifi,
}

abstract class ConnectModel extends SafeChangeNotifier {
  bool get canConnect;
  bool get canContinue;
  bool get isActive;
  bool get isBusy;
  bool get isEnabled;
  ConnectMode get connectMode;
  void onSelected();
  void onDeselected();
  Future<void> init();
  Future<void> enable();
  Future<void> connect();
}

class NoConnectModel extends ConnectModel {
  @override
  bool get canConnect => false;

  @override
  bool get canContinue => true;

  @override
  bool get isActive => false;

  @override
  bool get isBusy => false;

  @override
  bool get isEnabled => false;

  @override
  ConnectMode get connectMode => ConnectMode.none;

  @override
  void onSelected() {}

  @override
  void onDeselected() {}

  @override
  Future<void> init() async {}

  @override
  Future<void> enable() {
    throw UnsupportedError('Nothing to enable');
  }

  @override
  Future<void> connect() {
    throw UnsupportedError('Nothing to connect');
  }
}
