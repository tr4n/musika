import '../../platform/network/response/base_response.dart';
import '../song/song.dart';

class ArtistSongList extends ToJsonAble {
  int? total;
  List<Song>? items;
  bool? hasMore;

  ArtistSongList({this.total, this.items, this.hasMore});

  ArtistSongList.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['items'] != null) {
      items = <Song>[];
      json['items'].forEach((v) {
        items!.add(Song.fromJson(v));
      });
    }
    hasMore = json['hasMore'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['items'] = items?.map((v) => v.toJson()).toList();
    data['hasMore'] = hasMore;
    return data;
  }
}
