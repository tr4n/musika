class HomeSectionItem {
  String? sectionType = "";
  String? title = "";

  HomeSectionItem({this.sectionType, this.title});

  HomeSectionItem.fromJson(Map<String, dynamic> json) {
    sectionType = json['sectionType'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sectionType'] = sectionType;
    data['title'] = title;
    return data;
  }
}
