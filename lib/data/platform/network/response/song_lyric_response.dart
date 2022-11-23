import 'package:http/http.dart';
import 'package:musium/data/model/models.dart';

import '../../../../common/common.dart';
import '../../../../common/type/types.dart';

class HomeResponse extends BaseResponse<>{
  int? err;
  String? msg;
  HomeResponseData? data;

  HomeResponse({this.err, this.msg});

  HomeResponse.fromJson(Map<String, dynamic> json) {
    err = json['err'];
    msg = json['msg'];
    data = HomeResponseData.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['err'] = err;
    data['msg'] = msg;
    data["data"] = this.data?.toJson();
    return data;
  }
}

class HomeResponseData {
  bool? hasMore;
  int? total;
  List<HomeSectionItem>? items;

  HomeResponseData({this.items, this.hasMore, this.total});

  HomeResponseData.fromJson(Map<String, dynamic> json) {
    items = cast<List<dynamic>>(json["items"])?.map((itemJson) {
      final item = HomeSectionItem.fromJson(itemJson);
      if (item.sectionType == SectionType.newRelease.value) {
        return NewReleases.fromJson(itemJson);
      }
      if (item.sectionType == SectionType.playlist.value) {
        return Playlists.fromJson(itemJson);
      }
      if (item.sectionType == SectionType.mix.value) {
        return Mixes.fromJson(itemJson);
      }
      if (item.sectionType == SectionType.artistSpotlight.value) {
        return ArtistSpotlights.fromJson(itemJson);
      }
      if (item.sectionType == SectionType.banner.value) {
        return Banners.fromJson(itemJson);
      }
      if (item.sectionType == SectionType.livestream.value) {
        return Livestreams.fromJson(itemJson);
      }
      return item;
    }).toList();
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
