import 'package:musium/data/platform/network/response/base_response.dart';

import '../../../extension/collection_ext.dart';
import '../album/album.dart';
import '../artist/artist.dart';

class SongStream implements ToJsonAble {
  String? s128;
  String? s320;

  SongStream({this.s128, this.s320});

  SongStream.fromJson(Map<String, dynamic> json) {
    s128 = json['128'];
    s320 = json['320'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['128'] = s128;
    data['320'] = s320;
    return data;
  }
}
