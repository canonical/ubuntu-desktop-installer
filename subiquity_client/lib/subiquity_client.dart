library subiquity_client;

import 'dart:ui';
import 'package:http/http.dart';
import 'package:subiquity_client/src/http_unix_client.dart';
import 'package:tuple/tuple.dart';

class SubiquityClient {
  HttpUnixClient _client;

  void open(String socket_path) {
    _client = HttpUnixClient(socket_path);
  }

  void close() {
    _client.close();
  }

  Future<String> status() async {
    var request = Request('GET', Uri.http('localhost', 'meta/status'));
    var response = await _client.send(request);
    return response.stream.bytesToString();
  }

  Future<String> keyboard() async {
    var request = Request('GET', Uri.http('localhost', 'keyboard'));
    var response = await _client.send(request);
    return response.stream.bytesToString();
  }

  Future<String> locale() async {
    var request = Request('GET', Uri.http('localhost', 'locale'));
    var response = await _client.send(request);
    return response.stream.bytesToString();
  }

  // TODO: parse languagelist instead of a hardcoded list
  final languagelist = [
    Tuple2<Locale, String>(Locale('en', 'US'), 'English'),
    Tuple2<Locale, String>(Locale('en', 'GB'), 'English (UK)'),
    Tuple2<Locale, String>(Locale('kab'), 'Tamaziɣt Taqbaylit'),
    Tuple2<Locale, String>(Locale('ca'), 'Català'),
    Tuple2<Locale, String>(
        Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'), '中文(简体)'),
    Tuple2<Locale, String>(Locale('hr'), 'Hrvatski'),
    Tuple2<Locale, String>(Locale('cs'), 'Čeština'),
    Tuple2<Locale, String>(Locale('ast'), 'Asturianu'),
    Tuple2<Locale, String>(Locale('be'), 'Беларуская'),
    Tuple2<Locale, String>(Locale('nl'), 'Nederlands'),
    Tuple2<Locale, String>(Locale('fi'), 'Suomi'),
    Tuple2<Locale, String>(Locale('fr'), 'Français'),
    Tuple2<Locale, String>(Locale('de'), 'Deutsch'),
    Tuple2<Locale, String>(Locale('el'), 'Ελληνικά'),
    Tuple2<Locale, String>(Locale('he'), 'עברית'),
    Tuple2<Locale, String>(Locale('hu'), 'Magyar'),
    Tuple2<Locale, String>(Locale('id'), 'Bahasa Indonesia'),
    Tuple2<Locale, String>(Locale('lv'), 'Latviski'),
    Tuple2<Locale, String>(Locale('lt'), 'Lietuviškai'),
    Tuple2<Locale, String>(Locale('pl'), 'Polski'),
    Tuple2<Locale, String>(Locale('ru'), 'Русский'),
    Tuple2<Locale, String>(Locale('sr'), 'Српски'),
    Tuple2<Locale, String>(Locale('es'), 'Español'),
    Tuple2<Locale, String>(Locale('sv'), 'Svenska'),
    Tuple2<Locale, String>(Locale('bo'), 'བོད་ཡིག'),
    Tuple2<Locale, String>(Locale('uk'), 'Українська'),
    Tuple2<Locale, String>(Locale('nb'), 'Norsk bokmål'),
    Tuple2<Locale, String>(Locale('oc'), 'Galés'),
  ];

  // TODO: un-hardcode
  final releaseNotesURL = 'https://wiki.ubuntu.com/GroovyGorilla/ReleaseNotes';
}
