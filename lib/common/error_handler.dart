import 'dart:io';

import 'package:dio/dio.dart';

import '../data/platform/network/response/error_response.dart';

ErrorResponse handelError(dynamic error) {
  try {
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.cancel:
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.other:
          if (error.error is SocketException) {
            return ErrorResponse(
              data: error.error,
              message: error.message,
              code: ErrorResponse.NETWORK_ERROR_CODE,
              path: "",
            );
          }
          return ErrorResponse(
            data: error.error,
            message: error.message,
            path: "",
          );
        case DioErrorType.response:
          return ErrorResponse(
            data: error.response!.data,
            message: error.response!.statusMessage,
            code: error.response!.statusCode,
            path: "",
          );
        default:
          return ErrorResponse(
            data: error.error,
            message: error.message,
            path: "",
          );
      }
    }
  } catch (ex) {
    return ErrorResponse(data: ex.toString(), path: "");
  }
  return ErrorResponse(data: error.toString(), path: "");
}
