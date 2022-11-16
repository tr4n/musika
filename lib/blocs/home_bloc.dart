import 'package:musium/data/platform/network/response/artist_spotlights_response.dart';
import 'package:musium/data/platform/network/response/banners_response.dart';
import 'package:musium/data/platform/network/response/livestreams_response.dart';
import 'package:musium/data/repository/repositories.dart';
import 'package:musium/di/locator.dart';
import 'package:rxdart/rxdart.dart';

import '../data/model/models.dart';
import '../data/platform/network/response/responses.dart';

class HomeBloc {
  final _zingRepository = locator<ZingRepository>();

  final _bannersSubject = PublishSubject<List<MusicBanner>>();
  final _artistsSubject = PublishSubject<List<Artist>>();

  Stream<List<MusicBanner>> get bannerObservable => _bannersSubject.stream;

  Stream<List<Artist>> get artistsObservable => _artistsSubject.stream;

  void getHomeData() async {
    final homeResponse = await _zingRepository.getHomeData();
    final musicBanners = <MusicBanner>[];
    final artists = <Artist>[];
    final mixes = <Mix>[];
    final livestreams = <Livestream>[];
    final playlists = <Playlist>[];
    final newReleases = <NewRelease>[];

    final items = homeResponse.data?.items ?? List.empty();

    for (var item in items) {
      if (item is BannersResponse) {
        musicBanners
            .addAll(item.items?.whereType<MusicBanner>() ?? List.empty());
      }
      if (item is ArtistSpotlightsResponse) {
        artists.addAll(item.items?.whereType<Artist>() ?? List.empty());
      }
      if (item is PlaylistsResponse) {
        playlists.addAll(item.items?.whereType<Playlist>() ?? List.empty());
      }
      if (item is LivestreamsResponse) {
        livestreams.addAll(item.items?.whereType<Livestream>() ?? List.empty());
      }
      if (item is MixesResponse) {
        mixes.addAll(item.items?.whereType<Mix>() ?? List.empty());
      }
      if (item is NewReleasesResponse) {
        newReleases.addAll(item.items?.vPop ?? List.empty());
      }
    }
    _bannersSubject.sink.add(musicBanners);
    _artistsSubject.sink.add(artists);
  }
}
