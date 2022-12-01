import 'dart:convert';

import 'package:crypto/crypto.dart';

class ZingApi {
  static const zingMp3Url = "https://zingmp3.vn";
  static const _secretKey = "2aa2d1c561e809b267f3638c4a307aab";
  static const _apiKey = "88265e23d4284f25963e6eedac8fbfa3";
  static const _version = "1.6.34";
  static final _ctime = DateTime.now().millisecondsSinceEpoch;

  static String _getHash256(String string) {
    return sha256.convert(utf8.encode(string)).toString();
  }

  static String _getHmac512(String string, String key) {
    final hmac = Hmac(sha512, utf8.encode(key));
    return hmac.convert(utf8.encode(string)).toString();
  }

  static String _getPathQueries(String endPoint, Map<String, dynamic> params) {
    final buffer = StringBuffer(zingMp3Url);
    params.addAll({
      "apiKey": _apiKey,
      "version": _version,
    });
    final queries = params.keys.map((key) => "$key=${params[key]}").join("&");
    buffer.write(endPoint);
    if (queries.isNotEmpty) {
      buffer.write("?$queries");
    }
    return buffer.toString();
  }

  static String _hashParams(String endPoint, Map<String, dynamic> params) {
    params.addAll({"version": _version});
    final string = params.keys.map((key) => "$key=${params[key]}").join("");
    final hash256 = _getHash256(string);
    return _getHmac512(endPoint + hash256, _secretKey);
  }

  static String _hashCategoryMV(
      String path, String id, String type, int _ctime) {
    return _getHmac512(
      path + _getHash256("_ctime=${_ctime}id=${id}type=${type}version=$_version"),
      _secretKey,
    );
  }

  static String apiHome() {
    String endPoint = "/api/v2/page/get/home";
    const count = 25;
    const page = 1;
    final sig =
        _hashParams(endPoint, {"count": count, "ctime": _ctime, "page": page});
    return _getPathQueries(endPoint, {
      "page": page,
      "segmentId": -1,
      "count": count,
      "ctime": _ctime,
      "sig": sig,
    });
  }

  static String apiDetailPlaylist(String encodeId) {
    String endPoint = "/api/v2/page/get/playlist";

    final sig = _hashParams(endPoint, {"ctime": _ctime, "id": encodeId});
    return _getPathQueries(
        endPoint, {"id": encodeId, "ctime": _ctime, "sig": sig});
  }

  static String apiSongInfo(String encodeId) {
    String endPoint = "/api/v2/song/get/info";

    final sig = _hashParams(endPoint, {"ctime": _ctime, "id": encodeId});
    return _getPathQueries(
        endPoint, {"id": encodeId, "ctime": _ctime, "sig": sig});
  }

  static String apiSongStream(String encodeId) {
    String endPoint = "/api/v2/song/get/streaming";
 
    final sig = _hashParams(endPoint, {"ctime": _ctime, "id": encodeId});
    return _getPathQueries(
        endPoint, {"id": encodeId, "ctime": _ctime, "sig": sig});
  }

  static String apiSongLyric(String encodeId) {
    String endPoint = "/api/v2/lyric/get/lyric";
    final _ctime = DateTime.now().millisecondsSinceEpoch;
    final sig = _hashParams(endPoint, {"ctime": _ctime, "id": encodeId});
    return _getPathQueries(
        endPoint, {"id": encodeId, "ctime": _ctime, "sig": sig});
  }

  static String apiSongRecommend(String encodeId) {
    String endPoint = "/api/v2/recommend/get/songs";
 
    final sig = _hashParams(endPoint, {"ctime": _ctime, "id": encodeId});
    return _getPathQueries(
        endPoint, {"id": encodeId, "ctime": _ctime, "sig": sig});
  }

  static String apiSectionPlaylist(String encodeId) {
    String endPoint = "/api/v2/playlist/get/section-bottom";
    final sig = _hashParams(endPoint, {"ctime": _ctime, "id": encodeId});
    return _getPathQueries(
        endPoint, {"id": encodeId, "ctime": _ctime, "sig": sig});
  }

  // Chart
  static String apiNewReleaseChart() {
    String endPoint = "/api/v2/page/get/newrelease-chart";
    final sig = _hashParams(endPoint, {"ctime": _ctime});
    return _getPathQueries(endPoint, {"ctime": _ctime, "sig": sig});
  }

  static String apiHomeChart() {
    String endPoint = "/api/v2/page/get/chart-home";

    final sig = _hashParams(endPoint, {"ctime": _ctime});
    return _getPathQueries(endPoint, {"ctime": _ctime, "sig": sig});
  }

  static String apiTop100() {
    String endPoint = "/api/v2/page/get/top-100";
    final sig = _hashParams(endPoint, {"ctime": _ctime});
    return _getPathQueries(endPoint, {"ctime": _ctime, "sig": sig});
  }

  // Artist
  static String apiDetailArtist(String alias) {
    String endPoint = "/api/v2/page/get/artist";
    final sig = _hashParams(endPoint, {"ctime": _ctime});
    return _getPathQueries(
        endPoint, {"alias": alias, "ctime": _ctime, "sig": sig});
  }

  static String apiArtistSongList(String artistId, int page, int count) {
    const type = "artist";

    String endPoint = "/api/v2/song/get/list";
    final sig = _hashParams(endPoint, {
      "count": count,
      "ctime": _ctime,
      "id": artistId,
      "page": page,
      "type": type,
    });
    return _getPathQueries(endPoint, {
      "id": artistId,
      "type": type,
      "page": page,
      "count": count,
      "sort": "new",
      "sectionId": "aSong",
      "sig": sig,
      "ctime": _ctime,
    });
  }
}
