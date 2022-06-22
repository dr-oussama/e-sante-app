import 'dart:convert';
import 'package:hepius/part1/dashboard/api/cure.dart';
import 'package:http/http.dart' as http;

class CureApi {
  static Future<List<Cure>> getCures(String IP) async {
    final url = Uri.parse('http://192.168.43.231/pfe/cure.php?IP='+IP+'');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List cure = json.decode(response.body);

      return cure.map((json) => Cure.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }

}