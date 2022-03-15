import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:provider_base/api/api_exceptions.dart';
import 'package:provider_base/common/core/data/local_storage.dart';

class ApiClient {
  static String baseUrl = 'https://jsonplaceholder.typicode.com';
  static Future<String?> get accessToken async => LocalStorage.getAccessToken();
  static Map<String, String> get headers =>
      {'Authorization': 'Bearer $accessToken'};

  // String get header
  static Future<dynamic> getRequest(
    String endpoint, {
    bool isAuthorized = false,
    Map<String, dynamic>? params,
  }) {
    final uri = Uri.parse(baseUrl + endpoint);
    final result = http
        .get(
          uri,
          headers: isAuthorized ? headers : {},
        )
        .then(_handleResponse)
        .catchError(_handleError);

    return result;
  }

  static Future<dynamic> postRequest(
    String endpoint, {
    required Map<String, dynamic>? params,
    bool isAuthorized = false,
  }) async {
    Map<String, String>? headers;
    final uri = Uri.parse(baseUrl + endpoint);

    final result = http
        .post(uri,
            headers: isAuthorized ? headers : {}, body: json.encode(params))
        .then(_handleResponse)
        .catchError(_handleError);

    return result;
  }

  static Future<dynamic> putRequest(
    String endpoint, {
    required Map<String, dynamic>? params,
    bool isAuthorized = false,
  }) async {
    Map<String, String>? headers;
    final uri = Uri.parse(baseUrl + endpoint);

    final result = http
        .put(uri, headers: headers, body: json.encode(params))
        .then(_handleResponse)
        .catchError(_handleError);

    return result;
  }

  static Future<dynamic> deleteRequest(String endpoint) async {
    Map<String, String>? headers;
    final uri = Uri.parse(baseUrl + endpoint);

    final result = http
        .delete(
          uri,
          headers: headers,
        )
        .then(_handleResponse)
        .catchError(_handleError);

    return result;
  }

  static dynamic _handleError(onError) {
    print(onError);
    if (onError is TimeoutException) {
      print('timeout');
    } else if (onError is SocketException) {
      print('socket');
    }
  }

  static dynamic _handleResponse(http.Response response) {
    log(response.request.toString());
    final statusCode = response.statusCode;
    final url = response.request?.url.toString();

    switch (statusCode) {
      case 200:
        return json.decode(response.body);
      case 400:
        throw BadRequestException(response.body, url);
      case 401:
      case 403:
        throw UnAuthorizedException(response.body, url);
      case 500:
      default:
        throw OtherException('Error occured with code:  $statusCode', url);
    }
  }
}
