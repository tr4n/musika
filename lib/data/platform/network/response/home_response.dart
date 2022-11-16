import 'package:musium/data/platform/network/response/artist_spotlights_response.dart';
import 'package:musium/data/platform/network/response/banners_response.dart';
import 'package:musium/data/platform/network/response/home_item_data_response.dart';
import 'package:musium/data/platform/network/response/livestreams_response.dart';
import 'package:musium/data/platform/network/response/mixes_response.dart';
import 'package:musium/data/platform/network/response/new_releases_response.dart';
import 'package:musium/data/platform/network/response/playlists_response.dart';

import '../../../../common/common.dart';
import '../../../../common/type/types.dart';

class HomeResponse {
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
  List<HomeItemDataResponse>? items;

  HomeResponseData({this.items, this.hasMore, this.total});

  HomeResponseData.fromJson(Map<String, dynamic> json) {
    this.items = cast<List<dynamic>>(json["items"])?.map((itemJson) {
      final item = HomeItemDataResponse.fromJson(itemJson);
      if (item.sectionType == SectionType.newRelease.value) {
        return NewReleasesResponse.fromJson(itemJson);
      }
      if (item.sectionType == SectionType.playlist.value) {
        return PlaylistsResponse.fromJson(itemJson);
      }
      if (item.sectionType == SectionType.mix.value) {
        return MixesResponse.fromJson(itemJson);
      }
      if (item.sectionType == SectionType.artistSpotlight.value) {
        return ArtistSpotlightsResponse.fromJson(itemJson);
      }
      if (item.sectionType == SectionType.banner.value) {
        return BannersResponse.fromJson(itemJson);
      }
      if (item.sectionType == SectionType.livestream.value) {
        return LivestreamsResponse.fromJson(itemJson);
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
