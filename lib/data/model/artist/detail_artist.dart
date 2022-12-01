import 'package:musium/data/model/album/album.dart';
import 'package:musium/data/platform/network/response/base_response.dart';

import '../../../extension/collection_ext.dart';
import '../section/sections.dart';

class DetailArtist implements ToJsonAble {
  String? id;
  String? name;
  String? link;
  bool? spotlight;
  String? alias;
  String? playlistId;
  String? cover;
  String? thumbnail;
  String? biography;
  String? sortBiography;
  String? thumbnailM;
  String? national;
  String? birthday;
  String? realname;
  int? totalFollow;
  int? follow;
  Album? topAlbum;
  String? oalink;
  int? oaid;
  List<Sections>? sections;
  String? sectionId;
  bool? isOABrand;
  dynamic tabs;
  bool? hasOA;

  DetailArtist(
      {this.id,
      this.name,
      this.link,
      this.spotlight,
      this.alias,
      this.playlistId,
      this.cover,
      this.thumbnail,
      this.biography,
      this.sortBiography,
      this.thumbnailM,
      this.national,
      this.birthday,
      this.realname,
      this.totalFollow,
      this.follow,
      this.topAlbum,
      this.oalink,
      this.oaid,
      this.sections,
      this.sectionId,
      this.isOABrand,
      this.tabs,
      this.hasOA});

  DetailArtist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    link = json['link'];
    spotlight = json['spotlight'];
    alias = json['alias'];
    playlistId = json['playlistId'];
    cover = json['cover'];
    thumbnail = json['thumbnail'];
    biography = json['biography'];
    sortBiography = json['sortBiography'];
    thumbnailM = json['thumbnailM'];
    national = json['national'];
    birthday = json['birthday'];
    realname = json['realname'];
    totalFollow = json['totalFollow'];
    follow = json['follow'];
    topAlbum =
        json['topAlbum'] != null ? Album.fromJson(json['topAlbum']) : null;
    oalink = json['oalink'];
    oaid = json['oaid'];
    if (json['sections'] != null) {
      sections = <Sections>[];
      json['sections'].forEach((v) {
        sections!.add(Sections.fromJson(v));
      });
    }
    sectionId = json['sectionId'];
    isOABrand = json['isOABrand'];
    tabs = json['tabs'];
    hasOA = json['hasOA'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['link'] = link;
    data['spotlight'] = spotlight;
    data['alias'] = alias;
    data['playlistId'] = playlistId;
    data['cover'] = cover;
    data['thumbnail'] = thumbnail;
    data['biography'] = biography;
    data['sortBiography'] = sortBiography;
    data['thumbnailM'] = thumbnailM;
    data['national'] = national;
    data['birthday'] = birthday;
    data['realname'] = realname;
    data['totalFollow'] = totalFollow;
    data['follow'] = follow;
    if (topAlbum != null) {
      data['topAlbum'] = topAlbum!.toJson();
    }
    data['oalink'] = oalink;
    data['oaid'] = oaid;
    if (sections != null) {
      data['sections'] = sections!.map((v) => v.toJson()).toList();
    }
    data['sectionId'] = sectionId;
    data['isOABrand'] = isOABrand;
    data['tabs'] = tabs;
    data['hasOA'] = hasOA;
    return data;
  }
}
