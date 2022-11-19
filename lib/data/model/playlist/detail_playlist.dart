import '../../../extension/collection_ext.dart';
import '../models.dart';

class DetailPlaylist {
  String? encodeId;
  String? title;
  String? thumbnail;
  bool? isoffical;
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
  String? description;
  String? aliasTitle;
  String? sectionId;
  int? contentLastUpdate;
  Artist? artist;
  List<Genre>? genres;
  Songs? songs;
  int? like;
  int? listen;
  bool? liked;

  DetailPlaylist(
      {this.encodeId,
      this.title,
      this.thumbnail,
      this.isoffical,
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
      this.isSingle,
      this.description,
      this.aliasTitle,
      this.sectionId,
      this.contentLastUpdate,
      this.artist,
      this.genres,
      this.songs,
      this.like,
      this.listen,
      this.liked});

  DetailPlaylist.fromJson(Map<String, dynamic> json) {
    encodeId = json['encodeId'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    isoffical = json['isoffical'];
    link = json['link'];
    isIndie = json['isIndie'];
    releaseDate = json['releaseDate'];
    sortDescription = json['sortDescription'];
    genreIds = cast<List<dynamic>>(json['genreIds'])
        ?.map((e) => e.toString())
        .toList();
    pR = json['PR'];
    if (json['artists'] != null) {
      artists = <Artist>[];
      json['artists'].forEach((v) {
        artists!.add(Artist.fromJson(v));
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
    description = json['description'];
    aliasTitle = json['aliasTitle'];
    sectionId = json['sectionId'];
    contentLastUpdate = json['contentLastUpdate'];
    artist = json['artist'] != null ? Artist.fromJson(json['artist']) : null;
    if (json['genres'] != null) {
      genres = <Genre>[];
      json['genres'].forEach((v) {
        genres!.add(Genre.fromJson(v));
      });
    }
    songs = json['song'] != null ? Songs.fromJson(json['song']) : null;
    like = json['like'];
    listen = json['listen'];
    liked = json['liked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['encodeId'] = encodeId;
    data['title'] = title;
    data['thumbnail'] = thumbnail;
    data['isoffical'] = isoffical;
    data['link'] = link;
    data['isIndie'] = isIndie;
    data['releaseDate'] = releaseDate;
    data['sortDescription'] = sortDescription;
    data['genreIds'] = genreIds;
    data['PR'] = pR;
    data['artists'] = artists?.map((v) => v.toJson()).toList();
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
    data['description'] = description;
    data['aliasTitle'] = aliasTitle;
    data['sectionId'] = sectionId;
    data['contentLastUpdate'] = contentLastUpdate;
    data['artist'] = artist?.toJson();
    data['genres'] = genres?.map((v) => v.toJson()).toList();
    if (songs != null) {
      data['song'] = songs!.toJson();
    }
    data['like'] = like;
    data['listen'] = listen;
    data['liked'] = liked;
    return data;
  }
}
