import 'package:file/memory.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_provision/services.dart';

void main() {
  test('load existing config', () async {
    final fs = MemoryFileSystem.test();
    final file = fs.file('/foo/bar.conf');

    file.createSync(recursive: true);
    file.writeAsStringSync('''
Num=1
Empty=
Str="foo bar"
Trim=  baz
''');

    final config = ConfigService(file.path, fs: fs);
    expect(await config.load(), {
      'Num': '1',
      'Empty': '',
      'Str': 'foo bar',
      'Trim': 'baz',
    });

    expect(await config.get('Num'), equals('1'));
    expect(await config.get('Empty'), isEmpty);
    expect(await config.get('Str'), equals('foo bar'));
    expect(await config.get('Trim'), equals('baz'));
    expect(await config.get('None'), isNull);
  });

  test('initially missing config', () async {
    final fs = MemoryFileSystem.test();
    final file = fs.file('/foo/bar.conf');

    final config = ConfigService(file.path, fs: fs);
    expect(await config.load(), isEmpty);
    expect(await config.get('Anything'), isNull);
    expect(file.existsSync(), isFalse);

    await config.set('Something', 'value');
    expect(file.existsSync(), isTrue);
    expect(file.readAsStringSync(), '''
Something=value
''');
  });

  test('save config', () async {
    final fs = MemoryFileSystem.test();
    final file = fs.file('/foo/bar.conf');

    final config = ConfigService(file.path, fs: fs);
    await config.save({
      'Num': '1',
      'Empty': '',
      'Str': 'foo bar',
      'Trim': '  baz  ',
    });
    await config.set('Extra', 'value');

    expect(file.existsSync(), isTrue);
    expect(file.readAsStringSync(), '''
Num=1
Empty=
Str="foo bar"
Trim=baz
Extra=value
''');
  });
}
