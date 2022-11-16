class Host {
  String? name;
  String? encodeId;
  String? thumbnail;
  String? link;

  Host({this.name, this.encodeId, this.thumbnail, this.link});

  Host.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    encodeId = json['encodeId'];
    thumbnail = json['thumbnail'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['encodeId'] = encodeId;
    data['thumbnail'] = thumbnail;
    data['link'] = link;
    return data;
  }
}