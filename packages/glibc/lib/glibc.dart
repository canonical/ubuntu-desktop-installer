/// glibc FFI bindings
///
/// Usage:
///
/// ```dart
/// import 'package:glibc/glibc.dart';
///
/// void main() {
///   if (geteuid() == 0) {
///     print('WARNING: running as root');
///   }
///
///   final info = sysinfo();
///   print('Uptime: ${info.uptime}');
///   print('Load average: ${info.loads[0] / (1 << SI_LOAD_SHIFT)}');
/// }
/// ```
library glibc;

export 'src/getuid.dart';
export 'src/sysinfo.dart';
