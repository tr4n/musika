import 'models.dart';

class Mix {
  String? encodeId;
  String? title;
  String? thumbnail;
  bool? isOfficial;
  String? link;
  bool? isIndie;
  String? releaseDate;
  String? sortDescription;
  List<String>? genreIds;
  bool? pR;
  List<Artist>? artists;
  String? artistsNames;
  int? playItemMode;
  int? subType;
  int? uid;
  String? thumbnailM;
  bool? isShuffle;
  bool? isPrivate;
  String? userName;
  bool? isAlbum;
  String? textType;
  bool? isSingle;

  Mix(
      {this.encodeId,
      this.title,
      this.thumbnail,
      this.isOfficial,
      this.link,
      this.isIndie,
      this.releaseDate,
      this.sortDescription,
      this.genreIds,
      this.pR,
      this.artists,
      this.artistsNames,
      this.playItemMode,
      this.subType,
      this.uid,
      this.thumbnailM,
      this.isShuffle,
      this.isPrivate,
      this.userName,
      this.isAlbum,
      this.textType,
      this.isSingle});

  Mix.fromJson(Map<String, dynamic> json) {
    encodeId = json['encodeId'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    isOfficial = json['isoffical'];
    link = json['link'];
    isIndie = json['isIndie'];
    releaseDate = json['releaseDate'];
    sortDescription = json['sortDescription'];
    genreIds = json['genreIds'].cast<String>();
    pR = json['PR'];
    if (json['artists'] != null) {
      artists = <Artist>[];
      json['artists'].forEach((v) {
        artists?.add(Artist.fromJson(v));
      });
    }
    artistsNames = json['artistsNames'];
    playItemMode = json['playItemMode'];
    subType = json['subType'];
    uid = json['uid'];
    thumbnailM = json['thumbnailM'];
    isShuffle = json['isShuffle'];
    isPrivate = json['isPrivate'];
    userName = json['userName'];
    isAlbum = json['isAlbum'];
    textType = json['textType'];
    isSingle = json['isSingle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['encodeId'] = encodeId;
    data['title'] = title;
    data['thumbnail'] = thumbnail;
    data['isoffical'] = isOfficial;
    data['link'] = link;
    data['isIndie'] = isIndie;
    data['releaseDate'] = releaseDate;
    data['sortDescription'] = sortDescription;
    data['genreIds'] = genreIds;
    data['PR'] = pR;
    if (artists != null) {
      data['artists'] = artists!.map((v) => v.toJson()).toList();
    }
    data['artistsNames'] = artistsNames;
    data['playItemMode'] = playItemMode;
    data['subType'] = subType;
    data['uid'] = uid;
    data['thumbnailM'] = thumbnailM;
    data['isShuffle'] = isShuffle;
    data['isPrivate'] = isPrivate;
    data['userName'] = userName;
    data['isAlbum'] = isAlbum;
    data['textType'] = textType;
    data['isSingle'] = isSingle;
    return data;
  }
}
