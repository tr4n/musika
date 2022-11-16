import 'package:musium/data/platform/network/api/api.dart';

import '../platform/network/response/responses.dart';

class ZingRepository {
  final ZingMp3Api _api;

  ZingRepository(this._api);

  Future<HomeResponse> getHomeData() async {
    return _api.getHomeData();
  }
}
