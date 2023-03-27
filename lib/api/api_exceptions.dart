class ApiException implements Exception {
  final String? message;
  final String? prefix;
  final String? url;
  final int? code;

  ApiException([
    this.message,
    this.prefix,
    this.url,
    this.code,
  ]);
}

class BadRequestException extends ApiException {
  BadRequestException([String? message, String? url])
      : super(message, 'Bad request', url);
}

class OtherException extends ApiException {
  OtherException([String? message, String? url])
      : super(message, 'Unable to process', url);
}

class CustomeApiException extends ApiException {
  CustomeApiException([
    int? code,
    String? message,
    String? url,
    this.data,
  ]) : super(message, 'Something is wrong!', url, code);
  dynamic data;
}

class UnAuthorizedException extends ApiException {
  UnAuthorizedException([String? message, String? url])
      : super(message, 'UnAuthorized request', url);
}

extension ValidateError on CustomeApiException {
  static const validateKeys = ['login_id', 'login_pw'];

  String validateErrorMsg() {
    final result = Map<String, dynamic>.from(data);

    for (var key in validateKeys) {
      if (result.containsKey(key)) {
        final error = List<String>.from(result[key]).first;

        return error.toString();
      }
    }
    return 'Input is invalid!';
  }
}
