import '../../../../extension/collection_ext.dart';
import 'responses.dart';

class ArtistSpotlightsResponse extends HomeItemDataResponse {
  List<Artist>? items;

  ArtistSpotlightsResponse({this.items});

  ArtistSpotlightsResponse.fromJson(Map<String, dynamic> json) {
    sectionType = json['sectionType'];
    title = json['title'];
    items = cast<List<dynamic>>(json["items"])
        ?.map((e) => Artist.fromJson(e))
        .toList();
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data["items"] = items?.map((e) => e.toJson()).toList();
    return data;
  }
}
