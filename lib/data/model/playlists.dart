import 'package:musium/data/model/playlist.dart';

import '../platform/network/response/playlists_response.dart';

class Playlists {
  String? title;
  List<Playlist>? items;

  Playlists({this.items, this.title});

  factory Playlists.fromResponse(PlaylistsResponse response) {
    return Playlists(title: response.title, items: response.items);
  }
}
