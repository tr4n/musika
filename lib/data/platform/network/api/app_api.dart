import 'dart:io';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:musium/data/platform/network/api/zing_api.dart';
import 'package:musium/data/platform/network/response/detail_playlist_response.dart';
import 'package:musium/data/platform/network/response/home_response.dart';

import '../response/error_response.dart';

class ZingMp3Api {
  final int _timeOut = 1000000; //10s
  late Dio _dio;
  String? cookie;

  ZingMp3Api() {
    BaseOptions options =
        BaseOptions(connectTimeout: _timeOut, receiveTimeout: _timeOut);
    Map<String, dynamic> headers = {
      'content-type': 'text/html;UTF-8;charset=utf-8'
    };
    options.headers = headers;
    _dio = Dio(options)
      ..interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }

  Future<String?> _getCookie(String url) async {
    try {
      if (cookie == null) {
        final response = await _dio.get(url);
        final newCookie = response.headers[HttpHeaders.setCookieHeader];
        cookie = newCookie?.firstOrNull;
      }
      return cookie;
    } catch (e) {
      return null;
    }
  }

  Future<Response<T>> _get<T>(String url,
      {Map<String, dynamic> params = const {}}) async {
    final cookie = await _getCookie(url);
    final options = Options(headers: {
      "Cookie": cookie ?? "",
    }, responseType: ResponseType.json);
    return await _dio.get(
      url,
      queryParameters: params,
      options: options,
    );
  }

  Future<Response?> post(
      {required String url, Map<String, dynamic> body = const {}}) async {
    try {
      Response response = await _dio.post(
        url,
        data: body,
        options: Options(responseType: ResponseType.json),
      );
      return response;
    } on DioError catch (e) {
      //handle error
      print("DioError: ${e.toString()}");
      throw _handelError(e, url);
    }
  }

  Future<HomeResponse> getHomeData() async {
    final url = ZingApi.apiHome();
    final response = await _get(url);
    final homeResponse = HomeResponse.fromJson(response.data);
    return homeResponse;
  }

  Future<DetailPlaylistResponse> getDetailPlaylist(String encodeId) async {
    final url = ZingApi.apiDetailPlaylist(encodeId);
    final response = await _get(url);
    return DetailPlaylistResponse.fromJson(response.data);
  }

  Response _handelError(dynamic error, String url) {
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
                path: url,
              );
            }
            return ErrorResponse(
              data: error.error,
              message: error.message,
              path: url,
            );
          case DioErrorType.response:
            return ErrorResponse(
              data: error.response!.data,
              message: error.response!.statusMessage,
              code: error.response!.statusCode,
              path: url,
            );
          default:
            return ErrorResponse(
              data: error.error,
              message: error.message,
              path: url,
            );
        }
      }
    } catch (ex) {
      return ErrorResponse(data: ex.toString(), path: url);
    }
    return ErrorResponse(data: error.toString(), path: url);
  }
}
