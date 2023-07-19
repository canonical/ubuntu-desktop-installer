import 'package:file/memory.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_provision/src/services/config_service.dart';

void main() {
  test('yaml', () async {
    final fs = MemoryFileSystem();
    fs.file('/path/to/foo.yaml')
      ..createSync(recursive: true)
      ..writeAsStringSync('''
b: true
i: 123
d: 123.456
s: foo
l:
  - 1
  - 2
  - 3
o:
  b: true
  i: 123
  d: 123.456
  s: foo
  l:
    - 1
    - 2
    - 3
''');

    final config = ConfigService('/path/to/foo.yaml', fs: fs);
    expect(await config.get('b'), isTrue);
    expect(await config.get('i'), 123);
    expect(await config.get('d'), 123.456);
    expect(await config.get('s'), 'foo');
    expect(await config.get('l'), [1, 2, 3]);
    expect(await config.get('o'), {
      'b': true,
      'i': 123,
      'd': 123.456,
      's': 'foo',
      'l': [1, 2, 3],
    });
  });

  test('toml', () async {
    final fs = MemoryFileSystem();
    fs.file('/path/to/foo.toml')
      ..createSync(recursive: true)
      ..writeAsStringSync('''
b = true
i = 123
d = 123.456
s = "foo"
l = [1, 2, 3]
o = { b = true, i = 123, d = 123.456, s = "foo", l = [1, 2, 3] }
''');

    final config = ConfigService('/path/to/foo.toml', fs: fs);
    expect(await config.get('b'), isTrue);
    expect(await config.get('i'), 123);
    expect(await config.get('d'), 123.456);
    expect(await config.get('s'), 'foo');
    expect(await config.get('l'), [1, 2, 3]);
    expect(await config.get('o'), {
      'b': true,
      'i': 123,
      'd': 123.456,
      's': 'foo',
      'l': [1, 2, 3],
    });
  });

  test('json', () async {
    final fs = MemoryFileSystem();
    fs.file('/path/to/foo.json')
      ..createSync(recursive: true)
      ..writeAsStringSync('''
{
  "b": true,
  "i": 123,
  "d": 123.456,
  "s": "foo",
  "l": [1, 2, 3],
  "o": {
    "b": true,
    "i": 123,
    "d": 123.456,
    "s": "foo",
    "l": [1, 2, 3]
  }
}
''');

    final config = ConfigService('/path/to/foo.json', fs: fs);
    expect(await config.get('b'), isTrue);
    expect(await config.get('i'), 123);
    expect(await config.get('d'), 123.456);
    expect(await config.get('s'), 'foo');
    expect(await config.get('l'), [1, 2, 3]);
    expect(await config.get('o'), {
      'b': true,
      'i': 123,
      'd': 123.456,
      's': 'foo',
      'l': [1, 2, 3],
    });
  });
}
