import '../../../extension/collection_ext.dart';
import '../artist/artist.dart';

class NewRelease {
  String? encodeId;
  String? title;
  String? alias;
  bool? isOfficial;
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
  bool? isIndie;
  int? streamingStatus;
  bool? allowAudioAds;
  bool? hasLyric;

  NewRelease({this.encodeId,
    this.title,
    this.alias,
    this.isOfficial,
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
    this.isIndie,
    this.streamingStatus,
    this.allowAudioAds,
    this.hasLyric});

  NewRelease.fromJson(Map<String, dynamic> json) {
    encodeId = json['encodeId'];
    title = json['title'];
    alias = json['alias'];
    isOfficial = json['isOffical'];
    username = json['username'];
    artistsNames = json['artistsNames'];
    if (json['artists'] != null) {
      artists = <Artist>[];
      json['artists'].forEach((v) {
        artists?.add(Artist.fromJson(v));
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
    isIndie = json['isIndie'];
    streamingStatus = json['streamingStatus'];
    allowAudioAds = json['allowAudioAds'];
    hasLyric = json['hasLyric'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['encodeId'] = encodeId;
    data['title'] = title;
    data['alias'] = alias;
    data['isOffical'] = isOfficial;
    data['username'] = username;
    data['artistsNames'] = artistsNames;
    data['artists'] = artists?.map((v) => v.toJson()).toList();
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
    data['isIndie'] = isIndie;
    data['streamingStatus'] = streamingStatus;
    data['allowAudioAds'] = allowAudioAds;
    data['hasLyric'] = hasLyric;
    return data;
  }
}
