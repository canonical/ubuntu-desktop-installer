import 'package:file/memory.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_desktop_installer/services.dart';

void main() {
  test('load existing config', () async {
    final fs = MemoryFileSystem.test();
    final file = fs.file('/foo/bar.conf');

    file.createSync(recursive: true);
    file.writeAsStringSync('''
Num=1
Empty=
Str="foo bar"
''');

    final config = ConfigService(file.path, fs: fs);
    expect(await config.load(), {
      'Num': '1',
      'Empty': '',
      'Str': 'foo bar',
    });
  });

  test('missing config', () async {
    final fs = MemoryFileSystem.test();
    final file = fs.file('/foo/bar.conf');

    final config = ConfigService(file.path, fs: fs);
    expect(await config.load(), isEmpty);
  });

  test('save config', () async {
    final fs = MemoryFileSystem.test();
    final file = fs.file('/foo/bar.conf');

    final config = ConfigService(file.path, fs: fs);
    await config.save({
      'Num': '1',
      'Empty': '',
      'Str': 'foo bar',
    });

    expect(file.existsSync(), isTrue);
    expect(file.readAsStringSync(), '''
Num=1
Empty=
Str="foo bar"
''');
  });
}
