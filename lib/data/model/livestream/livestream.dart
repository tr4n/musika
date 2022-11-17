import '../models.dart';

class Livestream {
  int? id;
  String? encodeId;
  String? title;
  String? thumbnail;
  String? thumbnailM;
  String? thumbnailV;
  String? thumbnailH;
  String? description;
  int? status;
  String? type;
  String? link;
  String? streaming;
  Host? host;
  int? activeUsers;
  Program? program;

  Livestream(
      {this.id,
      this.encodeId,
      this.title,
      this.thumbnail,
      this.thumbnailM,
      this.thumbnailV,
      this.thumbnailH,
      this.description,
      this.status,
      this.type,
      this.link,
      this.streaming,
      this.host,
      this.activeUsers,
      this.program});

  Livestream.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    encodeId = json['encodeId'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    thumbnailM = json['thumbnailM'];
    thumbnailV = json['thumbnailV'];
    thumbnailH = json['thumbnailH'];
    description = json['description'];
    status = json['status'];
    type = json['type'];
    link = json['link'];
    streaming = json['streaming'];
    host = json['host'] != null ? Host.fromJson(json['host']) : null;
    activeUsers = json['activeUsers'];
    program =
        json['program'] != null ? Program.fromJson(json['program']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['encodeId'] = encodeId;
    data['title'] = title;
    data['thumbnail'] = thumbnail;
    data['thumbnailM'] = thumbnailM;
    data['thumbnailV'] = thumbnailV;
    data['thumbnailH'] = thumbnailH;
    data['description'] = description;
    data['status'] = status;
    data['type'] = type;
    data['link'] = link;
    data['streaming'] = streaming;
    if (host != null) {
      data['host'] = host?.toJson();
    }
    data['activeUsers'] = activeUsers;
    if (program != null) {
      data['program'] = program?.toJson();
    }
    return data;
  }
}
