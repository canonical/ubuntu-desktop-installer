import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:http/http.dart';

enum _HttpParserState {
  status,
  header,
  content,
  chunkHeader,
  chunk,
  chunkTrailer
}

class _HttpRequest {
  String httpVersion = '';
  int statusCode = 0;
  String reasonPhrase = '';
  Map<String, String> headers = {};

  BaseRequest request;
  Completer<StreamedResponse> completer = Completer<StreamedResponse>();
  StreamController<List<int>> stream = StreamController<List<int>>();

  _HttpRequest(this.request);

  int get contentLength => int.tryParse(headers['Content-Length']);
}

class HttpUnixClient extends BaseClient {
  /// Unix socket path.
  final String path;

  // Unix socket connected to.
  Socket _socket;

  // Requests in process.
  final _requests = <_HttpRequest>[];

  // Data read from the socket.
  final _buffer = <int>[];

  var _parserState = _HttpParserState.status;
  var _chunkLength = -1;
  var _chunkRead = -1;

  /// Creates a new HTTP client that communicates on a Unix domain socket on [path].
  HttpUnixClient(this.path);

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    final address = InternetAddress(path, type: InternetAddressType.unix);
    _socket = await Socket.connect(address, 0);
    _socket.listen(_processData);

    var message = '';
    var url = request.url;
    message +=
        '${request.method} ${url.path}${url.hasQuery ? '?' : ''}${url.query} HTTP/1.1\r\n';
    message += 'Host:\r\n';
    if (request.contentLength != null) {
      message += 'Content-Length: ${request.contentLength}\r\n';
    }
    request.headers.forEach((name, value) {
      message += '$name: $value\r\n';
    });
    message += '\r\n';
    _socket.write(message);

    if (request is Request) {
      _socket.write(request.body);
    } else if (request is MultipartRequest) {
      // TODO FIXME(robert-ancell): Needs to be implemented.
      assert(false);
    } else if (request is StreamedRequest) {
      // TODO FIXME(robert-ancell): Needs to be implemented.
      assert(false);
    }

    var req = _HttpRequest(request);
    _requests.add(req);
    return req.completer.future;
  }

  @override
  void close() {
    _socket.close();
  }

  void _processData(Uint8List data) {
    _buffer.addAll(data);

    var done = false;
    while (!done) {
      if (_requests.isEmpty) {
        return;
      }
      var request = _requests[0];

      if (_parserState == _HttpParserState.status) {
        done = _processStatus(request);
      } else if (_parserState == _HttpParserState.header) {
        done = _processHeader(request);
      } else if (_parserState == _HttpParserState.content) {
        done = _processContent(request);
      } else if (_parserState == _HttpParserState.chunkHeader) {
        done = _processChunkHeader(request);
      } else if (_parserState == _HttpParserState.chunk) {
        done = _processChunk(request);
      } else if (_parserState == _HttpParserState.chunkTrailer) {
        done = _processChunkTrailer(request);
      } else {
        done = true;
      }
    }
  }

  bool _processStatus(_HttpRequest request) {
    var line = _readLine();
    if (line == null) {
      return true;
    }

    // FIXME(robert-ancell): Validate
    var tokens = line.split(' ');
    request.httpVersion = tokens[0];
    request.statusCode = int.parse(tokens[1]);
    request.reasonPhrase = tokens[2];

    _parserState = _HttpParserState.header;
    return false;
  }

  bool _processHeader(_HttpRequest request) {
    var line = _readLine();
    if (line == null) {
      return true;
    }

    if (line == '') {
      var response = StreamedResponse(request.stream.stream, request.statusCode,
          contentLength: request.contentLength,
          request: request.request,
          headers: request.headers,
          reasonPhrase: request.reasonPhrase);
      request.completer.complete(response);
      var transferEncoding = request.headers['Transfer-Encoding'];
      if (transferEncoding == 'chunked') {
        _parserState = _HttpParserState.chunkHeader;
      } else {
        _chunkLength = request.contentLength;
        _chunkRead = 0;
        _parserState = _HttpParserState.content;
      }
    } else {
      // FIXME(robert-ancell): Validate
      var index = line.indexOf(':');
      var name = line.substring(0, index);
      var value = line.substring(index + 1).trim();
      request.headers[name] = value;
    }

    return false;
  }

  bool _processContent(_HttpRequest request) {
    int length;
    if (_chunkLength == null) {
      length = _buffer.length;
    } else {
      length = min(_chunkLength - _chunkRead, _buffer.length);
      _chunkRead += length;
    }

    var chunk = _buffer.sublist(0, length);
    request.stream.add(chunk);
    _buffer.removeRange(0, length);

    // FIXME(robert-ancell): Close stream if no content length when get EOF
    if (_chunkRead == _chunkLength) {
      request.stream.close();
      _requests.remove(request);
      _parserState = _HttpParserState.status;
    }

    return false;
  }

  bool _processChunkHeader(_HttpRequest request) {
    var line = _readLine();
    if (line == null) {
      return true;
    }

    // FIXME(robert-ancell): Validate
    _chunkLength = int.parse(line, radix: 16);
    _chunkRead = 0;
    _parserState = _HttpParserState.chunk;

    return false;
  }

  bool _processChunk(_HttpRequest request) {
    var length = min(_chunkLength - _chunkRead, _buffer.length);
    var chunk = _buffer.sublist(0, length);
    request.stream.add(chunk);
    _buffer.removeRange(0, length);
    _chunkRead += length;

    if (_chunkRead == _chunkLength) {
      _parserState = _HttpParserState.chunkTrailer;
    }

    return false;
  }

  bool _processChunkTrailer(_HttpRequest request) {
    if (_buffer.length < 2) {
      return true;
    }

    // FIXME(robert-ancell): Validate is '\r\n'
    _buffer.removeRange(0, 2);

    if (_chunkLength == 0) {
      request.stream.close();
      _requests.remove(request);
      _parserState = _HttpParserState.status;
    } else {
      _parserState = _HttpParserState.chunkHeader;
    }

    return false;
  }

  String _readLine() {
    for (var i = 0; i < _buffer.length - 1; i++) {
      if (_buffer[i] == 13 && _buffer[i + 1] == 10) {
        var line = utf8.decode(_buffer.sublist(0, i));
        _buffer.removeRange(0, i + 2);
        return line;
      }
    }
    return null;
  }
}
