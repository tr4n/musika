
import 'package:musium/data/platform/network/response/play_list_item_response.dart';

class HomeItemResponse {
  String? sectionType = "";
  String? viewType = "";
  String? title = "";
  String? sectionId = "";
  List<PlayListItemResponse>? items = <PlayListItemResponse>[];
  String? adId = "";
  String? pageType = "";
  String? itemType = "";
  bool? isShuffle = false;
  Chart? chart;
  String? chartType = "";
  String? banner;
  String? type;
  Options? options;

  HomeItemResponse(
      {this.sectionType,
        this.viewType,
        this.title,
        this.sectionId,
        this.items,
        this.adId,
        this.pageType,
        this.itemType,
        this.isShuffle,
        this.chart,
        this.chartType,
        this.banner,
        this.type,
        this.options});

  HomeItemResponse.fromJson(Map<String, dynamic> json) {
    sectionType = json['sectionType'];
    viewType = json['viewType'];
    title = json['title'];
    sectionId = json['sectionId'];
    if (json['items'] != null) {
      items = <PlayListItemResponse>[];
      json['items'].forEach((v) {
        items?.add(PlayListItemResponse.fromJson(v));
      });
    }
    adId = json['adId'];
    pageType = json['pageType'];
    itemType = json['itemType'];
    isShuffle = json['isShuffle'];
    chart = json['chart'] != null ? Chart.fromJson(json['chart']) : null;
    chartType = json['chartType'];
    banner = json['banner'];
    type = json['type'];
    options =
    json['options'] != null ? Options.fromJson(json['options']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sectionType'] = sectionType;
    data['viewType'] = viewType;
    data['title'] = title;
    data['sectionId'] = sectionId;
    if (items != null) {
      data['items'] = items?.map((v) => v.toJson()).toList();
    }
    data['adId'] = adId;
    data['pageType'] = pageType;
    data['itemType'] = itemType;
    data['isShuffle'] = isShuffle;
    if (chart != null) {
      data['chart'] = chart?.toJson();
    }
    data['chartType'] = chartType;
    data['banner'] = banner;
    data['type'] = type;
    if (options != null) {
      data['options'] = options?.toJson();
    }
    return data;
  }
}





class Song {
  int total;
  List<HomeItemResponse> items;

  Song({this.total, this.items});

