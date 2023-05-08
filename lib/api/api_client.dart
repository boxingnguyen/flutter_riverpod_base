import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:provider_base/api/api_response.dart';
import 'package:provider_base/common/core/app_style.dart';
import 'package:provider_base/common/core/data/dummy_data.dart';
import 'package:provider_base/common/core/logger.dart';
import 'package:provider_base/env/env_state.dart';

import '../common/core/data/local_storage.dart';
import '../common/core/data/secure_storage.dart';
import '../common/core/routes.dart';
import '../utils/utils.dart';
import 'api_endpoints.dart';
import 'api_exceptions.dart';

class ApiClient extends StateNotifier<EnvState> with Utils {
  ApiClient(super.state, this.ref);
  Ref ref;

  static Future<Map<String, String>> getHeaders({
    bool isAuthorized = false,
    bool isFormData = false,
    String? inputLang,
  }) async {
    final accessToken = await SecureStorage.getToken();
    var contentType = 'application/json';

    if (isFormData) {
      contentType = 'multipart/form-data';
    }

    // header for authorization
    final headersAuth = {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': contentType,
    };

    // header for non authorization
    final headers = {
      'Content-Type': 'application/json',
    };

    return isAuthorized ? headersAuth : headers;
  }

  // String get header
  Future<dynamic> getRequest(
    String endpoint, {
    bool isAuthorized = false,
    Map<String, dynamic>? params,
    Map<String, String>? addHeaders,
    bool enableLoading = true,
  }) async {
    showLoading(ref, enableLoading);

    final headers = await getHeaders(
      isAuthorized: isAuthorized,
    );
    final uri = Uri.parse(state.baseUrlApi + endpoint);

    if (addHeaders != null) {
      headers.addAll(addHeaders);
    }

    _logRequest(
      headers: headers,
      type: 'GET',
      url: uri,
      params: params,
    );

    final result = http
        .get(
          uri,
          headers: headers,
        )
        .then(_handleResponse)
        .catchError(_handleError)
        .whenComplete(() => hideLoading(ref, enableLoading));

    return result;
  }

  Future<dynamic> postRequest(
    String endpoint, {
    required Map<String, dynamic>? params,
    bool isAuthorized = false,
    bool enableLoading = true,
    dynamic paramsRe,
  }) async {
    showLoading(ref, enableLoading);

    final headers = await getHeaders(
      isAuthorized: isAuthorized,
    );

    final uri = Uri.parse(state.baseUrlApi + endpoint);

    _logRequest(
      headers: headers,
      type: 'POST',
      url: uri,
      params: params,
    );

    final result = http
        .post(
          uri,
          headers: headers,
          body: paramsRe ?? json.encode(params),
        )
        .then(_handleResponse)
        .catchError(_handleError)
        .whenComplete(() => hideLoading(ref, enableLoading));
    return result;
  }

  Future<dynamic> postDummyDataRequest() async {
    final result = DummyData.handleCheckExpired()
        .then(_handleResponse)
        .catchError(_handleError);

    return result;
  }

  Future<dynamic> postFileRequest(
    String endpoint, {
    required Map<String, dynamic>? params,
    bool isAuthorized = false,
    bool isLoading = true,
    bool enableLoading = false,
    required List<String> paths,
    required String key,
  }) async {
    final headers = await getHeaders(
      isAuthorized: isAuthorized,
      isFormData: true,
    );

    final uri = Uri.parse(state.baseUrlApi + endpoint);

    _logRequest(
      headers: headers,
      type: 'POST',
      url: uri,
      params: params,
    );

    final request = http.MultipartRequest('POST', uri)..headers.addAll(headers);

    for (final path in paths) {
      final contentType =
          isImage(path) ? MediaType('image', mimeType(path)) : null;

      request.files.add(await http.MultipartFile.fromPath(
        key,
        path,
        contentType: contentType,
      ));
    }

    if (params != null) {
      params.forEach((key, value) {
        request.fields[key] = value.toString();
      });
    }
    request
        .send()
        .then((value) => _handleResponse(null, value))
        .catchError(_handleError)
        .whenComplete(() => hideLoading(ref, enableLoading));
  }

