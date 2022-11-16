class NewRelease {
  String? encodeId;
  String? title;
  String? alias;
  bool? isOfficial;
  String? username;
  String? artistsNames;
  List<Artists>? artists;
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

  NewRelease(
      {this.encodeId,
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
      artists = <Artists>[];
      json['artists'].forEach((v) {
        artists?.add(Artists.fromJson(v));
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
    genreIds = json['genreIds'].cast<String>();
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

class Artists {
  String? id;
  String? name;
  String? link;
  bool? spotlight;
  String? alias;
  String? thumbnail;
  String? thumbnailM;
  bool? isOA;
  bool? isOABrand;
  String? playlistId;

  Artists({
    this.id,
    this.name,
    this.link,
    this.spotlight,
    this.alias,
    this.thumbnail,
    this.thumbnailM,
    this.isOA,
    this.isOABrand,
    this.playlistId,
  });

  Artists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    link = json['link'];
    spotlight = json['spotlight'];
    alias = json['alias'];
    thumbnail = json['thumbnail'];
    thumbnailM = json['thumbnailM'];
    isOA = json['isOA'];
    isOABrand = json['isOABrand'];
    playlistId = json['playlistId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['link'] = link;
    data['spotlight'] = spotlight;
    data['alias'] = alias;
    data['thumbnail'] = thumbnail;
    data['thumbnailM'] = thumbnailM;
    data['isOA'] = isOA;
    data['isOABrand'] = isOABrand;
    data['playlistId'] = playlistId;
    return data;
  }
}
