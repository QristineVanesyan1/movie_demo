import 'dart:convert';
import 'dart:io';

import 'package:move_demo/widgets/auth/auth_model.dart';

class ApiClient {
  final _client = HttpClient();
  static const _host = 'https://developers.themoviedb.org/3/';
  static const _imageUrl = 'https://images.tmdb.org/t/p/w500';
  static const _apiKey = '0a2a46b5593a0978cc8e87ba34037430';
  Uri _makeUri(String path, [Map<String, dynamic>? parameters]) {
    final url = Uri.parse("$_host$path");
    if (parameters != null) {
      return url.replace(queryParameters: parameters);
    }
    return url;
  }

  Future<T> _get<T>(String path, T Function(dynamic json) parser,
      [Map<String, dynamic>? parameters]) async {
    final url = _makeUri(path, parameters);
    _client.connectionTimeout = Duration.zero; //TODO

    try {
      final request = await _client.getUrl(url);
      final response = await request.close();
      final dynamic json = await response.jsonDecode();
      _validateResponse(response, json);

      final result = parser.call(json);
      return result;
    } on SocketException {
      throw const ApiClientException(
          exceptionType: ApiClientExceptionType.network);
    } on ApiClientException {
      rethrow;
    } catch (_) {
      throw const ApiClientException(
          exceptionType: ApiClientExceptionType.other);
    }
  }

  Future<T> _post<T>(String path, T Function(dynamic json) parser,
      [Map<String, dynamic>? urlParameters,
      Map<String, dynamic>? bodyParameters]) async {
    final url = _makeUri(path, urlParameters);

    try {
      final request = await _client.postUrl(url);
      request.headers.contentType = ContentType.json;
      request.write(jsonEncode(bodyParameters));
      final response = await request.close();
      final dynamic json = await response.jsonDecode();

      _validateResponse(response, json);
      final result = parser.call(json);
      return result;
    } on SocketException {
      throw const ApiClientException(
          exceptionType: ApiClientExceptionType.network);
    } on ApiClientException {
      rethrow;
    } catch (_) {
      throw const ApiClientException(
          exceptionType: ApiClientExceptionType.other);
    }
  }

  Future<String> _makeToken() async {
    parser(dynamic json1) {
      final json = json1 as Map<String, dynamic>;
      final token = json['request_token'] as String;

      return token;
    }

    final result = _get('authentication/token/new', parser,
        <String, String>{'api_key': _apiKey});

    return result;
  }

  Future<String> _validateUser(
      {required String username,
      required String password,
      required String requestToken}) async {
    parser(dynamic json1) {
      final json = json1 as Map<String, dynamic>;
      final token = json['request_token'] as String;

      return token;
    }

    final res = _post(
        'authentication/token/validate_with_login', parser, <String, dynamic>{
      'username': username,
      'password': password,
      'requestToken': requestToken,
    });
    return res;
  }

  Future<String> _makeSession({required String requestToken}) async {
    parser(dynamic json1) {
      final json = json1 as Map<String, dynamic>;
      final token = json['session_id'] as String;

      return token;
    }

    final res = _post('authentication/session/new', parser, <String, dynamic>{
      'requestToken': requestToken,
    });
    return res;
  }

  void _validateResponse(HttpClientResponse response, dynamic json) {
    if (response.statusCode == 401) {
      final dynamic status = json['status_code'];
      final code = status is int ? status : 0;
      if (code == 30) {
        throw const ApiClientException(
            exceptionType: ApiClientExceptionType.auth);
      } else {
        throw const ApiClientException(
            exceptionType: ApiClientExceptionType.other);
      }
    }
  }

  Future<String> auth(String username, String password) async {
    final token = await _makeToken();
    final validToken = await _validateUser(
        username: username, password: password, requestToken: token);
    final sessionId = _makeSession(requestToken: validToken);
    return sessionId;
  }
}

extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<dynamic> jsonDecode() async {
    return await transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then<dynamic>((v) => json.decode(v));
  }
}
