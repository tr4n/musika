import 'package:musium/data/model/models.dart';

class SongInfoResponse {
  int? err;
  String? msg;
  Song? data;

  SongInfoResponse({this.err, this.msg});

  SongInfoResponse.fromJson(Map<String, dynamic> json) {
    err = json['err'];
    msg = json['msg'];
    data = json["data"] != null ? Song.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['err'] = err;
    data['msg'] = msg;
    data["data"] = this.data?.toJson();
    return data;
  }
}
