class HomeItemDataResponse {
  String? sectionType = "";
  String? title = "";

  HomeItemDataResponse({this.sectionType, this.title});

  HomeItemDataResponse.fromJson(Map<String, dynamic> json) {
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
