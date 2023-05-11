import 'dart:ui';

import 'package:file/memory.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:ubuntu_desktop_installer/pages/welcome/welcome_model.dart';
import 'package:ubuntu_desktop_installer/services/network_service.dart';

import 'welcome_model_test.mocks.dart';

@GenerateMocks([NetworkService])
void main() {
  test('selected option', () {
    final network = MockNetworkService();
    final model = WelcomeModel(network: network);

    var wasNotified = false;
    model.addListener(() => wasNotified = true);

    expect(model.option, equals(Option.none));
    model.selectOption(Option.none);
    expect(model.option, equals(Option.none));
    expect(wasNotified, isFalse);

    model.selectOption(Option.installUbuntu);
    expect(model.option, equals(Option.installUbuntu));
    expect(wasNotified, isTrue);
  });

  test('release notes URL from cdrom', () {
    final network = MockNetworkService();
    final model = WelcomeModel(network: network);

    final fs = MemoryFileSystem.test();
    final file = fs.file('/cdrom/.disk/release_notes_url');
    file.createSync(recursive: true);
    file.writeAsStringSync('''
https://wiki.ubuntu.com/IntrepidReleaseNotes/\${LANG}
    ''');

    final url = model.releaseNotesURL(const Locale('fr'), fs: fs);
    expect(url, equals('https://wiki.ubuntu.com/IntrepidReleaseNotes/fr'));
  });

  test('release notes URL from distro-info', () {
    final network = MockNetworkService();
    final model = WelcomeModel(network: network);

    final fs = MemoryFileSystem.test();
    final file = fs.file('/usr/share/distro-info/ubuntu.csv');
    file.createSync(recursive: true);
    file.writeAsStringSync('''
version,codename,series,created,release,eol,eol-server,eol-esm
4.10,Warty Warthog,warty,2004-03-05,2004-10-20,2006-04-30
5.04,Hoary Hedgehog,hoary,2004-10-20,2005-04-08,2006-10-31
    ''');

    final url = model.releaseNotesURL(const Locale('en'), fs: fs);
    expect(url, equals('https://wiki.ubuntu.com/HoaryHedgehog/ReleaseNotes'));
  });

  test('release notes URL fallback', () {
    final network = MockNetworkService();
    final model = WelcomeModel(network: network);

    final fs = MemoryFileSystem.test();
    final url = model.releaseNotesURL(const Locale('en'), fs: fs);
    expect(url, equals('https://ubuntu.com/download/desktop'));
  });
}
