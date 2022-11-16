class Program {
  String? encodeId;
  String? title;
  String? thumbnail;
  String? thumbnailH;
  String? description;
  int? startTime;
  int? endTime;
  bool? hasSongRequest;

  Program(
      {this.encodeId,
      this.title,
      this.thumbnail,
      this.thumbnailH,
      this.description,
      this.startTime,
      this.endTime,
      this.hasSongRequest});

  Program.fromJson(Map<String, dynamic> json) {
    encodeId = json['encodeId'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    thumbnailH = json['thumbnailH'];
    description = json['description'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    hasSongRequest = json['hasSongRequest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['encodeId'] = encodeId;
    data['title'] = title;
    data['thumbnail'] = thumbnail;
    data['thumbnailH'] = thumbnailH;
    data['description'] = description;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['hasSongRequest'] = hasSongRequest;
    return data;
  }
}
