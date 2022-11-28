import 'package:musium/data/model/models.dart';
import 'package:musium/data/platform/network/response/responses.dart';

import '../../../../common/common.dart';
import '../../../../common/type/types.dart';

class HomeResponse extends ZingResponse<HomeResponseData> {
  HomeResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    data =
        json["data"] != null ? HomeResponseData.fromJson(json["data"]) : null;
  }
}

class HomeResponseData implements ToJsonAble {
  bool? hasMore;
  int? total;
  List<HomeSectionItem>? items;

  HomeResponseData({this.items, this.hasMore, this.total});

  HomeResponseData.fromJson(Map<String, dynamic> json) {
    items = cast<List<dynamic>>(json["items"])?.map((itemJson) {
      final item = HomeSectionItem.fromJson(itemJson);
      print("section type: ${item.sectionType}");
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

  @override
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
