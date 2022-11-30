import '../../../model/artist/artist_song_list.dart';
import 'base_response.dart';

class ArtistSongListResponse extends ZingResponse<ArtistSongList> {
  ArtistSongListResponse.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    data = json["data"] != null ? ArtistSongList.fromJson(json["data"]) : null;
  }
}
