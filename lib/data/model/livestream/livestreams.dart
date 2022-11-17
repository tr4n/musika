import 'package:musium/data/model/home_section_item.dart';
import 'package:musium/data/model/livestream/livestream.dart';

import '../../../extension/collection_ext.dart';

class Livestreams extends HomeSectionItem {
  List<Livestream>? items;

  Livestreams({this.items});

  Livestreams.fromJson(Map<String, dynamic> json) {
    sectionType = json['sectionType'];
    title = json['title'];
    items = cast<List<dynamic>>(json["items"])
        ?.map((e) => Livestream.fromJson(e))
        .toList();
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data["items"] = items?.map((e) => e.toJson()).toList();
    return data;
  }
}
