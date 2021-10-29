import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:gettext_parser/gettext_parser.dart' as gettext;
import 'package:path/path.dart' as p;

void importPoFiles({
  required Directory dir,
  required String prefix,
  required String output,
  bool? verbose,
}) {
  final enFile = File(p.join(output, '${prefix}_en.arb'));
  final enArb = enFile.parseArb(allowEmpty: false);

  for (final poFile in dir.listSync()) {
    if (poFile is! File || p.extension(poFile.path) != '.po') continue;

    final locale = p.basenameWithoutExtension(poFile.path);
    final arbFile = File(p.join(output, '${prefix}_$locale.arb'));
    if (!arbFile.existsSync()) continue;

    final arbJson = arbFile.readJsonSync();
    final arbData = Map.of(arbJson);
    final poData = poFile.parsePo();

    for (final context in poData['translations'].entries) {
      for (final msg in context.value.entries) {
        for (final match in enArb[msg.key] ?? []) {
          final tr = (msg.value['msgstr'] as List<String>?)?.firstOrNull;
          if (tr != null && tr.isNotEmpty) {
            arbData[match] ??= tr;
          }
        }
      }
    }

    if (!const MapEquality().equals(arbData, arbJson)) {
      if (verbose == true) print('M ${arbFile.path}');
      arbFile.writeJsonSync(arbData);
    }
  }
}

extension JsonFile on File {
  Map<String, dynamic> readJsonSync({bool allowEmpty = true}) {
    try {
      return jsonDecode(readAsStringSync()) as Map<String, dynamic>;
    } on Exception {
      if (allowEmpty) return {};
      rethrow;
    }
  }

  void writeJsonSync(Map<String, dynamic> json) {
    final data = const JsonEncoder.withIndent('  ').convert(json);
    writeAsStringSync(data + '\n');
  }
}

extension ArbFile on File {
  Map<String, List<String>> parseArb({bool allowEmpty = true}) {
    final translations = Map<String, List<String>>();
    final json = readJsonSync(allowEmpty: allowEmpty);
    for (final entry in json.entries) {
      if (entry.key.startsWith('@') || entry.value is! String) continue;
      (translations[entry.value] ??= []).add(entry.key);
    }
    return translations;
  }
}

extension PoFile on File {
  Map<String, dynamic> parsePo() {
    return gettext.po.parse(readAsStringSync());
  }
}
