import '../models.dart';

class Songs {
  List<Song>? items;
  int? total;
  int? totalDuration;

  Songs({this.items, this.total, this.totalDuration});

  Songs.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Song>[];
      json['items'].forEach((v) {
        items!.add(Song.fromJson(v));
      });
    }
    total = json['total'];
    totalDuration = json['totalDuration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['items'] = items?.map((v) => v.toJson()).toList();
    data['total'] = total;
    data['totalDuration'] = totalDuration;
    return data;
  }
}
