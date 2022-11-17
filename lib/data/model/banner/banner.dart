class MusicBanner {
  int? type;
  String? link;
  String? banner;
  String? cover;
  String? target;
  String? title;
  String? description;
  int? ispr;
  String? encodeId;

  MusicBanner(
      {this.type,
      this.link,
      this.banner,
      this.cover,
      this.target,
      this.title,
      this.description,
      this.ispr,
      this.encodeId});

  MusicBanner.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    link = json['link'];
    banner = json['banner'];
    cover = json['cover'];
    target = json['target'];
    title = json['title'];
    description = json['description'];
    ispr = json['ispr'];
    encodeId = json['encodeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['link'] = link;
    data['banner'] = banner;
    data['cover'] = cover;
    data['target'] = target;
    data['title'] = title;
    data['description'] = description;
    data['ispr'] = ispr;
    data['encodeId'] = encodeId;
    return data;
  }
}
