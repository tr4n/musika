import 'package:musium/base/base.dart';
import 'package:musium/data/model/artist/artist_song_list.dart';
import 'package:musium/data/model/artist/detail_artist.dart';
import 'package:musium/data/platform/network/response/artist_song_list_response.dart';
import 'package:musium/data/platform/network/response/detail_artist_response.dart';
import 'package:musium/data/platform/network/response/error_response.dart';
import 'package:musium/data/repository/repositories.dart';
import 'package:musium/di/locator.dart';
import 'package:rxdart/rxdart.dart';

import '../data/model/models.dart';

class ArtistBloc extends BaseBloc {
  final _zingRepository = locator<ZingRepository>();

  final _detailArtist = PublishSubject<DetailArtist>();
  final _artistSongList = PublishSubject<ArtistSongList>();

  Stream<DetailArtist> get detailArtistObservable => _detailArtist.stream;
  Stream<ArtistSongList> get artistSongListObservable => _artistSongList.stream;

  void getDetailArtist(String alias) async {
    runCatching(() async {
      loading.sink.add(true);
      DetailArtistResponse detailArtistResponse =
          await _zingRepository.getDetailArtist(alias);
      final detailArtist = detailArtistResponse.data;
      if (detailArtist == null) {
        loading.sink.add(false);
        addError(ErrorResponse(message: "Data is not available"));
        return;
      }

      ArtistSongListResponse artistSongListResponse =
          await _zingRepository.getArtistSongList(detailArtist.id ?? "", 1, 50);

      loading.sink.add(false);
      _detailArtist.sink.add(detailArtist);
    });
  }
}
