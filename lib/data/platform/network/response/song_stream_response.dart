import 'package:musium/data/model/models.dart';
import 'package:musium/data/model/song/song_stream.dart';

import '../../../../common/common.dart';
import '../../../../common/type/types.dart';

class SongStreamResponse {
  int? err;
  String? msg;
  SongStream? data;

  SongStreamResponse({this.err, this.msg, this.data});

  SongStreamResponse.fromJson(Map<String, dynamic> json) {
    err = json['err'];
    msg = json['msg'];
    data = json['data'] != null ? SongStream.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['err'] = err;
    data['msg'] = msg;
    data['data'] = this.data?.toJson();
    return data;
  }
}
