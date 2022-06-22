import 'dart:convert';
import 'package:hepius/part1/dashboard/api/generalstate.dart';
import 'package:http/http.dart' as http;

class GeneralstateApi {
  static Future<List<Generalstate>> getGeneralstate(String IP) async {
    final url = Uri.parse('http://192.168.43.231/pfe/generalstate.php?IP='+IP+'');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List generalstate = json.decode(response.body);

      return generalstate.map((json) => Generalstate.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }

}