import 'dart:convert';

import 'package:crypto/crypto.dart';

class ZingApi {
  static const zingMp3Url = "https://zingmp3.vn";
  static const _secretKey = "2aa2d1c561e809b267f3638c4a307aab";
  static const _apiKey = "88265e23d4284f25963e6eedac8fbfa3";
  static const _version = "1.6.34";

  static String _getHash256(String string) {
    return sha256.convert(utf8.encode(string)).toString();
  }

  static String _getHmac512(String string, String key) {
    final hmac = Hmac(sha512, utf8.encode(key));
    return hmac.convert(utf8.encode(string)).toString();
  }

  static String _hashParam(String path, String id, int ctime) {
    return _getHmac512(
      path + _getHash256("ctime=${ctime}id=${id}version=$_version"),
      _secretKey,
    );
  }

  static String _hashParamNoId(String path, int ctime) {
    return _getHmac512(
      path + _getHash256("ctime=${ctime}version=$_version"),
      _secretKey,
    );
  }

  static String _hashParamHome(String path, int ctime, int count) {
    return _getHmac512(
      path + _getHash256("count=${count}ctime=${ctime}page=1version=$_version"),
      _secretKey,
    );
  }

  static String _getApiHasId(String path, String id) {
    final ctime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final sig = _hashParam(path, id, ctime);
    return "$zingMp3Url$path?id=$id&ctime=$ctime&version=$_version&sig=$sig&apiKey=$_apiKey";
  }

  static String _getApiNoId(String path) {
    final ctime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final sig = _hashParamNoId(path, ctime);
    return "$zingMp3Url$path?ctime=$ctime&version=$_version&sig=$sig&apiKey=$_apiKey";
  }

  static String apiHome() {
    String path = "/api/v2/page/get/home";
    final ctime = DateTime.now().millisecondsSinceEpoch;
    final count = 10;
    final sig = _hashParamHome(path, ctime, count);
    return "$zingMp3Url$path?page=1&segmentId=-1&count=$count&ctime=$ctime&version=$_version&sig=$sig&apiKey=$_apiKey";
  }

  static String apiDetailPlaylist(String encodeId) {
    String path = "/api/v2/page/get/playlist";
    return _getApiHasId(path, encodeId);
  }
}
