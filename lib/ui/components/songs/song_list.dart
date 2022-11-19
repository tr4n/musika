import 'package:flutter/material.dart';
import 'package:musium/ui/components/songs/item_song.dart';

import '../../../data/model/models.dart';
import '../../../resources/resources.dart';

class SongList extends StatelessWidget {
  String title;
  Function()? onTapSeeAll;
  Function(Song)? onPlaySong;

  Songs songs;

  SongList(
      {required this.songs,
      required this.title,
      this.onTapSeeAll,
      this.onPlaySong,
      super.key});

  @override
  Widget build(BuildContext context) {
    final listSong = songs.items;
    if (listSong == null || listSong.isEmpty) {
      return const SizedBox();
    }
    return Column(
      children: [
        _title(),
        const SizedBox(height: Sizes.size8),
        Column(
            children: listSong
                .map((e) => ItemSong(
                      song: e,
                      onPlay: onPlaySong,
                    ))
                .toList()),
      ],
    );
  }

  Widget _title() {
    return Row(
      children: [
        const SizedBox(width: Sizes.size20),
        Expanded(
          child: DefaultTextStyle(
            style: const TextStyle(
              color: Colors.black,
              fontSize: Sizes.size20,
              fontWeight: FontWeight.w700,
            ),
            child: Text(title, textAlign: TextAlign.start),
          ),
        ),
        onTapSeeAll != null
            ? GestureDetector(
                onTap: onTapSeeAll,
                child: DefaultTextStyle(
                  style: TextStyle(
                    color: AppColor.green06C149,
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w700,
                  ),
                  child: const Text("See All", textAlign: TextAlign.end),
                ),
              )
            : const SizedBox(),
        const SizedBox(width: Sizes.size20),
      ],
    );
  }
}
