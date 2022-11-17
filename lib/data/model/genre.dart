class Genre {
  String? id;
  String? name;
  String? title;
  String? alias;
  String? link;

  Genre({this.id, this.name, this.title, this.alias, this.link});

  Genre.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
    alias = json['alias'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['title'] = title;
    data['alias'] = alias;
    data['link'] = link;
    return data;
  }
}
