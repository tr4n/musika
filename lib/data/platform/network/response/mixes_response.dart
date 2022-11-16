import 'package:musium/data/model/mix.dart';

import '../../../../extension/collection_ext.dart';
import 'responses.dart';

class MixesResponse extends HomeItemDataResponse {
  List<Mix>? items;

  MixesResponse({this.items});

  MixesResponse.fromJson(Map<String, dynamic> json) {
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

