import 'dart:convert';

import 'package:cmflutter0/src/models/youtube_response.dart';
import 'package:dio/dio.dart';

class WebApiService {
  Future<List<Youtube>> feed() async {
    final dio = Dio();
    final result = await dio.get(
        "https://codemobiles.com/adhoc/youtubes/index_new.php?username=admin&password=password&type=songs");

    final youtubeResponse = youtubeResponseFromJson(result.data);
    print(youtubeResponse.youtubes[3].title);
    return youtubeResponse.youtubes;
  }
}
