import 'glibc.dart';

/// Returns the real user ID of the calling process.
int getuid() => glibc.getuid();

/// Returns the effective user ID of the calling process.
int geteuid() => glibc.geteuid();
