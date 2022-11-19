import 'package:dio/dio.dart';

class ErrorResponse extends Response {
  static const int NETWORK_ERROR_CODE = 0;

  ErrorResponse({
    dynamic data,
    int? code,
    String? message,
    String path = "",
  }) : super(
            data: data,
            statusCode: code,
            statusMessage: message,
            requestOptions: RequestOptions(path: path));
}
