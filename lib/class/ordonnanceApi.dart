import 'dart:convert';

import 'package:http/http.dart' as http;

import 'ordonnance.dart';

class OrdApi {
  static Future<List<Ord>> getOrds(String? ip) async {
    final url = Uri.parse('http://192.168.43.231/hepius/getOrd.php?ip=$ip');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List ord = json.decode(response.body);

      return ord.map((json) => Ord.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }

}