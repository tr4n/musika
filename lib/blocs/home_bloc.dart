import 'package:musium/data/model/mixes.dart';
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
  final _newReleasesSubject = PublishSubject<List<NewRelease>>();
  final _playlistsSubject = PublishSubject<List<Playlists>>();
  final _mixesListSubject = PublishSubject<List<Mixes>>();

  Stream<List<MusicBanner>> get bannerObservable => _bannersSubject.stream;

  Stream<List<Artist>> get artistsObservable => _artistsSubject.stream;

  Stream<List<Playlists>> get playlistsObservable => _playlistsSubject.stream;

  Stream<List<Mixes>> get mixesObservable => _mixesListSubject.stream;

  Stream<List<NewRelease>> get newReleasesObservable =>
      _newReleasesSubject.stream;

  void getHomeData() async {
    final homeResponse = await _zingRepository.getHomeData();
    final musicBanners = <MusicBanner>[];
    final artists = <Artist>[];
    final mixesList = <Mixes>[];
    final livestreams = <Livestream>[];
    final playlistsList = <Playlists>[];
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
        playlistsList.add(Playlists.fromResponse(item));
      }
      if (item is LivestreamsResponse) {
        livestreams.addAll(item.items?.whereType<Livestream>() ?? List.empty());
      }
      if (item is MixesResponse) {
        mixesList.add(Mixes.fromResponse(item));
      }
      if (item is NewReleasesResponse) {
        newReleases.addAll(item.items?.all ?? List.empty());
      }
    }
    _bannersSubject.sink.add(musicBanners);
    _artistsSubject.sink.add(artists);
    _newReleasesSubject.sink.add(newReleases);
    _playlistsSubject.sink.add(playlistsList);
    _mixesListSubject.sink.add(mixesList);
  }
}
