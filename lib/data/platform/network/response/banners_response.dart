import 'package:musium/data/model/models.dart';
import 'package:musium/data/platform/network/response/home_item_data_response.dart';

import '../../../../common/common.dart';

class BannersResponse extends HomeItemDataResponse {
  List<MusicBanner>? items;

  BannersResponse({this.items});

  BannersResponse.fromJson(Map<String, dynamic> json) {
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
