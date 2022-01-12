import 'dart:ffi';

import 'glibc.g.dart';
export 'glibc.g.dart';

/// @internal
final glibc = GlibC(DynamicLibrary.process());
