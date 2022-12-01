import 'package:musium/data/model/artist/detail_artist.dart';
import 'package:musium/data/model/playlist/detail_playlist.dart';
import 'package:musium/data/platform/network/response/base_response.dart';


class DetailArtistResponse extends ZingResponse<DetailArtist>{

  DetailArtistResponse.fromJson(Map<String, dynamic> json): super.fromJson(json) {
    data = json["data"] != null ?  DetailArtist.fromJson(json["data"]): null;
  }
}
