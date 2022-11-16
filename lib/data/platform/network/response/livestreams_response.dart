import 'package:musium/data/platform/network/response/home_item_data_response.dart';
import 'package:musium/data/model/livestream.dart';

import '../../../../extension/collection_ext.dart';

class LivestreamsResponse extends HomeItemDataResponse {
  List<Livestream>? items;

  LivestreamsResponse({this.items});

  LivestreamsResponse.fromJson(Map<String, dynamic> json) {
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
