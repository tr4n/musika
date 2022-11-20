import 'package:musium/data/platform/network/api/api.dart';

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
}
