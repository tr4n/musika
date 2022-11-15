class ArtistItemResponse {
  String? id;
  String? name;
  bool? spotlight;
  String? alias;
  String? thumbnail;
  String? thumbnailM;
  bool? isOA;
  bool? isOABrand;
  String? playlistId;
  int? totalFollow;

  ArtistItemResponse(
      {this.id,
      this.name,
      this.spotlight,
      this.alias,
      this.thumbnail,
      this.thumbnailM,
      this.isOA,
      this.isOABrand,
      this.playlistId,
      this.totalFollow});

  ArtistItemResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    spotlight = json['spotlight'];
    alias = json['alias'];
    thumbnail = json['thumbnail'];
    thumbnailM = json['thumbnailM'];
    isOA = json['isOA'];
    isOABrand = json['isOABrand'];
    playlistId = json['playlistId'];
    totalFollow = json['totalFollow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['spotlight'] = spotlight;
    data['alias'] = alias;
    data['thumbnail'] = thumbnail;
    data['thumbnailM'] = thumbnailM;
    data['isOA'] = isOA;
    data['isOABrand'] = isOABrand;
    data['playlistId'] = playlistId;
    data['totalFollow'] = totalFollow;
    return data;
  }
}
