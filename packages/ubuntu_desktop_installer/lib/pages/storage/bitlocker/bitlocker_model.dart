import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:ubuntu_desktop_installer/services.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';

/// @internal
final log = Logger('bitlocker');

/// Provider for [BitLockerModel].
final bitLockerModelProvider = ChangeNotifierProvider((_) =>
    BitLockerModel(getService<SessionService>(), getService<StorageService>()));

/// View model for [BitLockerPage].
class BitLockerModel extends SafeChangeNotifier {
  /// Creates an instance with the given client.
  BitLockerModel(this._session, this._storage);

  final SessionService _session;
  final StorageService _storage;

  Future<bool> init() async {
    final hasBitLocker = await _storage.hasBitLocker();
    if (hasBitLocker) {
      log.info('BitLocker must be turned off');
    }
    return hasBitLocker;
  }

  Future<void> reboot() => _session.reboot(immediate: true);
}
