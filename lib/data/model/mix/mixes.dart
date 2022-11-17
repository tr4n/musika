import '../../../extension/collection_ext.dart';
import '../home_section_item.dart';
import '../models.dart';

class Mixes extends HomeSectionItem {
  List<Mix>? items;

  Mixes({this.items});

  Mixes.fromJson(Map<String, dynamic> json) {
    sectionType = json['sectionType'];
    title = json['title'];
    items = cast<List<dynamic>>(json["items"])
        ?.map((e) => Mix.fromJson(e))
        .toList();
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data["items"] = items?.map((e) => e.toJson()).toList();
    return data;
  }
}
