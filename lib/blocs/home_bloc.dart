import 'package:musium/data/repository/repositories.dart';
import 'package:musium/di/locator.dart';
import 'package:rxdart/rxdart.dart';

import '../data/model/models.dart';

class HomeBloc {
  final _zingRepository = locator<ZingRepository>();

  final _bannersSubject = PublishSubject<List<Banners>>();
  final _artistsSubject = PublishSubject<List<ArtistSpotlights>>();
  final _newReleasesSubject = PublishSubject<List<NewReleases>>();
  final _playlistsSubject = PublishSubject<List<Playlists>>();
  final _mixesListSubject = PublishSubject<List<Mixes>>();

  Stream<List<Banners>> get bannersObservable => _bannersSubject.stream;

  Stream<List<ArtistSpotlights>> get artistsObservable =>
      _artistsSubject.stream;

  Stream<List<Playlists>> get playlistsObservable => _playlistsSubject.stream;

  Stream<List<Mixes>> get mixesObservable => _mixesListSubject.stream;

  Stream<List<NewReleases>> get newReleasesObservable =>
      _newReleasesSubject.stream;

  void getHomeData() async {
    final homeResponse = await _zingRepository.getHomeData();
    final bannersList = <Banners>[];
    final artistsList = <ArtistSpotlights>[];
    final mixesList = <Mixes>[];
    final livestreamsList = <Livestreams>[];
    final playlistsList = <Playlists>[];
    final newReleasesList = <NewReleases>[];

    final items = homeResponse.data?.items ?? List.empty();

    for (var item in items) {
      if (item is Banners) {
        bannersList.add(item);
      }
      if (item is ArtistSpotlights) {
        artistsList.add(item);
      }
      if (item is Playlists) {
        playlistsList.add(item);
      }
      if (item is Livestreams) {
        livestreamsList.add(item);
      }
      if (item is Mixes) {
        mixesList.add(item);
      }
      if (item is NewReleases) {
        newReleasesList.add(item);
      }
    }
    print("artists: ${artistsList}");
    _bannersSubject.sink.add(bannersList);
    _artistsSubject.sink.add(artistsList);
    _newReleasesSubject.sink.add(newReleasesList);
    _playlistsSubject.sink.add(playlistsList);
    _mixesListSubject.sink.add(mixesList);
  }
}
