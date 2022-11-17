import 'package:musium/data/model/playlist/detail_playlist.dart';

class DetailPlaylistResponse {
  int? err;
  String? msg;
  DetailPlaylist? data;

  DetailPlaylistResponse({this.err, this.msg});

  DetailPlaylistResponse.fromJson(Map<String, dynamic> json) {
    err = json['err'];
    msg = json['msg'];
    data = DetailPlaylist.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['err'] = err;
    data['msg'] = msg;
    data["data"] = this.data?.toJson();
    return data;
  }
}
