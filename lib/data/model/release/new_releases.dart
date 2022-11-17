import 'package:musium/data/model/home_section_item.dart';

import '../../../extension/collection_ext.dart';
import '../models.dart';

class NewReleases extends HomeSectionItem {
  NewReleasesData? items;

  NewReleases({this.items});

  NewReleases.fromJson(Map<String, dynamic> json) {
    sectionType = json['sectionType'];
    title = json['title'];
    items = NewReleasesData.fromJson(json["items"]);
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data["items"] = items?.toJson();
    return data;
  }
}

class NewReleasesData {
  NewReleasesData({
    this.vPop,
    this.others,
  });

  List<NewRelease>? all;
  List<NewRelease>? vPop;
  List<NewRelease>? others;

  NewReleasesData.fromJson(Map<String, dynamic> json) {
    all = cast<List<dynamic>>(json["all"])
        ?.map((e) => NewRelease.fromJson(e))
        .toList();
    vPop = cast<List<dynamic>>(json["vPop"])
        ?.map((e) => NewRelease.fromJson(e))
        .toList();
    others = cast<List<dynamic>>(json["others"])
        ?.map((e) => NewRelease.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["all"] = vPop?.map((e) => e.toJson()).toList();
    data["vPop"] = vPop?.map((e) => e.toJson()).toList();
    data["others"] = others?.map((e) => e.toJson()).toList();
    return data;
  }
}