  Song.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['items'] != null) {
      items = List<HomeItemResponse>();
      json['items'].forEach((v) {
        items.add(HomeItemResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['total'] = this.total;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String encodeId;
  String title;
  String alias;
  bool isOffical;
  String username;
  String artistsNames;
  List<Artists> artists;
  bool isWorldWide;
  String thumbnailM;
  String link;
  String thumbnail;
  int duration;
  bool zingChoice;
  bool isPrivate;
  bool preRelease;
  int releaseDate;
  List<String> genreIds;
  Album album;
  List<Null> indicators;
  int radioId;
  bool isIndie;
  String mvlink;
  int streamingStatus;
  bool allowAudioAds;
  bool hasLyric;

  Items(
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
        this.indicators,
        this.radioId,
        this.isIndie,
        this.mvlink,
        this.streamingStatus,
        this.allowAudioAds,
        this.hasLyric});

  Items.fromJson(Map<String, dynamic> json) {
    encodeId = json['encodeId'];
    title = json['title'];
    alias = json['alias'];
    isOffical = json['isOffical'];
    username = json['username'];
    artistsNames = json['artistsNames'];
    if (json['artists'] != null) {
      artists = List<Artists>();
      json['artists'].forEach((v) {
        artists.add(Artists.fromJson(v));
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
    album = json['album'] != null ? Album.fromJson(json['album']) : null;
    if (json['indicators'] != null) {
      indicators = List<Null>();
      json['indicators'].forEach((v) {
        indicators.add(Null.fromJson(v));
      });
    }
    radioId = json['radioId'];
    isIndie = json['isIndie'];
    mvlink = json['mvlink'];
    streamingStatus = json['streamingStatus'];
    allowAudioAds = json['allowAudioAds'];
    hasLyric = json['hasLyric'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['encodeId'] = this.encodeId;
    data['title'] = this.title;
    data['alias'] = this.alias;
    data['isOffical'] = this.isOffical;
    data['username'] = this.username;
    data['artistsNames'] = this.artistsNames;
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    data['isWorldWide'] = this.isWorldWide;
    data['thumbnailM'] = this.thumbnailM;
    data['link'] = this.link;
    data['thumbnail'] = this.thumbnail;
    data['duration'] = this.duration;
    data['zingChoice'] = this.zingChoice;
    data['isPrivate'] = this.isPrivate;
    data['preRelease'] = this.preRelease;
    data['releaseDate'] = this.releaseDate;
    data['genreIds'] = this.genreIds;
    if (this.album != null) {
      data['album'] = this.album.toJson();
    }
    if (this.indicators != null) {
      data['indicators'] = this.indicators.map((v) => v.toJson()).toList();
    }
    data['radioId'] = this.radioId;
    data['isIndie'] = this.isIndie;
    data['mvlink'] = this.mvlink;
    data['streamingStatus'] = this.streamingStatus;
    data['allowAudioAds'] = this.allowAudioAds;
    data['hasLyric'] = this.hasLyric;
    return data;
  }
}

class Artists {
  String id;
  String name;
  String link;
  bool spotlight;
  String alias;
  String thumbnail;
  String thumbnailM;
  bool isOA;
  bool isOABrand;
  String playlistId;

  Artists(
      {this.id,
        this.name,
        this.link,
        this.spotlight,
        this.alias,
        this.thumbnail,
        this.thumbnailM,
        this.isOA,
        this.isOABrand,
        this.playlistId});

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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['link'] = this.link;
    data['spotlight'] = this.spotlight;
    data['alias'] = this.alias;
    data['thumbnail'] = this.thumbnail;
    data['thumbnailM'] = this.thumbnailM;
    data['isOA'] = this.isOA;
    data['isOABrand'] = this.isOABrand;
    data['playlistId'] = this.playlistId;
    return data;
  }
}

class Album {
  String encodeId;
  String title;
  String thumbnail;
  bool isoffical;
  String link;
  bool isIndie;
  String releaseDate;
  String sortDescription;
  List<String> genreIds;
  bool pR;
  List<Artists> artists;
  String artistsNames;

  Album(
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
        this.artistsNames});

  Album.fromJson(Map<String, dynamic> json) {
    encodeId = json['encodeId'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    isoffical = json['isoffical'];
    link = json['link'];
    isIndie = json['isIndie'];
    releaseDate = json['releaseDate'];
    sortDescription = json['sortDescription'];
    genreIds = json['genreIds'].cast<String>();
    pR = json['PR'];
    if (json['artists'] != null) {
      artists = List<Artists>();
      json['artists'].forEach((v) {
        artists.add(Artists.fromJson(v));
      });
    }
    artistsNames = json['artistsNames'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['encodeId'] = this.encodeId;
    data['title'] = this.title;
    data['thumbnail'] = this.thumbnail;
    data['isoffical'] = this.isoffical;
    data['link'] = this.link;
    data['isIndie'] = this.isIndie;
    data['releaseDate'] = this.releaseDate;
    data['sortDescription'] = this.sortDescription;
    data['genreIds'] = this.genreIds;
    data['PR'] = this.pR;
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    data['artistsNames'] = this.artistsNames;
    return data;
  }
}

class Artist {
  String id;
  String name;
  String link;
  bool spotlight;
  String alias;
  String playlistId;
  String cover;
  String thumbnail;

  Artist(
      {this.id,
        this.name,
        this.link,
        this.spotlight,
        this.alias,
        this.playlistId,
        this.cover,
        this.thumbnail});

  Artist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    link = json['link'];
    spotlight = json['spotlight'];
    alias = json['alias'];
    playlistId = json['playlistId'];
    cover = json['cover'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['link'] = this.link;
    data['spotlight'] = this.spotlight;
    data['alias'] = this.alias;
    data['playlistId'] = this.playlistId;
    data['cover'] = this.cover;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}

class Group {
  int id;
  String name;
  String type;
  String link;

  Group({this.id, this.name, this.type, this.link});

  Group.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['link'] = this.link;
    return data;
  }
}

class Host {
  String name;
  String encodeId;
  String thumbnail;
  String link;
  String id;
  bool spotlight;
  String alias;
  String thumbnailM;
  bool isOA;
  bool isOABrand;
  String playlistId;

  Host(
      {this.name,
        this.encodeId,
        this.thumbnail,
        this.link,
        this.id,
        this.spotlight,
        this.alias,
        this.thumbnailM,
        this.isOA,
        this.isOABrand,
        this.playlistId});

  Host.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    encodeId = json['encodeId'];
    thumbnail = json['thumbnail'];
    link = json['link'];
    id = json['id'];
    spotlight = json['spotlight'];
    alias = json['alias'];
    thumbnailM = json['thumbnailM'];
    isOA = json['isOA'];
    isOABrand = json['isOABrand'];
    playlistId = json['playlistId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['encodeId'] = this.encodeId;
    data['thumbnail'] = this.thumbnail;
    data['link'] = this.link;
    data['id'] = this.id;
    data['spotlight'] = this.spotlight;
    data['alias'] = this.alias;
    data['thumbnailM'] = this.thumbnailM;
    data['isOA'] = this.isOA;
    data['isOABrand'] = this.isOABrand;
    data['playlistId'] = this.playlistId;
    return data;
  }
}

class Program {
  String encodeId;
  String title;
  String thumbnail;
  String thumbnailH;
  String description;
  int startTime;
  int endTime;
  bool hasSongRequest;
  List<String> genreIds;

  Program(
      {this.encodeId,
        this.title,
        this.thumbnail,
        this.thumbnailH,
        this.description,
        this.startTime,
        this.endTime,
        this.hasSongRequest,
        this.genreIds});

  Program.fromJson(Map<String, dynamic> json) {
    encodeId = json['encodeId'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    thumbnailH = json['thumbnailH'];
    description = json['description'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    hasSongRequest = json['hasSongRequest'];
    genreIds = json['genreIds'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['encodeId'] = this.encodeId;
    data['title'] = this.title;
    data['thumbnail'] = this.thumbnail;
    data['thumbnailH'] = this.thumbnailH;
    data['description'] = this.description;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['hasSongRequest'] = this.hasSongRequest;
    data['genreIds'] = this.genreIds;
    return data;
  }
}

class Followers {
  String id;
  String avatar;

  Followers({this.id, this.avatar});

  Followers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['avatar'] = this.avatar;
    return data;
  }
}

class Cta {
  int type;
  String url;
  String text;

  Cta({this.type, this.url, this.text});

  Cta.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = this.type;
    data['url'] = this.url;
    data['text'] = this.text;
    return data;
  }
}

class Chart {
  List<Times> times;
  int minScore;
  double maxScore;
  HomeItemResponse items;
  int totalScore;

  Chart(
      {this.times, this.minScore, this.maxScore, this.items, this.totalScore});

  Chart.fromJson(Map<String, dynamic> json) {
    if (json['times'] != null) {
      times = List<Times>();
      json['times'].forEach((v) {
        times.add(Times.fromJson(v));
      });
    }
    minScore = json['minScore'];
    maxScore = json['maxScore'];
    items = json['items'] != null ? HomeItemResponse.fromJson(json['items']) : null;
    totalScore = json['totalScore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.times != null) {
      data['times'] = this.times.map((v) => v.toJson()).toList();
    }
    data['minScore'] = this.minScore;
    data['maxScore'] = this.maxScore;
    if (this.items != null) {
      data['items'] = this.items.toJson();
    }
    data['totalScore'] = this.totalScore;
    return data;
  }
}

class Times {
  String hour;

  Times({this.hour});

  Times.fromJson(Map<String, dynamic> json) {
    hour = json['hour'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['hour'] = this.hour;
    return data;
  }
}

class Items {
  List<Z6WZD78I> z6WZD78I;
  List<Z6O68A67> z6O68A67;
  List<Z6O6F7BB> z6O6F7BB;

  Items({this.z6WZD78I, this.z6O68A67, this.z6O6F7BB});

  Items.fromJson(Map<String, dynamic> json) {
    if (json['Z6WZD78I'] != null) {
      z6WZD78I = List<Z6WZD78I>();
      json['Z6WZD78I'].forEach((v) {
        z6WZD78I.add(Z6WZD78I.fromJson(v));
      });
    }
    if (json['Z6O68A67'] != null) {
      z6O68A67 = List<Z6O68A67>();
      json['Z6O68A67'].forEach((v) {
        z6O68A67.add(Z6O68A67.fromJson(v));
      });
    }
    if (json['Z6O6F7BB'] != null) {
      z6O6F7BB = List<Z6O6F7BB>();
      json['Z6O6F7BB'].forEach((v) {
        z6O6F7BB.add(Z6O6F7BB.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.z6WZD78I != null) {
      data['Z6WZD78I'] = this.z6WZD78I.map((v) => v.toJson()).toList();
    }
    if (this.z6O68A67 != null) {
      data['Z6O68A67'] = this.z6O68A67.map((v) => v.toJson()).toList();
    }
    if (this.z6O6F7BB != null) {
      data['Z6O6F7BB'] = this.z6O6F7BB.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Z6WZD78I {
  int time;
  String hour;
  int counter;

  Z6WZD78I({this.time, this.hour, this.counter});

  Z6WZD78I.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    hour = json['hour'];
    counter = json['counter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['time'] = this.time;
    data['hour'] = this.hour;
    data['counter'] = this.counter;
    return data;
  }
}

class Options {
  bool autoSlider;

  Options({this.autoSlider});

  Options.fromJson(Map<String, dynamic> json) {
    autoSlider = json['autoSlider'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['autoSlider'] = this.autoSlider;
    return data;
  }
}
