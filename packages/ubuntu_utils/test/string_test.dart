import 'package:flutter_test/flutter_test.dart';
import 'package:ubuntu_utils/src/string.dart';

void main() {
  test('if not empty', () {
    expect(''.orIfEmpty('other'), equals('other'));
    expect('not empty'.orIfEmpty('other'), equals('not empty'));
    expect(''.orIfEmpty(null), isNull);
  });

  test('sanitize', () {
    expect(''.sanitize(), equals(''));
    expect('a'.sanitize(), equals('a'));
    expect('abc'.sanitize(), equals('abc'));
    expect(' a b c '.sanitize(), equals('a-b-c'));
    expect('#a€_B@ëc?'.sanitize(), equals('a-B-c'));
    expect(' "#§abc&?" '.sanitize(), equals('abc'));
    expect('  myname  '.sanitize(), equals('myname'));
  });
}
