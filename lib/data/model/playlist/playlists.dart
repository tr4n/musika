import 'package:musium/data/model/home_section_item.dart';

import '../../../extension/collection_ext.dart';
import '../models.dart';

class Playlists extends HomeSectionItem {
  List<Playlist>? items;

  Playlists({this.items});

  Playlists.fromJson(Map<String, dynamic> json) {
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
