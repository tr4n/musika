import 'package:musium/data/platform/network/response/home_item_data_response.dart';
import 'package:musium/data/model/playlist.dart';

import '../../../../extension/collection_ext.dart';

class PlaylistsResponse extends HomeItemDataResponse {
  List<Playlist>? items;

  PlaylistsResponse({this.items});

  PlaylistsResponse.fromJson(Map<String, dynamic> json) {
    sectionType = json['sectionType'];
    title = json['title'];
    items = cast<List<dynamic>>(json["items"])
        ?.map((e) => Playlist.fromJson(e))
        .toList();
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data["items"] = items?.map((e) => e.toJson()).toList();
    return data;
  }
}
