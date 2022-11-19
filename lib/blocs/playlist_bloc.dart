import 'package:musium/base/base.dart';
import 'package:musium/data/platform/network/response/error_response.dart';
import 'package:musium/data/repository/repositories.dart';
import 'package:musium/di/locator.dart';
import 'package:rxdart/rxdart.dart';

import '../data/model/models.dart';

class PlaylistBloc extends BaseBloc {
  final _zingRepository = locator<ZingRepository>();

  final _detailPlaylist = PublishSubject<DetailPlaylist>();

  Stream<DetailPlaylist> get detailPlaylistObservable => _detailPlaylist.stream;

  void getDetailPlaylist(String encodeId) async {
    runCatching(() async {
      loading.sink.add(true);
      final detailResponse = await _zingRepository.getDetailPlaylist(encodeId);
      final detail = detailResponse.data;
      if (detail == null) {
        loading.sink.add(false);
        addError(ErrorResponse(message: "Data is not available"));
        return;
      }
      loading.sink.add(false);
      _detailPlaylist.sink.add(detail);
    });
  }
}
