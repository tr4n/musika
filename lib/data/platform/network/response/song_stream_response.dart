import 'package:musium/data/model/song/song_stream.dart';
import 'base_response.dart';

class SongStreamResponse extends ZingResponse<SongStream> {
  SongStreamResponse.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    data = json['data'] != null ? SongStream.fromJson(json['data']) : null;
  }
}
