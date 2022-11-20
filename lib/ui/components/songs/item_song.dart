import 'package:flutter/material.dart';

import '../../../data/model/models.dart';
import '../../../resources/resources.dart';

class ItemSong extends StatelessWidget {
  Song song;
  Function(Song)? onPlay;

  ItemSong({required this.song, this.onPlay, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: Sizes.size16, vertical: Sizes.size8),
      child: Row(
        children: [
          _cover(),
          const SizedBox(width: Sizes.size8),
          Expanded(
            child: IntrinsicHeight(
              child: _nameAndArtists(),
            ),
          ),
          const SizedBox(width: Sizes.size8),
          _buttonPlay(),
          const SizedBox(width: Sizes.size8),
          _buttonMore(),
        ],
      ),
    );
  }

  Widget _cover() {
    return GestureDetector(
      onTap: () => onPlay?.call(song),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Sizes.size20),
        child: Image.network(
          song.thumbnail ?? "https://api.lorem.space/image/album?w=100&h=100",
          width: Sizes.size80,
          height: Sizes.size80,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _nameAndArtists() {
    return GestureDetector(
      onTap: () => onPlay?.call(song),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: Sizes.size14,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
              child: Text(song.title ?? ""),
            ),
          ),
          const SizedBox(height: Sizes.size8),
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: Sizes.size12,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
            child: Text(song.artistsNames ?? ""),
          ),
        ],
      ),
    );
  }

  Widget _buttonPlay() {
    return IconButton(
      icon: const Icon(Icons.play_circle_fill_rounded),
      iconSize: Sizes.size28,
      color: AppColor.green06C149,
      onPressed: () => onPlay?.call(song),
    );
  }

  Widget _buttonMore() {
    return const IconButton(
      icon: Icon(Icons.more_vert),
      iconSize: Sizes.size24,
      color: Colors.black,
      disabledColor: Colors.black,
      onPressed: null,
    );
  }
}
