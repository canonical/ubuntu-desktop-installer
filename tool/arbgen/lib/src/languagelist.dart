import 'dart:io';

void importLanguagelist({
  required File file,
  required String prefix,
  required String output,
  bool? verbose,
}) {
  // langcode;language (en);language (orig);supported_environments;countrycode;fallbacklocale;langlist;console-setup
  for (var line in file.readAsLinesSync()) {
    final parts = line.split('#').first.split(';'); // ignore comments (#)
    if (parts.length != 8 || parts[2].isEmpty || parts[4].isEmpty) continue;
    _writeArbFile(
      prefix: prefix,
      output: output,
      languageCode: parts[0].split('_').first,
      languageName: parts[2],
      countryCode: parts[4],
      verbose: verbose,
    );
  }
}

void _writeArbFile({
  required String prefix,
  required String output,
  required String languageName,
  required String languageCode,
  required String countryCode,
  bool? verbose,
}) {
  final path = '$output/${prefix}_$languageCode.arb';
  final file = File(path);
  if (!file.existsSync()) {
    if (verbose == true) print('A ${file.path}');
    file.createSync(recursive: true);
    file.writeAsStringSync('''
{
  "@@locale": "$languageCode",
  "countryCode": "$countryCode",
  "languageName": "$languageName"
}
''');
  }
}
