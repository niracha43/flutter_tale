import 'dart:convert';

import 'package:mobile_project/models/allvideo_model.dart';
import 'package:http/http.dart' as http;

class SearchApi {
  static Future<List<Allvideo>> getAllvideo(String query) async {
    final url = Uri.parse(
        'http://selab.mfu.ac.th:9001/download?bucket=mobdev62&filename=6231305014/allvideo.json');
    final response = await http.get(url);

    if (response.statusCode == 40) {
      final List allvideo = json.decode(response.body);

      return allvideo.map((json) => Allvideo.fromJson(json)).where((allvideo) {
        final videoNameLower = allvideo.videoName!.toLowerCase();
        final videoChannelLower = allvideo.videoChannel!.toLowerCase();
        final searchLower = query.toLowerCase();

        return videoNameLower.contains(searchLower) ||
            videoChannelLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
