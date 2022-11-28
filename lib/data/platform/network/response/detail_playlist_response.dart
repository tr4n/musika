import 'package:musium/data/model/playlist/detail_playlist.dart';
import 'package:musium/data/platform/network/response/base_response.dart';


class DetailPlaylistResponse extends ZingResponse<DetailPlaylist>{

  DetailPlaylistResponse.fromJson(Map<String, dynamic> json): super.fromJson(json) {
    data = json["data"] != null ?  DetailPlaylist.fromJson(json["data"]): null;
  }
}
