import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

import '../../data/model/models.dart';
import '../../resources/resources.dart';

class ItemPlaylists extends StatelessWidget {
  final Playlists playlists;

  const ItemPlaylists(this.playlists, {super.key});

  @override
  Widget build(BuildContext context) {
    final playlistItems = playlists.items;
    if (playlistItems == null || playlistItems.isEmpty) {
      return const SizedBox();
    }
    return Container(
      margin: const EdgeInsets.only(top: Sizes.size16),
      padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: Sizes.size20,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
            child: Text(
              playlists.title?.isNotEmpty == true
                  ? playlists.title ?? ""
                  : "Albums",
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(height: Sizes.size8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: playlistItems.map((e) => _item(e)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _item(Playlist playlist) {
    return Container(
      margin: const EdgeInsets.only(right: Sizes.size8, bottom: Sizes.size8),
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.size16),
            child: Image.network(
              playlist.thumbnailM ??
                  "https://api.lorem.space/image/album?w=150&h=150",
              width: Sizes.size150,
              height: Sizes.size150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: Sizes.size12),
          SizedBox(
            width: Sizes.size150,
            child: DefaultTextStyle(
              style: const TextStyle(
                color: Colors.black,
                fontSize: Sizes.size14,
              ),
              child: Text(playlist.title ?? lorem(paragraphs: 1, words: 5),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),
            ),
          )
        ],
      ),
    );
  }
}
