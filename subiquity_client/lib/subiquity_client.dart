library subiquity_client;

import 'dart:convert';
import 'dart:ui';
import 'package:diacritic/diacritic.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart';
import 'package:tuple/tuple.dart';
import 'src/http_unix_client.dart';
import 'src/types.dart';

class SubiquityClient {
  HttpUnixClient _client;

  void open(String socketPath) {
    _client = HttpUnixClient(socketPath);
  }

  void close() {
    _client.close();
  }

  Future<String> locale() async {
    final request = Request('GET', Uri.http('localhost', 'locale'));
    final response = await _client.send(request);
    final responseStr = await response.stream.bytesToString();
    return responseStr.replaceAll('"', '');
  }

  Future<KeyboardSetting> keyboard() async {
    final request = Request('GET', Uri.http('localhost', 'keyboard'));
    final response = await _client.send(request);

    final keyboardJson = jsonDecode(await response.stream.bytesToString());
    return KeyboardSetting.fromJson(keyboardJson);
  }

  Future<String> proxy() async {
    final request = Request('GET', Uri.http('localhost', 'proxy'));
    final response = await _client.send(request);
    final responseStr = await response.stream.bytesToString();
    return responseStr.replaceAll('"', '');
  }

  Future<String> mirror() async {
    final request = Request('GET', Uri.http('localhost', 'mirror'));
    final response = await _client.send(request);
    final responseStr = await response.stream.bytesToString();
    return responseStr.replaceAll('"', '');
  }

  Future<IdentityData> identity() async {
    final request = Request('GET', Uri.http('localhost', 'identity'));
    final response = await _client.send(request);

    final identityJson = jsonDecode(await response.stream.bytesToString());
    return IdentityData.fromJson(identityJson);
  }

  Future<SSHData> ssh() async {
    final request = Request('GET', Uri.http('localhost', 'ssh'));
    final response = await _client.send(request);

    final sshJson = jsonDecode(await response.stream.bytesToString());
    return SSHData.fromJson(sshJson);
  }

  /// Get the installer state.
  Future<ApplicationStatus> status() async {
    final request = Request('GET', Uri.http('localhost', 'meta/status'));
    final response = await _client.send(request);

    final statusJson = jsonDecode(await response.stream.bytesToString());
    return ApplicationStatus.fromJson(statusJson);
  }

  /// Mark the controllers for endpoint_names as configured.
  Future<String> markConfigured(List<String> endpointNames) async {
    final request = Request(
        'POST',
        Uri.http('localhost', 'meta/mark_configured',
            {'endpoint_names': '$endpointNames'}));
    final response = await _client.send(request);
    return response.stream.bytesToString();
  }

  /// Confirm that the installation should proceed.
  Future<String> confirm(String tty) async {
    final request =
        Request('POST', Uri.http('localhost', 'meta/confirm', {'tty': tty}));
    final response = await _client.send(request);
    return response.stream.bytesToString();
  }

  // TODO: un-hardcode
  final releaseNotesURL = 'https://wiki.ubuntu.com/GroovyGorilla/ReleaseNotes';

  final Set<String> keyboardlangs = {};
  final List<Tuple2<String, String>> keyboardlayoutlist = [];
  final Map<String, List<Tuple2<String, String>>> keyboardvariantlist = {};

  Future<void> fetchKeyboardLayouts(String assetName, Locale locale) async {
    final langtag = locale.toLanguageTag().replaceAll('-', '_');
    print('fetching keyboard layouts for $langtag');
    final firstpass = keyboardlangs.isEmpty;
    var matchinglang = 'C';
    keyboardlayoutlist.clear();
    keyboardvariantlist.clear();
    // Copied from subiquity's KeyboardList class
    return rootBundle.loadStructuredData(assetName, (data) async {
      return LineSplitter.split(data);
    }).then((lines) {
      if (firstpass) {
        for (final line in lines) {
          keyboardlangs.add(line.split('*')[0]);
        }
      }
      if (keyboardlangs.contains(langtag)) {
        matchinglang = langtag;
      } else {
        final langonlytag = langtag.split('_')[0];
        if (keyboardlangs.contains(langonlytag)) {
          matchinglang = langonlytag;
        }
      }
      return lines;
    }).then((lines) {
      for (final line in lines) {
        final tokens = line.split('*');
        if (tokens[0] == matchinglang) {
          var element = tokens[1];
          var name = tokens[2];
          if (element == 'layout') {
            keyboardlayoutlist.add(Tuple2(name, tokens[3]));
          } else if (element == 'variant') {
            final value = Tuple2<String, String>(tokens[3], tokens[4]);
            if (keyboardvariantlist.containsKey(name)) {
              keyboardvariantlist[name].add(value);
            } else {
              keyboardvariantlist[name] = [value];
            }
          }
        }
      }
      keyboardlayoutlist.sort((a, b) =>
          removeDiacritics(a.item2).compareTo(removeDiacritics(b.item2)));
      for (final entry in keyboardvariantlist.entries) {
        entry.value.sort((a, b) =>
            removeDiacritics(a.item2).compareTo(removeDiacritics(b.item2)));
      }
    });
  }
}
