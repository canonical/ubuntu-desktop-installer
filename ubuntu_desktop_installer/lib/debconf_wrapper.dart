import 'dart:convert';
import 'dart:io';

/// A helper class that wraps calls to debconf.
class DebconfWrapper {
  static Future<String> _debconfGet(String key) async {
    var result = '';
    var process = await Process.start('debconf-communicate', []);
    process.stdout
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .first
        .then((value) {
      result = value.split(' ').last;
    });
    process.stdin.writeln('get $key');
    return Future.doWhile(() async {
      await Future.delayed(Duration(milliseconds: 10));
      return result.isEmpty;
    }).then((value) {
      process.kill();
      return result;
    });
  }

  /// Asynchronously query debconf for the current keyboard layout.
  static Future<String> queryKeyboardLayoutCode() async {
    return _debconfGet('keyboard-configuration/layoutcode');
  }

  /// Asynchronously query debconf for the current keyboard variant.
  static Future<String> queryKeyboardVariantCode() async {
    return _debconfGet('keyboard-configuration/variantcode');
  }
}
