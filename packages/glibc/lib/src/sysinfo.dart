import 'dart:ffi' as ffi;

import 'package:collection/collection.dart';
import 'package:ffi/ffi.dart' as ffi;

import 'glibc.dart' as g;

export 'glibc.dart' show SI_LOAD_SHIFT;

// ignore_for_file: non_constant_identifier_names

/// Returns certain statistics on memory and swap usage, as well as the load
/// average.
Sysinfo sysinfo() {
  final ptr = ffi.malloc<g.sysinfo>();
  g.glibc.sysinfo1(ptr);

  final info = Sysinfo(
    uptime: Duration(seconds: ptr.ref.uptime),
    loads: [ptr.ref.loads[0], ptr.ref.loads[1], ptr.ref.loads[2]],
    totalram: ptr.ref.totalram,
    sharedram: ptr.ref.sharedram,
    bufferram: ptr.ref.bufferram,
    totalswap: ptr.ref.totalswap,
    freeswap: ptr.ref.freeswap,
    procs: ptr.ref.procs,
    totalhigh: ptr.ref.totalhigh,
    freehigh: ptr.ref.freehigh,
    mem_unit: ptr.ref.mem_unit,
  );

  ffi.malloc.free(ptr);
  return info;
}

/// Certain statistics on memory and swap usage, as well as the load average.
class Sysinfo {
  /// Constructs a new [Sysinfo] instance.
  Sysinfo({
    required this.uptime,
    required this.loads,
    required this.totalram,
    required this.sharedram,
    required this.bufferram,
    required this.totalswap,
    required this.freeswap,
    required this.procs,
    required this.totalhigh,
    required this.freehigh,
    required this.mem_unit,
  });

  /// Duration since boot
  final Duration uptime;

  /// 1, 5, and 15 minute load averages
  final List<int> loads;

  /// Available memory size
  final int totalram;

  /// Amount of shared memory
  final int sharedram;

  /// Memory used by buffers
  final int bufferram;

  /// Total swap space size
  final int totalswap;

  /// Swap space still available
  final int freeswap;

  /// Number of current processes
  final int procs;

  /// Total high memory size
  int totalhigh;

  /// Available high memory size
  int freehigh;

  /// Memory unit size in bytes
  int mem_unit;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Sysinfo &&
        uptime == other.uptime &&
        const DeepCollectionEquality().equals(other.loads, loads) &&
        totalram == other.totalram &&
        sharedram == other.sharedram &&
        bufferram == other.bufferram &&
        totalswap == other.totalswap &&
        freeswap == other.freeswap &&
        procs == other.procs &&
        totalhigh == other.totalhigh &&
        freehigh == other.freehigh &&
        mem_unit == other.mem_unit;
  }

  @override
  int get hashCode {
    return Object.hash(
      uptime,
      loads,
      totalram,
      sharedram,
      bufferram,
      totalswap,
      freeswap,
      procs,
      totalhigh,
      freehigh,
      mem_unit,
    );
  }

  @override
  String toString() {
    return 'Sysinfo(uptime: $uptime, loads: $loads, totalram: $totalram, sharedram: $sharedram, bufferram: $bufferram, totalswap: $totalswap, freeswap: $freeswap, procs: $procs, totalhigh: $totalhigh, freehigh: $freehigh, mem_unit: $mem_unit)';
  }
}
