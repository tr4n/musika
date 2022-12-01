import 'package:musium/data/model/album/album.dart';

class Sections {
  String? sectionType;
  String? viewType;
  String? title;
  String? link;
  String? sectionId;
  List<Sections>? items;
  Album? topAlbum;

  Sections({
    this.sectionType,
    this.viewType,
    this.title,
    this.link,
    this.sectionId,
    this.items,
    this.topAlbum,
  });

  Sections.fromJson(Map<String, dynamic> json) {
    sectionType = json['sectionType'];
    viewType = json['viewType'];
    title = json['title'];
    link = json['link'];
    sectionId = json['sectionId'];
    if (json['items'] != null) {
      items = <Sections>[];
      json['items'].forEach((v) {
        items!.add(Sections.fromJson(v));
      });
    }
    topAlbum =
        json['topAlbum'] != null ? Album.fromJson(json['topAlbum']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sectionType'] = sectionType;
    data['viewType'] = viewType;
    data['title'] = title;
    data['link'] = link;
    data['sectionId'] = sectionId;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    if (topAlbum != null) {
      data['topAlbum'] = topAlbum!.toJson();
    }
    return data;
  }
}