  Future<dynamic> putRequest(
    String endpoint, {
    required Map<String, dynamic>? params,
    bool isAuthorized = false,
    bool enableLoading = true,
  }) async {
    showLoading(ref, enableLoading);

    final headers = await getHeaders(
      isAuthorized: isAuthorized,
    );
    final uri = Uri.parse(state.baseUrlApi + endpoint);

    final result = http
        .put(
          uri,
          headers: headers,
          body: json.encode(params),
        )
        .then(_handleResponse)
        .catchError(_handleError)
        .whenComplete(() => hideLoading(ref, enableLoading));

    return result;
  }

  Future<dynamic> deleteRequest(String endpoint,
      {bool enableLoading = true}) async {
    showLoading(ref, enableLoading);
    final headers = await getHeaders();
    final uri = Uri.parse(state.baseUrlApi + endpoint);

    final result = http
        .delete(
          uri,
          headers: headers,
        )
        .then(_handleResponse)
        .catchError(_handleError)
        .whenComplete(() => hideLoading(ref, enableLoading));

    return result;
  }

  Future<String> reGetAccessToken({required String username}) async {
    String refreshToken = await SecureStorage.getToken(isAccessToken: false);
    log('f5 token: $refreshToken');
    final params = {'userName': username, "refreshToken": refreshToken};

    final res = await postRequest(
      ApiEndpoints.refreshToken,
      params: params,
    );
    final accessToken = (res['accessToken'] ?? '').toString();
    SecureStorage.saveToken(accessToken);

    return accessToken;
  }

  dynamic _handleResponse(http.Response? httpResponse,
      [http.StreamedResponse? streamResponse]) async {
    final response = httpResponse ?? streamResponse;
    final statusCode = response?.statusCode;
    final url = response?.request?.url.toString();
    var body = '';

    if (response is http.Response) {
      body = response.body;
    } else if (response is http.StreamedResponse) {
      body = await response.stream.bytesToString();
    }

    logger.v(
      json.decode(body),
      'Response │ Status: $statusCode\n$url',
    );

    switch (statusCode) {
      case 200:
        final resBody = json.decode(body);
        ApiResponse response;

        try {
          response = ApiResponse.fromJson(resBody);
        } catch (e) {
          throw OtherException(
              'Api Response has wrong format with code:  $statusCode', url);
        }

        if (!response.success || response.data == null) {
          throw CustomeApiException(
            response.code,
            response.message,
            url,
            response.data,
          );
        }

        return response;
      case 400:
        throw BadRequestException(body, url);
      case 401:
      case 403:
        throw UnAuthorizedException(body, url);
      case 500:
      default:
        throw OtherException('Error occured with code:  $statusCode', url);
    }
  }

  dynamic _handleError(onError) {
    final context = Utils.navigatorState?.context;
    var errMsg = 'Server is not available, please try later!';

    displaySnackbar([String? exceptionMsg]) {
      if (context == null) {
        return;
      }

      snackBar(
        context,
        exceptionMsg ?? errMsg,
        AppStyles.errorColor,
      );
    }

    if (onError is TimeoutException) {
      // Retry or something
      errMsg = 'Server took too long to response, please try again!';
      log('Timeout error: ${onError.message}');
    } else if (onError is SocketException) {
      // loss internet connection
      errMsg = 'Loss connection, check your internet please!';
      log('Socket error: Please check your internet connection and try again!');
    } else if (onError is OtherException) {
      // Server die, error code 500
      log('Unhandled error: ${onError.message}');
    } else if (onError is CustomeApiException) {
      log('err message: ${onError.message}');
      log('err data: ${onError.data}');

      switch (onError.code) {
        // For example: Register error due to login id has already been taken
        case 422:
          String errFromJson = onError.getErrorFromJson();
          displaySnackbar(errFromJson);
          break;

        // Unauthorized
        case 401:
          displaySnackbar(onError.message);
          handleUnauthorizedError();
          break;

        default:
          displaySnackbar(onError.message);
          break;
      }
      return onError.data;
    }

    displaySnackbar();
  }

  static void handleUnauthorizedError() async {
    await LocalStorage.clearSession();
    Utils.navigatorState
        ?.pushNamedAndRemoveUntil(Routes.loginScreen, (route) => false);
  }

  static void _logRequest({
    required dynamic url,
    required dynamic headers,
    required dynamic params,
    required dynamic type,
  }) {
    logger
      ..i(
        url,
        'Request │ $type',
      )
      ..i(headers, 'Headers')
      ..i(params, 'Request Parameters');
  }
}
