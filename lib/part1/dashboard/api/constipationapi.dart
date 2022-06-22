import 'dart:convert';

import 'package:hepius/part1/dashboard/api/constipation.dart';
import 'package:http/http.dart' as http;

class ConstipationsApi {
  static Future<List<Constipation>> getConstipations(String cure) async {
    final url = Uri.parse('http://192.168.43.231/pfe/constipation.php?id_cure='+cure+'');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List constipation = json.decode(response.body);

      return constipation.map((json) => Constipation.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }
}