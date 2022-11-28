import 'package:musium/data/platform/network/response/base_response.dart';

import '../../../extension/collection_ext.dart';
import '../album/album.dart';
import '../artist/artist.dart';

class Song implements ToJsonAble {
  String? encodeId;
  String? title;
  String? alias;
  bool? isOffical;
  String? username;
  String? artistsNames;
  List<Artist>? artists;
  bool? isWorldWide;
  String? thumbnailM;
  String? link;
  String? thumbnail;
  int? duration;
  bool? zingChoice;
  bool? isPrivate;
  bool? preRelease;
  int? releaseDate;
  List<String>? genreIds;
  Album? album;
  bool? isIndie;
  String? mvlink;
  int? streamingStatus;
  bool? allowAudioAds;
  bool? hasLyric;

  Song(
      {this.encodeId,
      this.title,
      this.alias,
      this.isOffical,
      this.username,
      this.artistsNames,
      this.artists,
      this.isWorldWide,
      this.thumbnailM,
      this.link,
      this.thumbnail,
      this.duration,
      this.zingChoice,
      this.isPrivate,
      this.preRelease,
      this.releaseDate,
      this.genreIds,
      this.album,
      this.isIndie,
      this.mvlink,
      this.streamingStatus,
      this.allowAudioAds,
      this.hasLyric});

  Song.fromJson(Map<String, dynamic> json) {
    encodeId = json['encodeId'];
    title = json['title'];
    alias = json['alias'];
    isOffical = json['isOffical'];
    username = json['username'];
    artistsNames = json['artistsNames'];
    if (json['artists'] != null) {
      artists = <Artist>[];
      json['artists'].forEach((v) {
        artists!.add(Artist.fromJson(v));
      });
    }
    isWorldWide = json['isWorldWide'];
    thumbnailM = json['thumbnailM'];
    link = json['link'];
    thumbnail = json['thumbnail'];
    duration = json['duration'];
    zingChoice = json['zingChoice'];
    isPrivate = json['isPrivate'];
    preRelease = json['preRelease'];
    releaseDate = json['releaseDate'];
    genreIds = cast<List<dynamic>>(json['genreIds'])
        ?.map((e) => e.toString())
        .toList();
    album = json['album'] != null ? Album.fromJson(json['album']) : null;
    isIndie = json['isIndie'];
    mvlink = json['mvlink'];
    streamingStatus = json['streamingStatus'];
    allowAudioAds = json['allowAudioAds'];
    hasLyric = json['hasLyric'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['encodeId'] = encodeId;
    data['title'] = title;
    data['alias'] = alias;
    data['isOffical'] = isOffical;
    data['username'] = username;
    data['artistsNames'] = artistsNames;
    if (artists != null) {
      data['artists'] = artists!.map((v) => v.toJson()).toList();
    }
    data['isWorldWide'] = isWorldWide;
    data['thumbnailM'] = thumbnailM;
    data['link'] = link;
    data['thumbnail'] = thumbnail;
    data['duration'] = duration;
    data['zingChoice'] = zingChoice;
    data['isPrivate'] = isPrivate;
    data['preRelease'] = preRelease;
    data['releaseDate'] = releaseDate;
    data['genreIds'] = genreIds;
    if (album != null) {
      data['album'] = album!.toJson();
    }
    data['isIndie'] = isIndie;
    data['mvlink'] = mvlink;
    data['streamingStatus'] = streamingStatus;
    data['allowAudioAds'] = allowAudioAds;
    data['hasLyric'] = hasLyric;
    return data;
  }
}
