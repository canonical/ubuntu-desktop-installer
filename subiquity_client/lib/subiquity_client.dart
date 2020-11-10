library subiquity_client;

import 'package:http/http.dart';
import 'src/http_unix_client.dart';

class SubiquityClient {
  HttpUnixClient _client;

  SubiquityClient(String socket_path) {
    _client = HttpUnixClient(socket_path);
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
}
