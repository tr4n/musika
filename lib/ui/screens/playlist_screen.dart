import 'package:flutter/material.dart';
import 'package:musium/data/model/models.dart';
import 'package:musium/extension/context_ext.dart';

import '../../resources/resources.dart';

class PlaylistScreen extends StatefulWidget {
  final Playlist playlist;

  const PlaylistScreen(this.playlist, {super.key});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: Sizes.size16),
          child: Image.asset("assets/icons/ic_arrow_left.png"),
        ),
        leadingWidth: Sizes.size44,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: Sizes.size16),
            child: Image.asset(
              "assets/icons/ic_more_circle.png",
              width: Sizes.size28,
              height: Sizes.size28,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
      body: _playlistBody(),
    );
  }

  Widget _playlistBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _information(),
          const SizedBox(height: Sizes.size16),
          _actions(),
          const SizedBox(height: Sizes.size16),
          Container(
            height: Sizes.size1,
            margin: const EdgeInsets.symmetric(horizontal: Sizes.size20),
            color: Colors.black12,
          ),
          const SizedBox(height: Sizes.size16),
          _songs(),
        ],
      ),
    );
  }

  Widget _information() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: context.screenWidth),
        ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.size32),
          child: Image.network(
            widget.playlist.thumbnailM ??
                "https://api.lorem.space/image/album?w=250&h=250",
            width: Sizes.size200,
            height: Sizes.size200,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: Sizes.size16),
        DefaultTextStyle(
          style: const TextStyle(
            fontSize: Sizes.size24,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          child: Text(widget.playlist.title ?? ""),
        ),
        const SizedBox(height: Sizes.size16),
        DefaultTextStyle(
          style: const TextStyle(
            fontSize: Sizes.size18,
            color: Colors.black,
          ),
          child: Text(widget.playlist.artistsNames ?? ""),
        ),
        const SizedBox(height: Sizes.size12),
        DefaultTextStyle(
          style: const TextStyle(
            fontSize: Sizes.size14,
            fontWeight: FontWeight.w200,
            color: Colors.black,
          ),
          child: Text(
            widget.playlist.sortDescription ?? "",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _actions() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Sizes.size20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/icons/ic_heart.png",
                width: Sizes.size24,
                height: Sizes.size24,
              ),
              const SizedBox(width: Sizes.size20),
              const Icon(
                Icons.playlist_add,
                size: Sizes.size28,
                color: Colors.black87,
              ),
              const SizedBox(width: Sizes.size20),
              const Icon(
                Icons.more_vert,
                size: Sizes.size28,
                color: Colors.black87,
              ),
            ],
          ),
          _playButton(),
        ],
      ),
    );
  }

  Widget _playButton() {
    return GestureDetector(
      onTap: null,
      child: Container(
        padding: const EdgeInsets.only(
          left: Sizes.size20,
          top: Sizes.size12,
          right: Sizes.size20,
          bottom: Sizes.size12,
        ),
        decoration: BoxDecoration(
          color: AppColor.green06C149,
          borderRadius: const BorderRadius.all(Radius.circular(Sizes.size100)),
          boxShadow: [
            BoxShadow(
              color: AppColor.green06C149.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 75,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              "assets/icons/ic_play_filled.png",
              width: Sizes.size20,
              height: Sizes.size20,
            ),
            const SizedBox(width: Sizes.size8),
            const DefaultTextStyle(
              style: TextStyle(
                color: Colors.white,
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w700,
              ),
              child: Text("Play", textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }

  Widget _songs() {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: Sizes.size20),
            const DefaultTextStyle(
              style: TextStyle(
                color: Colors.black,
                fontSize: Sizes.size20,
                fontWeight: FontWeight.w700,
              ),
              child: Text("Songs", textAlign: TextAlign.start),
            ),
            Expanded(
              child: DefaultTextStyle(
                style: TextStyle(
                  color: AppColor.green06C149,
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w700,
                ),
                child: const Text("See All", textAlign: TextAlign.end),
              ),
            ),
            const SizedBox(width: Sizes.size20),
          ],
        )
      ],
    );
  }
}
