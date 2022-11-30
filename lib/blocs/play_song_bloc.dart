import 'package:collection/collection.dart';
import 'package:musium/base/base.dart';
import 'package:musium/data/platform/network/response/error_response.dart';
import 'package:musium/data/repository/repositories.dart';
import 'package:musium/di/locator.dart';
import 'package:rxdart/rxdart.dart';

import '../data/model/models.dart';

class PlaySongBloc extends BaseBloc {
  final _zingRepository = locator<ZingRepository>();

  final _detailPlaylist = PublishSubject<DetailPlaylist>();
  final _songInfo = PublishSubject<SongInfo>();
  final currentDuration = PublishSubject<int>();

  Stream<int> get currentDurationObservable => currentDuration.stream;

  Stream<DetailPlaylist> get detailPlayListObservable => _detailPlaylist.stream;

  Stream<SongInfo> get songInfoObservable => _songInfo.stream;

  void getSongData(String encodeId) async {
    runCatching(() async {
      loading.sink.add(true);

      final songStreamResponse = await _zingRepository.getSongStream(encodeId);
      final songInfoResponse = await _zingRepository.getSongInfo(encodeId);
      final lyricResponse = await _zingRepository.getSongLyric(encodeId);
      final artistId = songInfoResponse.data?.artists?.firstOrNull?.id;
      final artistSongs =
          await _zingRepository.getArtistSongList("IWZAEAC0", 1, 20);

      final stream = songStreamResponse.data?.s128 ?? "";
      final song = songInfoResponse.data;
      if (stream.isEmpty || song == null) {
        loading.sink.add(false);
        addError(ErrorResponse(message: "Data is not available"));
        return;
      }
      loading.sink.add(false);
      _songInfo.sink.add(SongInfo(song, stream));
    });
  }
}
