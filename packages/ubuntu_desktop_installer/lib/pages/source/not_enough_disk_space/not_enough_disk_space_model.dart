import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:ubuntu_desktop_installer/services/storage_service.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';

/// @internal
final log = Logger('not_enough_disk_space');

class NotEnoughDiskSpaceModel extends SafeChangeNotifier {
  NotEnoughDiskSpaceModel(this._service) {
    log.error(
        'Largest disk ${_service.largestDiskSize} vs. min install size: ${_service.installMinimumSize}');
  }

  final StorageService _service;

  int get largestDiskSize => _service.largestDiskSize;
  bool get hasMultipleDisks => _service.hasMultipleDisks;
  int get installMinimumSize => _service.installMinimumSize;
}
