import 'package:file/memory.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_bootstrap/services.dart';

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

    final service = PostInstallService(file.path, fs: fs);
    expect(await service.load(), {
      'Num': '1',
      'Empty': '',
      'Str': 'foo bar',
      'Trim': 'baz',
    });

    expect(await service.get('Num'), equals('1'));
    expect(await service.get('Empty'), isEmpty);
    expect(await service.get('Str'), equals('foo bar'));
    expect(await service.get('Trim'), equals('baz'));
    expect(await service.get('None'), isNull);
  });

  test('initially missing config', () async {
    final fs = MemoryFileSystem.test();
    final file = fs.file('/foo/bar.conf');

    final service = PostInstallService(file.path, fs: fs);
    expect(await service.load(), isEmpty);
    expect(await service.get('Anything'), isNull);
    expect(file.existsSync(), isFalse);

    await service.set('Something', 'value');
    expect(file.existsSync(), isTrue);
    expect(file.readAsStringSync(), '''
Something=value
''');
  });

  test('save config', () async {
    final fs = MemoryFileSystem.test();
    final file = fs.file('/foo/bar.conf');

    final service = PostInstallService(file.path, fs: fs);
    await service.save({
      'Num': '1',
      'Empty': '',
      'Str': 'foo bar',
      'Trim': '  baz  ',
    });
    await service.set('Extra', 'value');

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
