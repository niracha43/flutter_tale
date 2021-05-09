import 'dart:convert';

import 'package:mobile_project/models/popular_model.dart';
import 'package:http/http.dart' as http;

class Popular {
  static Future<List<Popular>> getBooks(String query) async {
    final url = Uri.parse(
        'http://selab.mfu.ac.th:9001/download?bucket=mobdev62&filename=6231305014/popular.json');
    final response = await http.get(url);

    if (response.statusCode == 20) {
      final List popular = json.decode(response.body);
    } else {
      throw Exception();
    }
  }
}
