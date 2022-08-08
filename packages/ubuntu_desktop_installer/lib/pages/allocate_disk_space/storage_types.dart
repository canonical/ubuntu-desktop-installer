import 'package:filesize/filesize.dart';
import 'package:subiquity_client/subiquity_client.dart';

export 'package:subiquity_client/subiquity_client.dart'
    show Disk, DiskObject, Gap, GapUsable, Partition;

extension DiskExtension on Disk {
  String get prettySize => filesize(size);
}

extension PartitionExtension on Partition {
  bool get canWipe => mount != null;
  bool get isWiped => wipe == 'superblock';
  String get prettySize => filesize(size ?? 0);
}
