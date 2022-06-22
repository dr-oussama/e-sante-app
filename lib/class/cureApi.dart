import 'dart:convert';
import 'package:http/http.dart' as http;
import 'cure.dart';

class CureApi {
  static Future<List<Cure>> getOneCure(String? IP) async {
    final url = Uri.parse('http://192.168.43.231/hepius/onecure.php?ip=$IP');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List cure = json.decode(response.body);

      return cure.map((json) => Cure.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }

  static Future<List<Cure>> getCures(String? IP) async {
    final url = Uri.parse('http://192.168.43.231/hepius/cure.php?ip=$IP');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List cure = json.decode(response.body);

      return cure.map((json) => Cure.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }
}