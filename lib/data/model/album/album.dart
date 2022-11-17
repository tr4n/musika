class Album {
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
  String? artistsNames;

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
    artistsNames = json['artistsNames'];
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
    data['artistsNames'] = artistsNames;
    return data;
  }
}
