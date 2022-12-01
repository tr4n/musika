import 'package:flutter/material.dart';
import 'package:musium/blocs/playlist_bloc.dart';
import 'package:musium/common/common.dart';
import 'package:musium/data/model/models.dart';
import 'package:musium/extension/context_ext.dart';
import 'package:musium/ui/components/songs/song_list.dart';
import 'package:musium/ui/screens/play_song_screen.dart';

import '../../resources/resources.dart';

class PlaylistScreen extends StatefulWidget {
  final String playlistId;

  const PlaylistScreen(this.playlistId, {super.key});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  final _playlistBloc = PlaylistBloc();
  DetailPlaylist _playlist = DetailPlaylist();

  AlertDialog? _loadingDialog;

  void _onBackPress() {
    Navigator.pop(context);
  }

  void _onPlaySong(Song song) {
    final songId = song.encodeId;
    if (songId != null) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => PlaySongScreen(songId)));
    }
  }

  @override
  Widget build(BuildContext context) {
    _playlistBloc.getDetailPlaylist(widget.playlistId);
    _observeData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.only(left: Sizes.size16),
          icon: Image.asset("assets/icons/ic_arrow_left.png"),
          onPressed: _onBackPress,
        ),
        leadingWidth: Sizes.size44,
        actions: [
          IconButton(
            onPressed: null,
            padding: const EdgeInsets.only(right: Sizes.size16),
            icon: Image.asset(
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

  void _observeData() {
    StreamBuilder(
      stream: _playlistBloc.errorObservable,
      builder: (context, snapshot) {
        CustomSnackBar.of(context).show(snapshot.data?.statusMessage ?? "");
        return const SizedBox();
      },
    );
    StreamBuilder(
      stream: _playlistBloc.loading,
      builder: (context, snapshot) {
        if (snapshot.data == true) {
          _loadingDialog = AlertDialog(
            content: CircularProgressIndicator(color: AppColor.green06C149),
          );
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return _loadingDialog ?? const SizedBox();
            },
          );
        } else if (_loadingDialog != null) {
          _loadingDialog = null;
          Navigator.pop(context);
        }

        return const SizedBox();
      },
    );
  }

  Widget _playlistBody() {
    return StreamBuilder(
      stream: _playlistBloc.detailPlaylistObservable,
      builder: (context, snapshot) {
        final detailPlaylist = snapshot.data;
        if (detailPlaylist == null) {
          return Center(
              child: CircularProgressIndicator(color: AppColor.green06C149));
        }
        _playlist = detailPlaylist;
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
              _songList(detailPlaylist),
            ],
          ),
        );
      },
    );
  }

  Widget _information() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Sizes.size20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: context.screenWidth),
          ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.size32),
            child: Image.network(
              _playlist.thumbnailM ??
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
            child: Text(_playlist.title ?? ""),
          ),
          const SizedBox(height: Sizes.size16),
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: Sizes.size18,
              color: Colors.black,
            ),
            child: Text(
              _playlist.artistsNames ?? "",
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: Sizes.size12),
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: Sizes.size14,
              color: Colors.grey,
            ),
            child: Text(
              _playlist.sortDescription ?? "",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
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
              const IconButton(
                icon: Icon(Icons.playlist_add),
                iconSize: Sizes.size28,
                color: Colors.black87,
                onPressed: null,
              ),
              const SizedBox(width: Sizes.size20),
              const IconButton(
                icon: Icon(Icons.more_vert),
                iconSize: Sizes.size28,
                color: Colors.black87,
                onPressed: null,
              ),
            ],
          ),
          _buttonPlay()
        ],
      ),
    );
  }

  Widget _buttonPlay() {
    return ElevatedButton.icon(
      icon: Image.asset(
        "assets/icons/ic_play_filled.png",
        width: Sizes.size20,
        height: Sizes.size20,
      ),
      label: const DefaultTextStyle(
        style: TextStyle(
          fontSize: Sizes.size16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        child: Text("Play", textAlign: TextAlign.start),
      ),
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.green06C149,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
            vertical: Sizes.size12, horizontal: Sizes.size16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.size32),
        ),
      ),
    );
  }

  Widget _songList(DetailPlaylist detailPlaylist) {
    final songs = detailPlaylist.songs;
    return songs != null
        ? SongList(
            title: "Songs",
            songs: songs,
            onTapSeeAll: () {},
            onPlaySong: _onPlaySong,
          )
        : const SizedBox();
  }
}
