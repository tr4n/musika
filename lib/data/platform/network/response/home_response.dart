import 'package:musium/data/platform/network/response/home_item_response.dart';

class HomeResponse {
  List<HomeItemResponse>? items;
  bool? hasMore;
  int? total;

  HomeResponse({this.items, this.hasMore, this.total});

  HomeResponse.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <HomeItemResponse>[];
      json['items'].forEach((v) {
        items?.add(HomeItemResponse.fromJson(v));
      });
    }
    hasMore = json['hasMore'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items?.map((v) => v.toJson()).toList();
    }
    data['hasMore'] = hasMore;
    data['total'] = total;
    return data;
  }
}
