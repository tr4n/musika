import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import '../data/platform/network/response/responses.dart';

abstract class BaseBloc {
  final _error = PublishSubject<ErrorResponse>();
  final loading = PublishSubject<bool>();

  Stream<ErrorResponse> get errorObservable => _error.stream;

  void addError(ErrorResponse err) {
    _error.sink.add(err);
  }

  void runCatching(Function() callback) {
    try {
      callback();
    } catch (e) {
      addError(handelError(e));
    }
  }

  @protected
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
}
