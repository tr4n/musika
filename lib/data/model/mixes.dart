import 'package:musium/data/platform/network/response/mixes_response.dart';

import 'models.dart';

class Mixes {
  String? title;
  List<Mix>? items;

  Mixes({this.items, this.title});

  factory Mixes.fromResponse(MixesResponse response) {
    return Mixes(title: response.title, items: response.items);
  }
}
