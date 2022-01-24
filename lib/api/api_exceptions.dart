class ApiException implements Exception {
  final String? message;
  final String? prefix;
  final String? url;

  ApiException([
    this.message,
    this.prefix,
    this.url,
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

class ApiNotResponseException extends ApiException {
  ApiNotResponseException([String? message, String? url])
      : super(message, 'Api dose not respose in time', url);
}

class UnAuthorizedException extends ApiException {
  UnAuthorizedException([String? message, String? url])
      : super(message, 'UnAuthorized request', url);
}
