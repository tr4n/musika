import 'package:musium/data/platform/network/api/api.dart';
import 'package:musium/data/platform/network/response/song_stream_response.dart';

import '../platform/network/response/responses.dart';

class ZingRepository {
  final AppApi _api;

  ZingRepository(this._api);

  Future<HomeResponse> getHomeData() async {
    return _api.getHomeData();
  }

  Future<DetailPlaylistResponse> getDetailPlaylist(String encodeId) async {
    return _api.getDetailPlaylist(encodeId);
  }

  Future<SongInfoResponse> getSongInfo(String encodeId) async {
    return _api.getSongInfo(encodeId);
  }

  Future<SongStreamResponse> getSongStream(String encodeId) async {
    return _api.getSongStream(encodeId);
  }

  Future<dynamic> getSongLyric(String encodeId) async {
    return _api.getSongLyric(encodeId);
  }

  Future<dynamic> getSectionPlaylist(String encodeId) async {
    return _api.getSectionPlaylist(encodeId);
  }

  Future<dynamic> getDetailArtist(String encodeId) async {
    return _api.getDetailArtist(encodeId);
  }

  Future<dynamic> getArtistSongList(
      String artistId, int page, int count) async {
    return _api.getArtistSongList(artistId, page, count);
  }
}
