import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';
import 'package:ubuntu_desktop_installer/services/storage_service.dart';
import 'package:ubuntu_logger/ubuntu_logger.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

/// @internal
final log = Logger('not_enough_disk_space');

final notEnoughDiskSpaceModelProvider =
    ChangeNotifierProvider<NotEnoughDiskSpaceModel>(
        (_) => NotEnoughDiskSpaceModel(getService<StorageService>()));

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
