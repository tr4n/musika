import 'package:musium/data/model/models.dart';
import 'package:musium/data/model/home_section_item.dart';

import '../../../common/common.dart';

class Banners extends HomeSectionItem {
  List<MusicBanner>? items;

  Banners({this.items});

  Banners.fromJson(Map<String, dynamic> json) {
    sectionType = json['sectionType'];
    title = json['title'];
    items = cast<List<dynamic>?>(json["items"])
        ?.map((e) => MusicBanner.fromJson(e))
        .toList();
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data["items"] = items?.map((e) => e.toJson()).toList();
    return data;
  }
}
