import 'package:filesize/filesize.dart';
import 'package:subiquity_client/subiquity_client.dart';

export 'package:subiquity_client/subiquity_client.dart' show Disk, Partition;

extension DiskExtension on Disk {
  String get prettySize => filesize(size ?? 0);
}

extension PartitionExtension on Partition {
  bool get canWipe => preserve == true && mount != null;
  String get prettySize => filesize(size ?? 0);
}
