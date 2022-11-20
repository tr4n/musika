import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musium/blocs/play_song_bloc.dart';
import 'package:musium/data/model/models.dart';
import 'package:musium/extension/context_ext.dart';

import '../../resources/resources.dart';
import '../components/components.dart';

class PlaySongScreen extends StatefulWidget {
  final Song song;

  const PlaySongScreen(this.song, {super.key});

  @override
  State<PlaySongScreen> createState() => _PlaySongScreenState();
}

class _PlaySongScreenState extends State<PlaySongScreen>
    with SingleTickerProviderStateMixin {
  final _playSongBloc = PlaySongBloc();
  final _audioPlayer = AudioPlayer();
  var _streamUrl = "";

  void _onBackPress() {
    Navigator.pop(context);
  }

  void _playSong() async {
    await _audioPlayer.setUrl(_streamUrl);
    await _audioPlayer.play();
  }

  void _pause() async {
    await _audioPlayer.pause();
  }

  void _resume() async {
    await _audioPlayer.play();
  }

  void _seekTo(int seconds) async {
    await _audioPlayer.seek(Duration(seconds: seconds));
  }

  @override
  void dispose() {
    // Release decoders and buffers back to the operating system making them
    // available for other apps to use.
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _playSongBloc.getSongData(widget.song.encodeId ?? "");
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
      body: _playSongBody(),
    );
  }

  void _observeData() {
    StreamBuilder(
      stream: _playSongBloc.errorObservable,
      builder: (context, snapshot) {
        // CustomSnackBar.of(context).show(snapshot.data?.statusMessage ?? "");
        return const SizedBox();
      },
    );
    StreamBuilder(
      stream: _playSongBloc.loading,
      builder: (context, snapshot) {
        return const SizedBox();
      },
    );
  }

  Widget _playSongBody() {
    return StreamBuilder(
      stream: _playSongBloc.songStreamObservable,
      builder: (context, snapshot) {
        _streamUrl = snapshot.data ?? "";
        if (_streamUrl.isEmpty) {
          return Center(
              child: CircularProgressIndicator(color: AppColor.green06C149));
        }
        _playSong();
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _information(),
                    const SizedBox(height: Sizes.size16),
                    Container(
                      height: Sizes.size1,
                      margin:
                          const EdgeInsets.symmetric(horizontal: Sizes.size20),
                      color: Colors.black12,
                    ),
                    const SizedBox(height: Sizes.size16),
                    _seekBar(),
                    const SizedBox(height: Sizes.size16),
                    _controllerActions(),
                    const SizedBox(height: Sizes.size8),
                    _additionalActions(),
                  ],
                ),
              ),
            ),
            Container(
                color: Colors.white,
                padding: EdgeInsets.only(
                    top: Sizes.size4, bottom: context.safeBottomPadding),
                child: _lyrics()),
          ],
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
            borderRadius: BorderRadius.circular(Sizes.size200),
            child: Image.network(
              widget.song.thumbnailM ??
                  "https://api.lorem.space/image/album?w=250&h=250",
              width: Sizes.size250,
              height: Sizes.size250,
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
            child: Text(
              widget.song.title ?? "",
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: Sizes.size16),
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: Sizes.size18,
              color: Colors.black,
            ),
            child: Text(
              widget.song.artistsNames ?? "",
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _seekBar() {
    return StreamBuilder(
      stream: _audioPlayer.positionStream,
      builder: (context, snapshot) {
        final currentDuration = snapshot.data ?? Duration.zero;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: Sizes.size20),
          child: ProgressBar(
            progress: currentDuration,
            total: Duration(seconds: widget.song.duration ?? 0),
            thumbColor: AppColor.green06C149,
            baseBarColor: Colors.grey[200],
            progressBarColor: AppColor.green47e77e,
            barHeight: Sizes.size8,
            timeLabelPadding: Sizes.size16,
            timeLabelTextStyle: const TextStyle(
              fontSize: Sizes.size14,
              color: Colors.black,
            ),
            onSeek: (duration) {
              _seekTo(duration.inSeconds);
              //  _playSongBloc.currentDuration.sink.add(duration.inSeconds);
            },
          ),
        );
      },
    );
  }

  Widget _controllerActions() {
    return StreamBuilder(
      stream: _audioPlayer.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final isPlaying = playerState?.playing == true;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.skip_previous_rounded),
              iconSize: Sizes.size32,
              color: Colors.black,
              onPressed: () => {},
            ),
            IconButton(
              icon: const Icon(Icons.replay_10_rounded),
              iconSize: Sizes.size32,
              color: Colors.black,
              onPressed: () => {
                _audioPlayer.seek(
                    Duration(seconds: _audioPlayer.position.inSeconds - 10))
              },
            ),
            IconButton(
              icon: Icon(isPlaying
                  ? Icons.pause_circle_filled_rounded
                  : Icons.play_circle_fill_rounded),
              iconSize: Sizes.size72,
              color: AppColor.green06C149,
              onPressed: () async {
                if (isPlaying) {
                  _pause();
                } else {
                  await _audioPlayer.seek(_audioPlayer.position);
                  await _audioPlayer.play();
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.forward_10_rounded),
              iconSize: Sizes.size32,
              color: Colors.black,
              onPressed: () => {
                _audioPlayer.seek(
                    Duration(seconds: _audioPlayer.position.inSeconds + 10))
              },
            ),
            IconButton(
              icon: const Icon(Icons.skip_next_rounded),
              iconSize: Sizes.size32,
              color: Colors.black,
              onPressed: () => {},
            ),
          ],
        );
      },
    );
  }

  Widget _additionalActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: const Icon(Icons.timer_outlined),
          iconSize: Sizes.size28,
          color: Colors.black,
          onPressed: () => {},
        ),
        IconButton(
          icon: const Icon(Icons.cast_rounded),
          iconSize: Sizes.size28,
          color: Colors.black,
          onPressed: () => {},
        ),
        IconButton(
          icon: const Icon(Icons.share_rounded),
          iconSize: Sizes.size28,
          color: Colors.black,
          onPressed: () => {},
        ),
        IconButton(
          icon: const Icon(Icons.more_vert_rounded),
          iconSize: Sizes.size28,
          color: Colors.black,
          onPressed: () => {},
        ),
      ],
    );
  }

  Widget _lyrics() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Icon(Icons.keyboard_arrow_up_rounded),
        DefaultTextStyle(
          style: TextStyle(
            fontSize: Sizes.size18,
            color: Colors.black,
          ),
          child: Text("Lyrics"),
        ),
      ],
    );
  }
}
