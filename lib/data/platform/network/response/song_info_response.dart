import 'package:musium/data/model/models.dart';
import 'package:musium/data/platform/network/response/base_response.dart';

class SongInfoResponse extends ZingResponse<Song> {
  SongInfoResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    data = json["data"] != null ? Song.fromJson(json["data"]) : null;
  }
}
