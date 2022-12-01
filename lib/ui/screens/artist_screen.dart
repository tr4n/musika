import 'package:flutter/material.dart';
import 'package:musium/blocs/artist_bloc.dart';
import 'package:musium/common/common.dart';
import 'package:musium/data/model/artist/detail_artist.dart';
import 'package:musium/data/model/models.dart';
import 'package:musium/data/platform/network/response/error_response.dart';
import 'package:musium/ui/components/songs/song_list.dart';
import 'package:musium/ui/screens/play_song_screen.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sane/collection.dart';

import '../../resources/resources.dart';

class ArtistScreen extends StatefulWidget {
  final String artistAlias;

  const ArtistScreen(this.artistAlias, {super.key});

  @override
  State<ArtistScreen> createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {
  final _artistBloc = ArtistBloc();
  DetailArtist _detailArtist = DetailArtist();

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
    _artistBloc.getDetailArtist(widget.artistAlias);
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
      stream: _artistBloc.errorObservable,
      builder: (context, snapshot) {
        CustomSnackBar.of(context).show(snapshot.data?.statusMessage ?? "");
        return const SizedBox();
      },
    );
    StreamBuilder(
      stream: _artistBloc.loading,
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

  Stream<Pair<DetailArtist, ErrorResponse>> get _detailArtistObservable =>
      Rx.combineLatest2<DetailArtist, ErrorResponse,
              Pair<DetailArtist, ErrorResponse>>(
          _artistBloc.detailArtistObservable,
          _artistBloc.errorObservable,
          (detailArtist, error) => Pair(detailArtist, error));

  Widget _cover(){
    return
  }
  Widget _playlistBody() {
    return StreamBuilder(
      stream: _artistBloc.detailArtistObservable,
      builder: (context, snapshot) {
        final detailArtist = snapshot.data;
        if (detailArtist == null) {
          return Center(
              child: CircularProgressIndicator(color: AppColor.green06C149));
        }
        // if(errorResponse != null || detailArtist == null) {
        //   CustomSnackBar.of(context).show(errorResponse?.statusMessage ?? "");
        //   return const SizedBox();
        // }

        _detailArtist = detailArtist;
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _information(),
              const SizedBox(height: Sizes.size8),
              _biography(),
              const SizedBox(height: Sizes.size8),
              _line(),
              const SizedBox(height: Sizes.size16),
              _actions(),
              const SizedBox(height: Sizes.size16),
              Container(
                height: Sizes.size1,
                margin: const EdgeInsets.symmetric(horizontal: Sizes.size20),
                color: Colors.black12,
              ),
              const SizedBox(height: Sizes.size16),
              //   _songList(detailArtist),
            ],
          ),
        );
      },
    );
  }

  Widget _information() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Sizes.size20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.size100),
            child: Image.network(
              _detailArtist.thumbnail ??
                  "https://api.lorem.space/image/face?w=100&h=100",
              width: Sizes.size100,
              height: Sizes.size100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: Sizes.size8),
          Expanded(
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
                  child: Text(_detailArtist.name ?? ""),
                ),
                const SizedBox(height: Sizes.size8),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: Sizes.size14,
                    color: Colors.black,
                  ),
                  child: Text("(${_detailArtist.realname})"),
                ),
                const SizedBox(height: Sizes.size8),
                Row(
                  children: [
                    const Icon(Icons.calendar_today_rounded,
                        size: Sizes.size20),
                    const SizedBox(height: Sizes.size8),
                    DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: Sizes.size14,
                        color: Colors.black,
                      ),
                      child: Text("${_detailArtist.birthday}"),
                    ),
                  ],
                ),
                const SizedBox(height: Sizes.size8),
                Row(
                  children: [
                    const Icon(Icons.language_rounded, size: Sizes.size20),
                    const SizedBox(height: Sizes.size8),
                    DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: Sizes.size14,
                        color: Colors.black,
                      ),
                      child: Text("${_detailArtist.national}"),
                    ),
                  ],
                ),
                const SizedBox(height: Sizes.size8),
                Row(
                  children: [
                    const Icon(Icons.person_add_alt_rounded,
                        size: Sizes.size20),
                    const SizedBox(height: Sizes.size8),
                    DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: Sizes.size14,
                        color: Colors.black,
                      ),
                      child: Text("${_detailArtist.follow} fans"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _biography() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Sizes.size20),
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: Sizes.size14,
          color: Colors.black,
        ),
        child: Text(
          _detailArtist.sortBiography ?? "",
          textAlign: TextAlign.start,
        ),
      ),
    );
  }

  Widget _followers() {
    return Row(
      children: [
        Column(
          children: [
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
              child: Text(_detailArtist.name ?? ""),
            ),
            const SizedBox(height: Sizes.size8),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: Sizes.size14,
                color: Colors.black,
              ),
              child: Text("Real name: ${_detailArtist.realname}"),
            ),
          ],
        )
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

  Widget _line() {
    return Container(
      height: Sizes.size1,
      margin: const EdgeInsets.symmetric(horizontal: Sizes.size20),
      color: Colors.black12,
    );
  }
}
