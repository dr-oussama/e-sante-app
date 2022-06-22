import 'dart:convert';

import 'package:http/http.dart' as http;

import 'video.dart';

class VideoApi {
  static Future<List<Videos>> getVideos() async {
    final url = Uri.parse('http://192.168.43.231/hepius/getVideo.php');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List video = json.decode(response.body);

      return video.map((json) => Videos.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }

}